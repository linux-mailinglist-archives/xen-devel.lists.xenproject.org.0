Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4650F5AADEF
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 13:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397562.638181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU5KA-00075N-N3; Fri, 02 Sep 2022 11:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397562.638181; Fri, 02 Sep 2022 11:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU5KA-00072E-Jj; Fri, 02 Sep 2022 11:59:02 +0000
Received: by outflank-mailman (input) for mailman id 397562;
 Fri, 02 Sep 2022 11:59:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gCtF=ZF=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oU5K9-00071u-B2
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 11:59:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2064.outbound.protection.outlook.com [40.107.21.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a043e920-2ab6-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 13:58:58 +0200 (CEST)
Received: from AM0PR07CA0003.eurprd07.prod.outlook.com (2603:10a6:208:ac::16)
 by PAXPR08MB6512.eurprd08.prod.outlook.com (2603:10a6:102:15a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 2 Sep
 2022 11:58:51 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:ac:cafe::41) by AM0PR07CA0003.outlook.office365.com
 (2603:10a6:208:ac::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.6 via Frontend
 Transport; Fri, 2 Sep 2022 11:58:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 11:58:50 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Fri, 02 Sep 2022 11:58:50 +0000
Received: from bd71d2ee0a7f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A78A5507-D4AE-4D33-B544-FFC88ECA7CB0.1; 
 Fri, 02 Sep 2022 11:58:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bd71d2ee0a7f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 11:58:44 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Fri, 2 Sep
 2022 11:58:42 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::d889:1b83:c030:8d71]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::d889:1b83:c030:8d71%7]) with mapi id 15.20.5588.011; Fri, 2 Sep 2022
 11:58:42 +0000
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
X-Inumbo-ID: a043e920-2ab6-11ed-934f-f50d60e1c1bd
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XQ7OEeEoREn73oihf2L6Ix35CT8HZ4Rm4Jap4+heFz7REvw/LFS0o0223llqs47dtAKHJ591GMRK7/Tmx6/sOEWvTezpLZrm9RSvsLIjLdyiiYc5f8lkGQ/Kk9ZNOXygR5dq2yVz1YbRZSnUqgHoZtD7/gMjbAOEgEQ5yV4TpC4OYMbuWL+uRrF9meYt4oDnsKU1jyCCHPQCa6MEiK++e/X1WGbPLEngHAJXril2G4O081H/n/1NiJe0zFHPbaszlcYbLst9Om43VRhOLV9B6JTcLqWvUogDkSfC5F2dmJ8XxxS9Wryoms4yLFnlAaZf9qF6mFxp8PuzVDJyaSEuOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1XIQ99yLPhFQhFR+ChrOwNK5D+LuNmADhPaJPc1LWQ=;
 b=hgzdVvCqa0twL5lm8M+dJzygeGKsJUUt8BH6swhFNaEPz6FG+E9FwDhfkZ8xA/iAO7kd3JjGcPr5wh+dGpeURg92xtWvQvRy49+TLXPYwx/vBk/VCudVG6ab64y4sAAsC5v0tII+DJT0UQlzbbrzS1dY3c/mvWD9O1h7kSQszt/fJ2xefIwkTLdMnYCG6Jz9C8oKPlAAhW37bfvVP504H6BfQWt5QDkWBucHbQS98XCYwf0xvzl+FY01S9duNzwbEGO2WX41tOzTePn4hlP0AwHx5ZlFBVCq3b+EbjdxHjpSQ9nut0iov8OkgPq292R7kkVQBO1RIGsJBKy2PoNKqA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1XIQ99yLPhFQhFR+ChrOwNK5D+LuNmADhPaJPc1LWQ=;
 b=3xIlBxHkaGNn37qf54RCuh28Dw53LyQMvvUC9Y/nB1br/EhV2TNShC4AA8KWQece9gE8EBh0v0/ZWXazOIQ+iL54eeqqGHW5dEIlgsfkb63Y7EcYi2Sg+WM0bhwzAEcEAc0RNEw7h0k2ViqE+0vTqlBjS9m+D6zpVh1hsUScoKQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7e68ca5e3f4bd74b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmTzEj7WPvktmi0ahVlmqKK19UTP8s8pjpDHz93Fk/MzmppFTlN04ZxcPnhU5izzUMaTUWUvP3U/sUY2/RhrygjGS6DS3sokh/NWLXEG8nMpCQdckLxgw9sVC98qAG5rpsZPs6D4Fd3kEZrLm8GFezBYsRXOWnn1fVnbjEyTJVHlSyQ4YKZ90XLVCgBJGJ0E1h2fLquGTKsOf/04BT/RyZw16L0DT+jBfB93/t+4qRzy6SW47lFDFeuH/wfTFzfhpgrihmIBU9accyO+fARd6iHRLsTRhGHR2ZdIbQmfvruDw/pBlWMgBMioQV1EYUdHW7pQYNNA+cP6Sm2J8eyPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1XIQ99yLPhFQhFR+ChrOwNK5D+LuNmADhPaJPc1LWQ=;
 b=BFuSyuAIpQqgL6fAzti21I+geN+dKGnco9NnqGlaD07F7pg56UeP5PenVigKzG1kiJxLqng35rhgzEakOys8KSmNpAqNH9cei03UiRCsgcjAv7ky6KyoF0Mwmeqtd6/O1pEjLaR4PDcqLDKVVTotfokUSW+0Ii6T2QUlUcMOL+KoZzegwfmIl2CKRuGslb0MtiXSjKMWQRJV4HvbAYeBmY5tgrR92evLJxK6ebnffAegQkyy14iFCLyR62dPyFet9tWygn1fviiYYsqJ+tlMyPfPcTHyPNcVETi57zXyU6haGmlU9A+2rXnwzBXzVXeNjXCc+S8o148SwQWYc3N20g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1XIQ99yLPhFQhFR+ChrOwNK5D+LuNmADhPaJPc1LWQ=;
 b=3xIlBxHkaGNn37qf54RCuh28Dw53LyQMvvUC9Y/nB1br/EhV2TNShC4AA8KWQece9gE8EBh0v0/ZWXazOIQ+iL54eeqqGHW5dEIlgsfkb63Y7EcYi2Sg+WM0bhwzAEcEAc0RNEw7h0k2ViqE+0vTqlBjS9m+D6zpVh1hsUScoKQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen development discussion <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [for-4.17 2/3] automation: qemu-smoke-arm64: Silence ifconfig
 error messages
Thread-Topic: [for-4.17 2/3] automation: qemu-smoke-arm64: Silence ifconfig
 error messages
Thread-Index: AQHYvpsHo7uRLr+x2k++nrEtWQ42s63MCXmA
Date: Fri, 2 Sep 2022 11:58:42 +0000
Message-ID: <06411D8B-A659-4C5D-A942-3EF45FFE8ED8@arm.com>
References: <20220902070905.1262-1-michal.orzel@amd.com>
 <20220902070905.1262-3-michal.orzel@amd.com>
In-Reply-To: <20220902070905.1262-3-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9078a609-73d6-4d3c-8877-08da8cda8056
x-ms-traffictypediagnostic:
	DB8PR08MB5481:EE_|VE1EUR03FT044:EE_|PAXPR08MB6512:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Sh77IBlov0SEaoqluzVTGVALJ/AGIDcFDHEoZ0VVFXNnxyLzC26JyD99JgA4I0QueIfpUcHmISc3jR6bMYOeIXZlBt/HpN5Za4/C8afJ3HBc6JVwn/2tXTiJZS9n8Mt1+hAoNhZMCy8FoxsbXtlI1bmS82tsLPMCP+N2ayQeoQhRXm4BiYLPnTsMj88/Kc3H5WXAwAMUBf0xW0P9USAEKDzDevb3Fmiy5b2ZJDVrboYprPCFTjyvy2vPBdwAmHy6im7G/g89Cnsn7SXhrB+U/PrwSqejx+ofIlThtb/m07ImdVLnXBn8tlmzvKPTwtWb2IJzPKVZeZtRxxx8/ao/pzonZrQscLUe5gSu2DwBxP3ZCgDBR0uQdq1nfyMeCz9qavza+x/aPAOg0zR2ErO0i16XRhmKBuQMr2XDBJi52+WPCjxXa3TAwJ5hGmQLUeHdGdiIT1gz3M313Okh+NP7v4JNUz0gZqXqap51Or9CtmQu+dj3Pw4ykCFcyEmIhdTe3Ex8HnYzFJgjZR4ZsIZ7pu3DRr7/SOdgWAW7s5cp1OLqcLR1stAEPSu8TqgH5ERJToNf++L8SeVI7yC++IAF44jKydn75m+i+zvnzSiwaP2Fr+i4MzBEBFylFLo6iGjSy7ii/ti+3uKdpMvxv4LAr/isMazzR1H7ry2v3XPJ9gzONZ6tC89G+FmTv24NCLBwTF4Oe1PSpKn8gdfrVqJqw2IeKEFh+KzH2VvzLK7p8y3bYEo5rttQeSK4ceUV5MP1TRbRd7TzpHWUfODUl0K5z0iHr0XeI65Psn5Z/h5lOnY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(91956017)(76116006)(86362001)(66476007)(38100700002)(66946007)(66446008)(8676002)(66556008)(64756008)(4326008)(316002)(6506007)(6512007)(54906003)(38070700005)(6916009)(41300700001)(83380400001)(26005)(186003)(53546011)(2616005)(71200400001)(122000001)(478600001)(5660300002)(2906002)(6486002)(4744005)(15650500001)(8936002)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7CB5B513F1B41047BD6E1CF840352FE4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5481
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	61adfa19-c8dc-4d97-7dd4-08da8cda7b0f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qveAB8VOpaPhJu+C2GbflhQh1C5G2bLB6jGA+CsYw5qYLEozvpA0NPP2YGhqM76n34BjPycNYKYjTuFKR12qIkMis7e8lqzYMDmLh9ESQES5bs+C2dtoeiCVOpDQfEs4y0+Fj3bwweSdwN6++dFo5TYPmqphYy0rwWJv0UUlC220xuzRXyefO6BbzqLVAXgzHev4WlW21ttrwjuvjECC3nWsCquTAo7kHS4ikXrrITJoxQ7bYYVuDsVSeWB4ENgMgxndo2n44OFMSWQcaRXruyVwiYjiOcsY1pRqqe4+N21FYyYssUq4W/5dLVJ6dQ3f2M+k4uPv+fjTpfDLgch1C5ult8z2TjXH+iOZZuDpDgIE1jiLB+FEuP0IIP+FCumYmU2O6XxMARvSAkQobRcosnSjrVGiAT91Nf7NEmcfYJjQ+QEXw90t8u+nNVZjyAQ6k9YXhbiJPU/8XkrcbZhF5QRUT9Z95NSrIY2FT2KjKGfwqb7CIekpLbAgA9+Cun7QJA98O/a5m251SJq/Mkzs2Sc0lJJjaGUk6NagvOFQD0IePNxmLULbIG4RNT7jB0ews4N/JcgfiuMzLl7ToEfVcwrKAj34F6iCC5KQFMKXwilJFIordpFy1QKka5Z0FNWLXpen9o30m3ozWRickzGKigbF6l0bJaMjgQQ4AwwoH3knAwtSarKEtf2FDmwUv8LHHqNWyraf6zkor1aFRF0BuEXOclIEOX3l09v/leTUO2P+WCAN8gMm9ZJbummGjLm7/2wz42p5IihE12mr9hOGdA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(396003)(39860400002)(40470700004)(36840700001)(46966006)(86362001)(36860700001)(82310400005)(356005)(82740400003)(40460700003)(40480700001)(81166007)(41300700001)(70586007)(4326008)(478600001)(8676002)(70206006)(6862004)(5660300002)(8936002)(54906003)(6486002)(316002)(47076005)(2616005)(186003)(336012)(33656002)(83380400001)(2906002)(53546011)(26005)(4744005)(107886003)(6512007)(15650500001)(6506007)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 11:58:50.9166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9078a609-73d6-4d3c-8877-08da8cda8056
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6512



> On 2 Sep 2022, at 08:09, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> During the ping test, dom1 tries to assign an ip to eth0 in a loop.
> Before setting up the network interface by dom0, this results in
> printing the following error message several times:
> (XEN) DOM1: ifconfig: SIOCSIFADDR: No such device
>=20
> Silence this by redirecting stderr/stdout to /dev/null as we do not
> care about the output and we should not pollute the log file.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




