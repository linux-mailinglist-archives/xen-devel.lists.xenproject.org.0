Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E6D5B1810
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 11:09:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402957.644899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDX5-0001fC-QF; Thu, 08 Sep 2022 09:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402957.644899; Thu, 08 Sep 2022 09:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDX5-0001br-MN; Thu, 08 Sep 2022 09:09:11 +0000
Received: by outflank-mailman (input) for mailman id 402957;
 Thu, 08 Sep 2022 09:09:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymCA=ZL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oWDX4-0001bl-Lg
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 09:09:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e54e2c2c-2f55-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 11:09:08 +0200 (CEST)
Received: from AM6PR01CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::30) by AM0PR08MB5379.eurprd08.prod.outlook.com
 (2603:10a6:208:182::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 8 Sep
 2022 09:09:06 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::36) by AM6PR01CA0053.outlook.office365.com
 (2603:10a6:20b:e0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Thu, 8 Sep 2022 09:09:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 09:09:05 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Thu, 08 Sep 2022 09:09:05 +0000
Received: from 0cb3b0350997.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 43D30377-9493-4E70-9851-0BE38D80175D.1; 
 Thu, 08 Sep 2022 09:08:54 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0cb3b0350997.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Sep 2022 09:08:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB8170.eurprd08.prod.outlook.com (2603:10a6:150:74::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Thu, 8 Sep
 2022 09:08:51 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Thu, 8 Sep 2022
 09:08:51 +0000
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
X-Inumbo-ID: e54e2c2c-2f55-11ed-9760-273f2230c3a0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BVuZ1TltJuj8hBIOM4lcpMbuY1pGkngG/R7AMHQWrMTQGk34KG78uGCdkChqgDQxYvzWSRubh3JZH8vMdbjalwJEbFvuKXKfVUpUYycEhLfRcJ2OJQEMADFhxZuu50jd2GeDryaVOXpOYJSzHRu1QQESDSS3+zZ53a1OubpOBOXd+22WRg/Ssic66Cdg9l9T2PXR+XpFAHZr1rgNNlkOq0X1TmUG8o6rMGyJWFArR0PpUQPfisDGMBUp1TgltCpNoZ36pA/WS4hLMatG5UiL1+DW75AiZ7EsOf6KAM1yZA8RFApwCuHJF2CnWLgb7j4ViTAtJNe6jo/pcV9kTV598Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpxCyf5FBpi9+RpfheVgyK+l5RWHvJJNpiS6bJ1GPoY=;
 b=Rp+iXUX/p0ybCSj8fZZcBMnxGZXID6Wt2kxwmYYDrWt7XJAwLfaswXdQ1zDC1w2pkWk/zm/QZKp3NTJypfNXuj6VenCNcXT5RRhRozFIqkhU51kSQ+HITafyUv2l1dwd80x7654F5H8sVbf26u9GFwevf+uR6Rm7qnrTfaI9s0p4H5NjkJODsDy2wJS1N3eXTBpwIx1pLbKQLWg95IzkcILl1USOC2+y+rDviB3AqzNnL87OEekAJ3By70C7YlOgUS34ib/orPBViMzUEoeQtEhwLHnqs3Qe+EKo8uR7qPWuPP1us6EUCJ6JoU6FuBSc8n8C0j9Dortpfvj3zlXqjQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpxCyf5FBpi9+RpfheVgyK+l5RWHvJJNpiS6bJ1GPoY=;
 b=dVoY/Y215pmz6lEbmYZa32Ds3WGapRwUL2PDf62EIaHBNSc+7zkDip7AGWl6IBED6905JpTE6cEidbWLd72FSX8qoE9/kyJxelbaCtVixKoUNhCzmHJfwaWwRGk+ZaOLn+0ACoEq3zMiArZaROKik4MxA90DRqL22ayWQIbumH0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7XyJe5XX5FGsxxLY2mIb7PZWNvq+V84LgwRMYIu689qaznGu8nCDw/IuQn5+4Pn4ZUkLd2Q+9icKkq2c/gNqv7yHPeLZFXAZYeGKUyXnhqvnJ4OtB0USo7kvqfM+0RJ2nJBT9MtUYMw577mylgajXMscvtyfDlc8G9NvNJ78f7bt/P9oc6NnueajLzIz7tIxnpwqUAnf/Jo0MnnDRrhBYcMLEAWii4T4VWUX+CG3uHELNMln9uup6hx1ZFCQrfefXfj3OWLxd3lRIP8ILU1kxgKfnRD+47CIP8EtbpRFRkM3t1kvifZOG0FFYEjyOzKohuO0u+LP0LSqI94SvqkNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpxCyf5FBpi9+RpfheVgyK+l5RWHvJJNpiS6bJ1GPoY=;
 b=O+c34Nh1TCHGI2yEUR48Z/gysfyP1rQzfNYw/QpxDurE6GkbJo7ZkyOp7ahhWfx4uUNCrfD/gvtejxmdBpfmtUO0GkDREyqnYt9+clNhWAGu6Dl53zUzvMrFENAmJn9jzI1F37tG++s66Fx4ESx95Nnv49Uk6mWGS7Thx49NH1WrMOdaepayND0Z2dLpA2RISaASEI62X/CN6W4+Ke9IRioJhJi9e9RUsoIH35Soh8sMrGNPdhQcMELpOqMQF2XDtOvgivSUkYeD9h4q0tI0/hJ/JytVcOxWhgAVQc/0ZjkewgnuGSWopqwfXPm1/fQg4YE2WpYqUghcIU1jJAxymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpxCyf5FBpi9+RpfheVgyK+l5RWHvJJNpiS6bJ1GPoY=;
 b=dVoY/Y215pmz6lEbmYZa32Ds3WGapRwUL2PDf62EIaHBNSc+7zkDip7AGWl6IBED6905JpTE6cEidbWLd72FSX8qoE9/kyJxelbaCtVixKoUNhCzmHJfwaWwRGk+ZaOLn+0ACoEq3zMiArZaROKik4MxA90DRqL22ayWQIbumH0=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Penny
 Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH v5 2/4] docs, xen/arm: Introduce static heap memory
Thread-Topic: [PATCH v5 2/4] docs, xen/arm: Introduce static heap memory
Thread-Index: AQHYwzso2GWwzsCDE0CcU7YanIzu9q3VKd4AgAAUeAA=
Date: Thu, 8 Sep 2022 09:08:51 +0000
Message-ID:
 <AS8PR08MB7991C4245A2A86FB52B7E3C492409@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220908042538.27076-1-Henry.Wang@arm.com>
 <20220908042538.27076-3-Henry.Wang@arm.com>
 <44cd9359-db40-c6e3-7398-220d27d72bdc@amd.com>
In-Reply-To: <44cd9359-db40-c6e3-7398-220d27d72bdc@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: BE0F7883D03C2444A83C4AA1B332330E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e555d92b-882b-429b-43f3-08da9179c7f4
x-ms-traffictypediagnostic:
	GV2PR08MB8170:EE_|VE1EUR03FT006:EE_|AM0PR08MB5379:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mGCF1mZf9rsa7CIXps5CNP+I7voYhX4ziLfcPEiIdXfXtcxhNwLxHbUmoYf+HO8Uq3HqQeQenJ0UGjeHYrHvtcfOZriC0fPssTkKhaz+ntPKznQcN57jI5AhJC+8SaSL3APBul8WXjALn+msfhB6tJ7HeQ8usGmqk53t8/9QDo4DJPxXpZozr/lXCpvHGb7XE3FhGq1DfrDh+9sOuGQqRcJXQWMBc+yFQZ9Ko/F4r4TUfEsMDEedgTbN5T9DFGzqG6CzI1b5v9eCveK73QaYQLAdsRzXQsV+CgYQwFljxTSGxrc05duBT4Ud7y6i6n88HvIw1sVyT0I1l9ft3Z1sXoKGlmrLhEiuw6B6VVOFSSZcTE95fVY8nQe3tozkm9vSpQ8fn/X/KuEqasLZwLgWuivPaBwdtUI7ku9YEpPNOEDGIioO2WtAP2ZH/75mxiPMVG6xdoBmYY68+YT1UiBoPQwue24AnMRDNzG3VLNNl2iGbyaHnEVXhTEUdT3bIxXIYU/oknlQ8yYl5Kf5acTi/MnhKCpUEn7MXlbhIQDhEGeoGDh++lo+h6+XMe7TbTHJIi7Ilc+GOtOX8rlsniFiMaSlCa4qnjEQ5Xt04DsWwsGk6NUfXOYUu6PWpDfAlmq03ne6jbDtjpxwtAvUHiBOfLueolD97YmgvZT5cCETJ6DE8j1+gO63CmAZTSVIUoDLYhw4Xj0Mvk2ABVaiwcVdWw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(41300700001)(9686003)(8936002)(7696005)(26005)(186003)(71200400001)(5660300002)(6506007)(52536014)(33656002)(478600001)(84970400001)(86362001)(966005)(83380400001)(66446008)(38070700005)(55016003)(110136005)(8676002)(2906002)(38100700002)(54906003)(66476007)(64756008)(316002)(4326008)(122000001)(66946007)(76116006)(66556008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8170
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1a6b7b14-41fe-4699-37a0-08da9179bf9b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+N7eYnqvHnhw0VJ1VSAz/d4sUxFX2k8b2F+22FjqOJWqdgYPIraiboDvDwuBf/BFaGYRrfpa14Z43zLNtLM+feMIGicOrr7o80YMzF1dHECPhelswgo6N5IuJWE91pAu1siEiiPhQWabM6MXeHxEp6yXLncpm41DN4IuVW+9gtZmaZB6C7TNw8m3RG22dLfxnaFNB9Y0L1CaKLqOWrnG/wVg8mVSYMiBn1KZpblCiQRf3AeasgGnsiFoadlHRWhsJ5gVA7UNLFMlOE8f1AhxTC39j3bRyqNiAQPfLcx/BpVo3CdmiOg8hmFQHDFEiZ38Mny6blZGe+tgUoTfW+v196a4w5U+0Z2YULa0kXbABwzkJcOzHIrTwOnmJLAeY1595iTTJ9vvVe3So4nLK7sp+3ENb8lFs7KVygPoOVf53p9qqpOKztkyCLQn7nul2y2dEdqUGRcbXRXOyeSGYQAtEfUx0EsEW1P2OhzS7rAueqCaqk//iAJ4OfD0t4Vk+WaWmUj0CUMpLdXu+YkwNTf0VEVpbPMNULFgr+8LAKFJOuFuHBdfHwMQwKusobXjxurHlzSkcQI4Gw4U7TEF6QK5o9s0PDg4X+VrHDuTzo82Tt/sKCLw2ug4kxqxLz7Bz8qhzEn5tzPNZ2Jb0/jkA8g1+rZFyVE6fzpoQdQSfzW85clHnwsdkEF71xvfoFTG9rVUYwcPUPYAg4QqT8RWN9ClfuL4fOisvs65+eU/SzJ5cv8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966006)(40470700004)(36840700001)(33656002)(41300700001)(52536014)(9686003)(40460700003)(966005)(8936002)(2906002)(26005)(86362001)(70206006)(70586007)(8676002)(478600001)(5660300002)(81166007)(6506007)(4326008)(7696005)(84970400001)(110136005)(36860700001)(356005)(40480700001)(82740400003)(54906003)(336012)(82310400005)(186003)(47076005)(55016003)(316002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 09:09:05.6841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e555d92b-882b-429b-43f3-08da9179c7f4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5379

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hh
bCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+ID4gKy0gI2FkZHJlc3MtY2VsbHMgYW5k
ICNzaXplLWNlbGxzDQo+ID4gKw0KPiA+ICsgICAgU3BlY2lmeSB0aGUgbnVtYmVyIG9mIGNlbGxz
IHVzZWQgZm9yIHRoZSBhZGRyZXNzIGFuZCBzaXplIG9mIHRoZQ0KPiA+ICsgICAgInhlbixzdGF0
aWMtaGVhcCIgcHJvcGVydHkuIE5vdGUgdGhhdCBhY2NvcmRpbmcgdG8gdGhlIGRldmljZSB0cmVl
DQo+ID4gKyAgICBzcGVjaWZpY2F0aW9uLCB0aGUgbnVtYmVyIG9mIGFkZHJlc3MgY2VsbHMgYW5k
IHNpemUgY2VsbHMgb2YNCj4gPiArICAgICJ4ZW4sc3RhdGljLWhlYXAiIGlzIGRldGVybWluZWQg
YnkgdGhlIHBhcmVudCAjYWRkcmVzcy1jZWxscyBhbmQNCj4gPiArICAgICNzaXplLWNlbGxzIG9m
IHRoZSB0b3AtbGV2ZWwgImNob3NlbiIgbm9kZS4NCj4gSSBhbSBub3Qgc3VyZSB3ZSBzaG91bGQg
cHV0IHRoZSBpbmZvcm1hdGlvbiBhYm91dCAjYWRkcmVzcy1jZWxscyBhbmQgI3NpemUtDQo+IGNl
bGxzIGluIHRoYXQgZm9ybS4NCj4gRmlyc3RseSBiZWNhdXNlIC9jaG9zZW4gbm9kZSBpcyBhbHdh
eXMgYSBjaGlsZCBvZiAvIG5vZGUgYW5kIGFjY29yZGluZyB0bw0KPiBzcGVjcyBbMV0NCj4gdGhl
ICNhZGRyZXNzLWNlbGxzIGFuZCAjc2l6ZS1jZWxscyBhcmUgcmVxdWlyZWQgcHJvcGVydGllcyBm
b3IgdGhlIHJvb3Qgbm9kZS4NCj4gDQo+IElmIHdlIHdhbnQgdG8gc3RpbGwgbWVudGlvbiBpdCBJ
IHdvdWxkIGp1c3Qgd3JpdGUgdW5kZXIgeGVuLHN0YXRpYy1oZWFwOg0KPiAiTnVtYmVyIG9mIGFk
ZHJlc3MgYW5kIHNpemUgY2VsbHMgZm9yIHRoZSB4ZW4sc3RhdGljLWhlYXAgcHJvcGVydHkgaXMN
Cj4gZGV0ZXJtaW5lZA0KPiBieSB0aGUgcm9vdCBub2RlICNhZGRyZXNzLWNlbGxzLyNzaXplLWNl
bGxzIi4NCg0KVGhhbmtzLCBJIHdpbGwgYWRkcmVzcyB0aGlzIGNvbW1lbnRzIGFuZCAuLi4NCg0K
PiANCj4gPiArICAgICAgICBwcmludGsoIkNoZWNraW5nIGZvciBzdGF0aWMgaGVhcCBpbiAvY2hv
c2VuXG4iKTsNCj4gPiArICAgICAgICBpZiAoIGFkZHJlc3NfY2VsbHMgPCAxIHx8IHNpemVfY2Vs
bHMgPCAxICkNCj4gPiArICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIHByaW50aygiZmR0OiBu
b2RlIGAlcyc6IGludmFsaWQgI2FkZHJlc3MtY2VsbHMgb3IgI3NpemUtY2VsbHNcbiIsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICBuYW1lKTsNCj4gPiArICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7DQo+ID4gKyAgICAgICAgfQ0KPiBUaGlzIGNoZWNrIGlzIG5vdyB0aGUgZGlyZWN0IGNvcHkg
b2YgdGhlIG9uZSBpbiBkZXZpY2VfdHJlZV9nZXRfbWVtaW5mbyBzbw0KPiBwbGVhc2UgcmVtb3Zl
IGl0DQo+IHRvIGF2b2lkIGNvZGUgZHVwbGljYXRpb24uDQoNCi4uLnRoaXMgaW4gdjYsIGJ1dCBJ
IHdhbnQgdG8gc2VlIGlmIHRoZXJlIHdvdWxkIGJlIG1vcmUgY29tbWVudHMgYmVmb3JlIHNlbmRp
bmcNCml0Lg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiB+TWljaGFsDQo+IA0KPiBb
MV0gaHR0cHM6Ly9kZXZpY2V0cmVlLQ0KPiBzcGVjaWZpY2F0aW9uLnJlYWR0aGVkb2NzLmlvL2Vu
L3YwLjMvZGV2aWNlbm9kZXMuaHRtbA0K

