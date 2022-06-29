Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7419955F3C2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 05:13:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357494.586072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6O7l-0001DN-Al; Wed, 29 Jun 2022 03:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357494.586072; Wed, 29 Jun 2022 03:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6O7l-0001A8-7Z; Wed, 29 Jun 2022 03:12:17 +0000
Received: by outflank-mailman (input) for mailman id 357494;
 Wed, 29 Jun 2022 03:12:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rlzK=XE=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o6O7j-0001A2-2m
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 03:12:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2053.outbound.protection.outlook.com [40.107.104.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44937ea8-f759-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 05:12:12 +0200 (CEST)
Received: from AM7PR02CA0006.eurprd02.prod.outlook.com (2603:10a6:20b:100::16)
 by AM0PR08MB3412.eurprd08.prod.outlook.com (2603:10a6:208:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 03:12:10 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::45) by AM7PR02CA0006.outlook.office365.com
 (2603:10a6:20b:100::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Wed, 29 Jun 2022 03:12:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 03:12:09 +0000
Received: ("Tessian outbound 879f4da7a6e9:v121");
 Wed, 29 Jun 2022 03:12:08 +0000
Received: from e67e5b16c9e1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B945B161-F1C7-49B8-B0B2-530AE90C7BB1.1; 
 Wed, 29 Jun 2022 03:12:03 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e67e5b16c9e1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Jun 2022 03:12:03 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by DB8PR08MB4137.eurprd08.prod.outlook.com (2603:10a6:10:a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 03:12:01 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8%9]) with mapi id 15.20.5373.017; Wed, 29 Jun 2022
 03:12:01 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 44937ea8-f759-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jhKD6DaZfbgmGdPnaT1Wv3iAfb8muvii8onRbv+ffL2NxvO055qmiFz5FWOlW0qQxv6TB8ImR3Rg9MMofR0Zoyb0gPD6m+SNfSBIto3n4K7Vgif3GtTTiOL+7UISmd7u7EA41SP4vZJqlqU2pYpmbjLKcnoX+//dDJF83MFbtgF1eoYWmJ0BcAZGT+7ANbt0HB4xqFlzsqE/Iemqkc8SWeguiTelTPmBR4YJkv1ytWKkr/x8yrUXw+OjE2pZW6NnbGzqHJ/LrFhsILL05DYERb1PK4osJChBi7VDn8bucbQdgWYEJpOhPaOW2OcdvR29EPzsK9bhZdS5lEIz4LEMmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHbnPXx6i6lC9j4Wm1VPjmIcEPajH8+B1X/q2adN1qI=;
 b=e8GgBkwh9xU1+85nm0E4ZWMsZyLOq+c6CIB0nBaymnRdW5bwDPUlUcU9FkhTguK5zq7cYhHR4ZeFDy9Jan4XaiLoCqTQJ1mT1C/gsM+un8/ayt/7jnvO5WxOvSjzWmZ4GcwoIED7ZCC5k5esytNYc59XTFaQosGm5wqUZ81JZ5pBTvjQZV50uwTaSa8tnvhWP5vGWA9+XC9lLjZCYXEEj69SZrce9ghBM6BhLbUPL+WRm29ZW11suN6T/r5sRjWtn4xAjqFMJXOJKxOL9qsu5Rg2CHXduZA69gKVltmMlXJt5+7SmmXmzu8ZZqqXLLAuR0l348i/iEnJnm1mJ9IgKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHbnPXx6i6lC9j4Wm1VPjmIcEPajH8+B1X/q2adN1qI=;
 b=b9Xvd42w5hyuRbBpdygirzqArpBf6puS5hNhg/uxeEsQ8zLErcJME6GalPjU5VT/5E1DqkY5L18CToEKTcZyE/r2+cPKld3AZtKxfT1g5he1j/bqYpuuc5G3j7tFcVZB1uYIrBa71aTbSphj/jHhWSA22gaQIbU52+3jl/Ci+eA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWFHPXnbGpMVGTzX5cZozjJECZmWrZz7rfP+m6deyZA2a6/UI38jyobjB0EtgoGS0QnImaJfiIzQDU2qnKYFbdsyQy9Fc3uCdDY8sFUPferIOEXoiJAS5jrSHGY1pR9o3eksS67fr2eihUcq21bD1wMJV1GsbgI586GQ2ZSVp4e2M+6iw5f5DcSzW7dOGWcUPJLUUurCvmgUwQLNMm6IXSd/Vu4qb8eLowv8A0ZSoiNdPXZvo0HzfJg7uIstjuZRORXo7MkIYKRoXsjypeMhkyWzcCnUWRk0LgdX2MrG30JRtbTL00NUn43+8HbsL6Z7kahFS16/3D+XgaPbalyfIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHbnPXx6i6lC9j4Wm1VPjmIcEPajH8+B1X/q2adN1qI=;
 b=KsLC/iBW/aUhGJOybX+w+T8R9XLuBVBy1NgsBGwbju80SSfZk4Rv2AsmJHykrH+knlJlPJh6D2RkPJ1gZsXI501zAT0I0iVQ6/ZLRFQdMo2rSdockFG7t9J8mqpSAMSfGpt7gJH9Y7bOloR7+8XKmQb0wQnm4hkCO+tDNRfG7k7cg5I9oUJeyU3gY//d/zTFn4JBxl5xPmz8ogh8k5ByQqJ8g+C5H8gwXEsl8KZCHnyq6OVvpeyYmRLHOkoPfTPhc18t/Dh5poq/XPxqlXFxJ0adYhpq3M3F2m+VlyGiwGIwdydxnz3I5/Zij8CA++8f2fGlLzxQKFS8Mp7dntbEeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHbnPXx6i6lC9j4Wm1VPjmIcEPajH8+B1X/q2adN1qI=;
 b=b9Xvd42w5hyuRbBpdygirzqArpBf6puS5hNhg/uxeEsQ8zLErcJME6GalPjU5VT/5E1DqkY5L18CToEKTcZyE/r2+cPKld3AZtKxfT1g5he1j/bqYpuuc5G3j7tFcVZB1uYIrBa71aTbSphj/jHhWSA22gaQIbU52+3jl/Ci+eA=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v7 7/9] xen/arm: unpopulate memory when domain is static
Thread-Topic: [PATCH v7 7/9] xen/arm: unpopulate memory when domain is static
Thread-Index: AQHYhE/FRuoXPvvK9EWAAAtCUPIrtq1bKxqAgAfcEECAAA7bAIACoRkg
Date: Wed, 29 Jun 2022 03:12:01 +0000
Message-ID:
 <DU2PR08MB732507EFB0CC4FEAA4872B3AF7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
 <20220620024408.203797-8-Penny.Zheng@arm.com>
 <5ac0e46d-2100-331e-b4d2-8fc715973b71@suse.com>
 <DU2PR08MB73255B2995B4692B5D46252FF7B99@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <380b2610-fe2f-6246-e6a4-f0dd8295d488@xen.org>
In-Reply-To: <380b2610-fe2f-6246-e6a4-f0dd8295d488@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CB6DC4AC1B8EF4408F095CBF975E8DCC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2ba2c3d3-a77e-472f-6da4-08da597d275a
x-ms-traffictypediagnostic:
	DB8PR08MB4137:EE_|VE1EUR03FT056:EE_|AM0PR08MB3412:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9nSqAlE6gk8wn9r8tkwX/97HQOrUKn7IjzGCXeiMJ6w5BtzTuZpm1arGyLPboPg2CadMBUgPZvsBIPkacBYd6H4938dh+epZr8ny1PFlW/6IrDFxb6stXsqavARGrTKjxsucNUhrfyDW4vYeC0XYiFhwYFFL5VageVlZwpQtEYIH+bu8RereiTbfrCh+zj0seY1V2nih5b02FITmxKKBIg0BPLau6zjQbj8Fvnf9+jvqcuD9oHGyLPIoWUur26up4rai/cqnAl75qxIfYV7mpgvZN4EEIGEwFVWvinYtuETq0WhsgBhVv+itWfd+XKNSnnkzK308Mgm/Xb4IDBFp+qmJO0Wgt4HwiagxlXatbBI4EJ3X6Vu1wOyqcIc00k01E9uKOxVk1PpZE/pOWBpIXF73FMljY269c9Hvv+LF6JW1FP/PwwNCiSSq7+6Snye1jN6ji0VrdBiZUYX3Vg/rGFnqANNwFGbPbbweXAvoKXvykFVKTyFGkNKH1xZg35zprp2b/46L5Tr2oKjiGnYTR9ygbyDN52fwFhpPkiIpxN2THaSNLFWy55hI9+Wdo1C4mHuRHqoaB8zoWZWGiHXFApUqhnzq47OKh/zHGwo0KQyVBc7lBNXPM7syvRMwhuj+t97CDTL9tv6lQ5jgK/Px/hloD9eHdVNPZ12/sVOHv/WvVjgU/YyY/9NaYEiZ1J8FEsmPrwW795sKCtBHwbrXJ5GptuF5u1WGMdXkJ8y9RFpGlpBKu9Vywusq7a0A2MrVf+qEBHUQ7YwWnBS9vV10+OSPuNO096CE34XnqygtfPA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(38100700002)(122000001)(186003)(8936002)(33656002)(55016003)(2906002)(5660300002)(316002)(83380400001)(110136005)(54906003)(64756008)(86362001)(66476007)(9686003)(38070700005)(52536014)(66556008)(8676002)(66946007)(4326008)(71200400001)(6506007)(7696005)(76116006)(26005)(41300700001)(53546011)(478600001)(66446008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4137
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	72eb29fb-caad-422a-0683-08da597d22b8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2bF/1I3lAgZ9fqLaM9NdNWS94MHB3vN621RY7U2jZ0SPMt3v6MMhYSvqtWG2FKyIvn6/pmGlrnLWcAppim4wBPqII05AfsxtZzepqRYat0hAUAUWe0DapnmdARSYuqaEPv68aORWvezUYbYcXg1UuivlavmSYUfw5NTNaFPI+ZrqN57v/Cx63F5BkP02tvm2aYQUy4jpc2WeT/SDSzRD2AFxVFcmDeZwAuwsMKCKvXn3lBSxxywzdAaxBMgITh6h4YqfQ+yQb54OFA/Y6MIwtgbzTTK9moBVX8ES0YeiCrHLmNaxzp8w9B/xoxjvEK4P2ZVPscgCxIngYTXUOxuJJxkSqN2/FQuAD+MKL+eeeW7lkGHfK13L7TXbbSBeWvxcf67Sc2wv/QlsYtIqI5z2vqP0ofjOK4uLTRuPrM3JmLl+6PIAAusqNth8IYI2gjz+DBv6/qubiiL7dNwNH8ou8xNCfUE+cHpQTPta093DuxYtg6+nXTjMN70EZ8+703SZLgy8PByKGQUxpC1CFApnBgj1Pm0P1cLTVYgpM8CluR0nJSJ2IxR74wK48B6acNbSBubVYhHhdt209qaFN4eUW5Ji7nQ4KVapBhvSqRYBqDodHy1J3rpovKRy6N96O6WTPMZfi7sH4O9wSx4KhhyjU9RmJRsP/dTxg8IFVO1bPavtQ+MPN0HXoUOEpluZIOZUp9JxjJown9qrxZQntnG6+8BpCDRIQa9YgdNq/NjFgN9PhUAKZ2GOyOGieacPTpI9t6Ff/IexwsvYOqnxBJbV5sV5Pkn56gj+u4yUNdRRXcY+58QQ9oylQ/1v6PAeC0yN
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(346002)(136003)(40470700004)(36840700001)(46966006)(336012)(40460700003)(41300700001)(70206006)(26005)(8676002)(47076005)(6506007)(36860700001)(9686003)(110136005)(54906003)(52536014)(33656002)(40480700001)(478600001)(186003)(81166007)(5660300002)(316002)(55016003)(356005)(2906002)(83380400001)(86362001)(70586007)(8936002)(7696005)(4326008)(53546011)(82740400003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 03:12:09.0960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba2c3d3-a77e-472f-6da4-08da597d275a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3412

SGkgSnVsaWVuIGFuZCBKYW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiBTZW50OiBNb25kYXksIEp1bmUgMjcs
IDIwMjIgNjoxOSBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IENjOiBXZWkgQ2hlbiA8V2VpLkNoZW5A
YXJtLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ow0KPiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgeGVu
LQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3
IDcvOV0geGVuL2FybTogdW5wb3B1bGF0ZSBtZW1vcnkgd2hlbiBkb21haW4gaXMNCj4gc3RhdGlj
DQo+IA0KPiANCj4gDQo+IE9uIDI3LzA2LzIwMjIgMTE6MDMsIFBlbm55IFpoZW5nIHdyb3RlOg0K
PiA+IEhpIGphbg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gcHV0
X3N0YXRpY19wYWdlcywgdGhhdCBpcywgYWRkaW5nIHBhZ2VzIHRvIHRoZSByZXNlcnZlZCBsaXN0
LCBpcyBvbmx5DQo+ID4gZm9yIGZyZWVpbmcgc3RhdGljIHBhZ2VzIG9uIHJ1bnRpbWUuIEluIHN0
YXRpYyBwYWdlIGluaXRpYWxpemF0aW9uDQo+ID4gc3RhZ2UsIEkgYWxzbyB1c2UgZnJlZV9zdGF0
aW1lbV9wYWdlcywgYW5kIGluIHdoaWNoIHN0YWdlLCBJIHRoaW5rIHRoZQ0KPiA+IGRvbWFpbiBo
YXMgbm90IGJlZW4gY29uc3RydWN0ZWQgYXQgYWxsLiBTbyBJIHByZWZlciB0aGUgZnJlZWluZyBv
Zg0KPiA+IHN0YXRpY21lbSBwYWdlcyBpcyBzcGxpdCBpbnRvIHR3byBwYXJ0czogZnJlZV9zdGF0
aWNtZW1fcGFnZXMgYW5kDQo+ID4gcHV0X3N0YXRpY19wYWdlcw0KPiANCj4gQUZBSVUsIGFsbCB0
aGUgcGFnZXMgd291bGQgaGF2ZSB0byBiZSBhbGxvY2F0ZWQgdmlhDQo+IGFjcXVpcmVfZG9tc3Rh
dGljX3BhZ2VzKCkuIFRoaXMgY2FsbCByZXF1aXJlcyB0aGUgZG9tYWluIHRvIGJlIGFsbG9jYXRl
ZCBhbmQNCj4gc2V0dXAgZm9yIGhhbmRsaW5nIG1lbW9yeS4NCj4gDQo+IFRoZXJlZm9yZSwgSSB0
aGluayB0aGUgc3BsaXQgaXMgdW5uZWNlc3NhcnkuIFRoaXMgd291bGQgYWxzbyBoYXZlIHRoZQ0K
PiBhZHZhbnRhZ2UgdG8gcmVtb3ZlIG9uZSBsb29wLiBBZG1pdHRseSwgdGhpcyBpcyBub3QgaW1w
b3J0YW50IHdoZW4gdGhlDQo+IG9yZGVyIDAsIGJ1dCBpdCB3b3VsZCBiZWNvbWUgYSBwcm9ibGVt
IGZvciBsYXJnZXIgb3JkZXIgKHlvdSBtYXkgaGF2ZSB0bw0KPiBwdWxsIHRoZSBzdHJ1Y3QgcGFn
ZV9pbmZvIG11bHRpcGxlIHRpbWUgaW4gdGhlIGNhY2hlKS4NCj4gDQoNCkhvdyBhYm91dCB0aGlz
Og0KSSBjcmVhdGUgYSBuZXcgZnVuYyBmcmVlX2RvbXN0YXRpY19wYWdlLCBhbmQgaXQgd2lsbCBi
ZSBsaWtlOg0KIg0Kc3RhdGljIHZvaWQgZnJlZV9kb21zdGF0aWNfcGFnZShzdHJ1Y3QgZG9tYWlu
ICpkLCBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQ0Kew0KICAgIHVuc2lnbmVkIGludCBpOw0KICAg
IGJvb2wgbmVlZF9zY3J1YjsNCg0KICAgIC8qIE5CLiBNYXkgcmVjdXJzaXZlbHkgbG9jayBmcm9t
IHJlbGlucXVpc2hfbWVtb3J5KCkuICovDQogICAgc3Bpbl9sb2NrX3JlY3Vyc2l2ZSgmZC0+cGFn
ZV9hbGxvY19sb2NrKTsNCg0KICAgIGFyY2hfZnJlZV9oZWFwX3BhZ2UoZCwgcGFnZSk7DQoNCiAg
ICAvKg0KICAgICAqIE5vcm1hbGx5IHdlIGV4cGVjdCBhIGRvbWFpbiB0byBjbGVhciBwYWdlcyBi
ZWZvcmUgZnJlZWluZyB0aGVtLA0KICAgICAqIGlmIGl0IGNhcmVzIGFib3V0IHRoZSBzZWNyZWN5
IG9mIHRoZWlyIGNvbnRlbnRzLiBIb3dldmVyLCBhZnRlcg0KICAgICAqIGEgZG9tYWluIGhhcyBk
aWVkIHdlIGFzc3VtZSByZXNwb25zaWJpbGl0eSBmb3IgZXJhc3VyZS4gV2UgZG8NCiAgICAgKiBz
Y3J1YiByZWdhcmRsZXNzIGlmIG9wdGlvbiBzY3J1Yl9kb21oZWFwIGlzIHNldC4NCiAgICAgKi8N
CiAgICBuZWVkX3NjcnViID0gZC0+aXNfZHlpbmcgfHwgc2NydWJfZGVidWcgfHwgb3B0X3NjcnVi
X2RvbWhlYXA7DQoNCiAgICBmcmVlX3N0YXRpY21lbV9wYWdlcyhwYWdlLCAxLCBuZWVkX3NjcnVi
KTsNCg0KICAgIC8qIEFkZCBwYWdlIG9uIHRoZSByZXN2X3BhZ2VfbGlzdCAqYWZ0ZXIqIGl0IGhh
cyBiZWVuIGZyZWVkLiAqLw0KICAgIHB1dF9zdGF0aWNfcGFnZShkLCBwYWdlKTsNCg0KICAgIGRy
b3BfZG9tX3JlZiA9ICFkb21haW5fYWRqdXN0X3RvdF9wYWdlcyhkLCAtMSk7DQoNCiAgICBzcGlu
X3VubG9ja19yZWN1cnNpdmUoJmQtPnBhZ2VfYWxsb2NfbG9jayk7DQoNCiAgICBpZiAoIGRyb3Bf
ZG9tX3JlZiApDQogICAgICAgIHB1dF9kb21haW4oZCk7DQp9DQoiDQoNCkluIGZyZWVfZG9taGVh
cF9wYWdlcywgd2UganVzdCBjYWxsIGZyZWVfZG9tc3RhdGljX3BhZ2U6DQoNCiINCkBAIC0yNDMw
LDYgKzI0MzAsOSBAQCB2b2lkIGZyZWVfZG9taGVhcF9wYWdlcyhzdHJ1Y3QgcGFnZV9pbmZvICpw
ZywgdW5zaWduZWQgaW50IG9yZGVyKQ0KDQogICAgIEFTU0VSVF9BTExPQ19DT05URVhUKCk7DQoN
CisgICAgaWYgKCB1bmxpa2VseShwZy0+Y291bnRfaW5mbyAmIFBHQ19zdGF0aWMpICkNCisgICAg
ICAgIHJldHVybiBmcmVlX2RvbXN0YXRpY19wYWdlKGQsIHBnKTsNCisNCiAgICAgaWYgKCB1bmxp
a2VseShpc194ZW5faGVhcF9wYWdlKHBnKSkgKQ0KICAgICB7DQogICAgICAgICAvKiBOQi4gTWF5
IHJlY3Vyc2l2ZWx5IGxvY2sgZnJvbSByZWxpbnF1aXNoX21lbW9yeSgpLiAqLw0KQEAgLTI2NzMs
NiArMjY3NiwzOCBAQCB2b2lkIGZyZWVfc3RhdGljbWVtX3BhZ2VzKHN0cnVjdCBwYWdlX2luZm8g
KnBnLCB1bnNpZ25lZCBsb25nIG5yX21mbnMsDQoiDQoNClRoZW4gdGhlIHNwbGl0IGNvdWxkIGJl
IGF2b2lkZWQgYW5kIHdlIGNvdWxkIHNhdmUgdGhlIGxvb3AgYXMgbXVjaCBhcyBwb3NzaWJsZS4N
CkFueSBzdWdnZXN0aW9uPyANCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwN
Cg==

