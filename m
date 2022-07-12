Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD96571300
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 09:21:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365517.595724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBACO-0001dk-Q8; Tue, 12 Jul 2022 07:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365517.595724; Tue, 12 Jul 2022 07:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBACO-0001bD-NF; Tue, 12 Jul 2022 07:20:48 +0000
Received: by outflank-mailman (input) for mailman id 365517;
 Tue, 12 Jul 2022 07:20:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=31wv=XR=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oBACN-0001b7-79
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 07:20:47 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50056.outbound.protection.outlook.com [40.107.5.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 255c04ca-01b3-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 09:20:46 +0200 (CEST)
Received: from AS9P194CA0023.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::24)
 by DB9PR08MB6990.eurprd08.prod.outlook.com (2603:10a6:10:2c4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 07:20:44 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::82) by AS9P194CA0023.outlook.office365.com
 (2603:10a6:20b:46d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Tue, 12 Jul 2022 07:20:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 07:20:42 +0000
Received: ("Tessian outbound 0ba541f03a2a:v122");
 Tue, 12 Jul 2022 07:20:35 +0000
Received: from 96fd081d33ed.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1A154E87-8789-461B-A934-9C23A7BA2C39.1; 
 Tue, 12 Jul 2022 07:20:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 96fd081d33ed.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Jul 2022 07:20:25 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VE1PR08MB5807.eurprd08.prod.outlook.com (2603:10a6:800:1b2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Tue, 12 Jul
 2022 07:20:23 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 07:20:22 +0000
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
X-Inumbo-ID: 255c04ca-01b3-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SQDq87JVkJ+zTgLrUBlAfZagO/A5LCmO3XxR0onyZToInh1EAsToL+N3O+eSHWZOv6V1kMRpr3nloXwyZo08/UKBR7W/mBU0cppI905GYS4jWinsf9vckZh7edJ8Np68/RkkduEKwEzYHCwhdE3Bp4baeAXbIr6XoEp3SfK9EEx7QvCOUuT7ujc8Uh0JltoVu0zSSEFZ1rwDyWw8hmHWXbmwH2bUp49iH0ZxZulUsMQARoL+6Wn6hkah0zpLfwVX1sQM0MLIW7tRLV8xk0pIdmXqWdoYNiP0L7ZOzxNCL0Vw4ir0TNAbEG/7IbZopSnM75uGXh9KZRjFSbQNXqfRFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMXwU/OwbKgIu/WSNNo2xHANK0CcAR8RrXbJ/2VMpE4=;
 b=CpbUyarP1Vt62EL2L7k+JzJWn+2b6okoUjZEvJ2/Y/Fowkbkakd0FX0+CUOu9CmPb3CZ4wmnq/ygHr6RN3JqGZmnct0XQ7E1EaDTcayguiJqMmdv03mej7dMmaAfQhO2NW0JZiPOg//aQBBdGSinlaZVDtQJGsQdSO+bujI7pumr7wb9k8sVr1Z5Ubpve35KhAev1P/knsBXG3YQMFDzouT35sgNGICFDgZvGXR+BaVySaaa9w2NN38sXP5HgvUzeLc5/lGt29vh68Jzb6mP4zwJxJJMrENGygL0hscmUxUUCCbU8bbOR64MhruX0QZAnAz48dbBUqMr6HBaX5fKbA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMXwU/OwbKgIu/WSNNo2xHANK0CcAR8RrXbJ/2VMpE4=;
 b=JdYayICJ0bVztV5+K2vFmbf/h5lFnJ7aT84WnCMo4w/Ieg/jC8aZXEYB9bw93eJLTrtJ0kHPiiKqrPBEiL/RPz9jd2yTBPz0RNkmgkeQw0/P52AbBok5kFWrvWY0bNb3kif9oVlUE4sDKFrnAAJeQu7hr4uhaFvKirQaoy0uhD8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHe1FU2Yno3bIBWBAlBFWrVl3bslBDNHijK2UqcawXHI5nz3QrpooiCeA6MP7wjdJb+WJmBwN0HzV0j+cbNWrEsnfm51GnyAk3WFTEIuxTWm95dCthlVQiaFWDZRoqcj45Lv/1GYzzCYBu44gUzcfJQnOp3z1EMXOsxMuwKXJ7O3Qa2srDliJhY6Oq8LCqG3SMm6CgJXWDJrcQT/67pWB5OIggpwphV38yOBhq190Hl9PcpYXVZ/1SEDmJIgGV0ayM3kOlBOzlqmdfRnEosHC3NXTMMo8WJoldqiqWrgsf9w1MSGJ8op3YAbID6hKO6b0kX+Io530TFHePxsLw5fRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMXwU/OwbKgIu/WSNNo2xHANK0CcAR8RrXbJ/2VMpE4=;
 b=ZPjaFQx3eqnUbzPxbYqO6xI+eMO3GRJQmWuhvAhSHJ2lvr8i4gobwstzDq0KTomKLktpoA8zV1O9ydcxjrSjwd/Tsp8IotMJOiJBtbqTCJvQp8QL2SV2jlacDh/aamwGXaWOy6Bq8vGDmRry9EnPCACayWuqTpSZnm6rvfS3wV40cdElG3JREwkiC21MbXFp/MLXioVuXm1dnW4fzcFX2dpsBcbaJA3Uv0ODNrH85ujRUN4Q7LjW61oqQ6BUamE5AL5LF76pUkKZL3zwhqugRuAT4bfKQUyw2Jf5iR7UwvuWWZwIzaTkwfSvVXTiNhzjxf8l6dETXXrA1Y1C1zI6Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMXwU/OwbKgIu/WSNNo2xHANK0CcAR8RrXbJ/2VMpE4=;
 b=JdYayICJ0bVztV5+K2vFmbf/h5lFnJ7aT84WnCMo4w/Ieg/jC8aZXEYB9bw93eJLTrtJ0kHPiiKqrPBEiL/RPz9jd2yTBPz0RNkmgkeQw0/P52AbBok5kFWrvWY0bNb3kif9oVlUE4sDKFrnAAJeQu7hr4uhaFvKirQaoy0uhD8=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Jiamei Xie
	<Jiamei.Xie@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 4/9] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for
 phys_to_nid
Thread-Topic: [PATCH v2 4/9] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for
 phys_to_nid
Thread-Index: AQHYktq/lgTeemGHCUuLgTuwCRELQK14uj+AgAGe/lA=
Date: Tue, 12 Jul 2022 07:20:22 +0000
Message-ID:
 <PAXPR08MB742087E3B94FD469F2DBDC5E9E869@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-5-wei.chen@arm.com>
 <6b1b2694-d46a-7713-6109-99c98fdf6b8e@suse.com>
In-Reply-To: <6b1b2694-d46a-7713-6109-99c98fdf6b8e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F186957D68891548BCFB0D29EE440AB8.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 322976bd-692a-4892-2894-08da63d707c1
x-ms-traffictypediagnostic:
	VE1PR08MB5807:EE_|AM5EUR03FT014:EE_|DB9PR08MB6990:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YOrxtkU+zB37/pQp5qDMZjJeYax51/FmTUo9shUU4v0cIi1dkhGnr6zghuC+myZY1UkMz26J5rxXVEsEXAtYdjA2m2bgitc4i58ZmECs852V+fF//prTKV7jP1RzsC0lZG2p6DXfNWDaf8+PROY8kNyhybBEhn4d0pYYXikSg9F1q4Z7qRrgSBm5n/HOimiobRsTMF/PrKVYJH9Gdxg/6WepRVfkOwvRzRez7O26DXiLFivlpxWiwYVBP9KMULrjH4yk4DYSyUi0w1vd9Bis0GPPzHYpwlBeV7kAoxW5J3d7ZRVPBZ0LoEHaOhsr1ymjir1WCt5K5rAuh+aJVzzdW0lIS3L+Bsq+Cug9MwD8DeQO7C3hjx7HIElFUpbA37N91dN4hkpL/AOqUJPnlPaE7aMzS8QYTJCo+CGn0qeQXX9/mpgrza3/dpINu02/ArlilkVhME0ODODJXMeWjQebSWO/oM3MoiD7/RKwf+opBFae69tOfPHGmqr1jvTVKk7cgtwBtJOLbqDdMx33I7KCVfHvPtcIbvgOgmr8MT7PmWp1kJ3jqi0pHmvlq7SMLForeEvDzwuw7hRVuEMdsfAxk1TCal8+x6liMLTdpIURp4Ny0XoLkyi8paNBV5/ismUFwMKzR7TY7DCsSbuq3OgNhHlugGPiHFPDFSk45zjYLAgAiqCFyK+5makIzKvEO540a65iUfbW4EERLI0DjRZA8hnE1bzyHPdeWLiAHa6yPN6AcvR6tbcDTrsS3qSXuS5n8bmuwYpvyqNcRSGCH+8hgz+XEC6zRUpiH1B9mOsFN/OBmWx3DH4P2SbM6JUIsR9n
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(26005)(53546011)(5660300002)(7696005)(6506007)(38070700005)(71200400001)(9686003)(41300700001)(478600001)(33656002)(54906003)(316002)(6916009)(86362001)(8676002)(83380400001)(122000001)(66476007)(66946007)(66556008)(4326008)(186003)(64756008)(66446008)(76116006)(52536014)(38100700002)(2906002)(55016003)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5807
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	64b08803-c45d-4ea8-8b2b-08da63d6fb9b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KJC5wCTJ3NXAZ5t2NL5eUMynLchUov3IPimxjOG3WhbrKAefkPbuZ5E7UyWkcoYyCBq2TpU7x/bOzGTEYAJodEG5Py+p0SaBStsXH8wytZcBOFoUIdVyLpSLpW7Qh0BdMknZHx44XSH8fIe/X4v0dDp6HhgQWBu1nmGNJ/FCrshMnEoEjlj80hOlxyRsogd1K9YhjlfilPTEl934XfqTEG0DwoTVFI28uou2WE7ZEdgLyUtYsmcaBgn8YTBXt24Ed6oc3/i8ST4vC3i3CofWPXl44HfmyiBb9i1FL2qU6ncVeozMT0NoS5bP/KUIzNG9VkHeqYvuFXP7YBymMGHbah8atVgz55Me+coAyDpPIvKHDdz78ohJhGCXKvpw/Mpyn8foqIOqHufHDj7WkFHSD+TfZRrMlE/wPJ+8ohDPoYa/M55ZgytYEkTRqc3NTdC9R9Bva9hqNapSEBfFLZqrijDOPWAcr/iGazFAmrHLui5S0hBpItJJDfUCUgvC6xNEY572Rqzc/pK0fBVeZWPi/uAOZOdxOjnrzY1qL2Y0ItsUIw0snVNmOXVbj9IJ2N+/92fQGyI3QvTZaQ8R9wVeQl3obUgF3BjFL1kdS6/N75tCv+vSGpJTojIuSkKybcppto7ujl9BhrqCKQbjbfM+XU5FrZDZ8ytl+vZY5eFS3lh8hToXMuw00NlNWt2Q69zhNXhi2YpQgXerXVsIU5XHBhlE0VUzMCkhvL/oTklkRWcQidaTGkXzwa2CUoY7QRUwq27BbKCKsTULJnG0kEtBAlB7TOdzdXRwxaxwYOTamVi0u3G3LTQrGjIViTBmst8+
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(39860400002)(46966006)(40470700004)(36840700001)(2906002)(478600001)(82310400005)(81166007)(336012)(356005)(86362001)(82740400003)(7696005)(83380400001)(40480700001)(40460700003)(47076005)(6506007)(53546011)(41300700001)(26005)(6862004)(8936002)(186003)(33656002)(5660300002)(70206006)(316002)(55016003)(70586007)(4326008)(9686003)(54906003)(52536014)(8676002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 07:20:42.4001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 322976bd-692a-4892-2894-08da63d707c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6990

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDfmnIgxMeaXpSAxNDozMg0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UNCj4gRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2Vp
IExpdSA8d2xAeGVuLm9yZz47IEppYW1laSBYaWUNCj4gPEppYW1laS5YaWVAYXJtLmNvbT47IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDQv
OV0geGVuL3g4NjogVXNlIEFTU0VSVCBpbnN0ZWFkIG9mIFZJUlRVQUxfQlVHX09ODQo+IGZvciBw
aHlzX3RvX25pZA0KPiANCj4gT24gMDguMDcuMjAyMiAxNjo1NCwgV2VpIENoZW4gd3JvdGU6DQo+
ID4gVklSVFVBTF9CVUdfT04gaXMgYW4gZW1wdHkgbWFjcm8gdXNlZCBpbiBwaHlzX3RvX25pZC4g
VGhpcw0KPiA+IHJlc3VsdHMgaW4gdHdvIGxpbmVzIG9mIGVycm9yLWNoZWNraW5nIGNvZGUgaW4g
cGh5c190b19uaWQNCj4gPiB0aGF0IGlzIG5vdCBhY3R1YWxseSB3b3JraW5nIGFuZCBjYXVzaW5n
IHR3byBjb21waWxhdGlvbg0KPiA+IGVycm9yczoNCj4gPiAxLiBlcnJvcjogIk1BWF9OVU1OT0RF
UyIgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pLg0KPiA+ICAgIFRoaXMg
aXMgYmVjYXVzZSBpbiB0aGUgY29tbW9uIGhlYWRlciBmaWxlLCAiTUFYX05VTU5PREVTIiBpcw0K
PiA+ICAgIGRlZmluZWQgYWZ0ZXIgdGhlIGNvbW1vbiBoZWFkZXIgZmlsZSBpbmNsdWRlcyB0aGUg
QVJDSCBoZWFkZXINCj4gPiAgICBmaWxlLCB3aGVyZSBwaHlzX3RvX25pZCBoYXMgYXR0ZW1wdGVk
IHRvIHVzZSAiTUFYX05VTU5PREVTIi4NCj4gPiAgICBUaGlzIGVycm9yIHdhcyByZXNvbHZlZCBh
ZnRlciB3ZSBtb3ZlZCB0aGUgcGh5c190b19uaWQgZnJvbQ0KPiA+ICAgIHg4NiBBUkNIIGhlYWRl
ciBmaWxlIHRvIGNvbW1vbiBoZWFkZXIgZmlsZS4NCj4gPiAyLiBlcnJvcjogd3JvbmcgdHlwZSBh
cmd1bWVudCB0byB1bmFyeSBleGNsYW1hdGlvbiBtYXJrLg0KPiA+ICAgIFRoaXMgaXMgYmVjYXVz
ZSwgdGhlIGVycm9yLWNoZWNraW5nIGNvZGUgY29udGFpbnMgIW5vZGVfZGF0YVtuaWRdLg0KPiA+
ICAgIEJ1dCBub2RlX2RhdGEgaXMgYSBkYXRhIHN0cnVjdHVyZSB2YXJpYWJsZSwgaXQncyBub3Qg
YSBwb2ludGVyLg0KPiA+DQo+ID4gU28sIGluIHRoaXMgcGF0Y2gsIHdlIHVzZSBBU1NFUlQgaW5z
dGVhZCBvZiBWSVJUVUFMX0JVR19PTiB0bw0KPiA+IGVuYWJsZSB0aGUgdHdvIGxpbmVzIG9mIGVy
cm9yLWNoZWNraW5nIGNvZGUuIEFuZCBmaXggdGhlIGxlZnQNCj4gPiBjb21waWxhdGlvbiBlcnJv
cnMgYnkgcmVwbGFjaW5nICFub2RlX2RhdGFbbmlkXSB0bw0KPiA+ICFub2RlX2RhdGFbbmlkXS5u
b2RlX3NwYW5uZWRfcGFnZXMuIEFsdGhvdWdoIE5VTUEgYWxsb3dzIG9uZSBub2RlDQo+ID4gY2Fu
IG9ubHkgaGF2ZSBDUFVzIGJ1dCB3aXRob3V0IGFueSBtZW1vcnkuIEFuZCBub2RlIHdpdGggMCBi
eXRlcw0KPiA+IG9mIG1lbW9yeSBtaWdodCBoYXZlIGFuIGVudHJ5IGluIG1lbW5vZGVtYXBbXSB0
aGVvcmV0aWNhbGx5LiBCdXQNCj4gPiB0aGF0IGRvZXNuJ3QgbWVhbiBwaHlzX3RvX25pZCBjYW4g
ZmluZCBhbnkgdmFsaWQgYWRkcmVzcyBmcm9tIGENCj4gPiBub2RlIHdpdGggMCBieXRlcyBtZW1v
cnkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4N
Cj4gPiBUZXN0ZWQtYnk6IEppYW1laSBYaWUgPGppYW1laS54aWVAYXJtLmNvbT4NCj4gPiAtLS0N
Cj4gPiB2MSAtPiB2MjoNCj4gPiAxLiBNb3ZlIGZyb20gcGFydCMxIHRvIHBhcnQjMi4gKENvbW1l
bnQgZnJvbSBOVU1BIHBhcnQxIHNlcmllcykNCj4gPiAyLiBSZWZpbmUgdGhlIGp1c3RpZmljYXRp
b24gb2YgdXNpbmcNCj4gPiAgICAhbm9kZV9kYXRhW25pZF0ubm9kZV9zcGFubmVkX3BhZ2VzLiAo
RnJvbSBOVU1BIHBhcnQxIHNlcmllcykNCj4gPiAzLiBVc2UgQVNTRVJUIHRvIHJlcGxhY2UgVklS
VFVBTF9CVUdfT04gaW4gcGh5c190b19uaWQuDQo+ID4gNC4gQWRqdXN0IHRoZSBjb25kaXRpb25h
bCBleHByZXNzIGZvciBBU1NFUlQuDQo+ID4gNS4gTW92ZSBNQVhfTlVNTk9ERVMgZnJvbSB4ZW4v
bnVtYS5oIHRvIGFzbS9udW1hLmggZm9yIHg4Ni4NCj4gPiA2LiBVc2UgY29uZGl0aW9uYWwgbWFj
cm8gdG8gZ2F0ZSBNQVhfTlVNTk9ERVMgZm9yIG90aGVyIGFyY2hpdGVjdHVyZXMuDQo+IA0KPiBU
aGUgY2hhbmdlIGxvb2tzIG9rYXksIGJ1dCBjYW4geW91IHBsZWFzZSBjbGFyaWZ5IHdoYXQgdGhl
c2UgbGFzdCB0d28NCj4gcG9pbnRzIGRlc2NyaWJlPyBUaGV5IGRvbid0IHNlZW0gdG8gbWF0Y2gg
YW55IGNoYW5nZSAuLi4NCj4gDQoNCkkgbW92ZWQgdGhpcyBwYXRjaCBmb3JtIFBhcnQjMSB0byBQ
YXJ0IzIsIGJ1dCBmb3Jnb3QgdG8gcmVtb3ZlIHRoZXNlDQp0d28gY2hhbmdlIGxvZ3MuIEluIFBh
cnQjMSwgd2UgZG8gdGhvc2UgY2hhbmdlcywgYnV0IGFmdGVyIHdlIG1vdmVkDQp0aGlzIHBhdGNo
IHRvIFBhcnQjMiwgdGhvc2UgY2hhbmdlcyBhcmUgdW5uZWNlc3NhcnkuIEkgd2lsbCByZW1vdmUN
CnRoZXNlIHR3byBsaW5lcyBvZiBjaGFuZ2UgbG9ncy4gU29ycnkgZm9yIHRoZSBjb25mdXNpb24h
DQoNCkNoZWVycywNCldlaSBDaGVuDQoNCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbnVtYS5o
DQo+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL251bWEuaA0KPiA+IEBAIC0zNiw4ICszNiw2IEBA
IHN0cnVjdCBub2RlIHsNCj4gPiAgZXh0ZXJuIGludCBjb21wdXRlX2hhc2hfc2hpZnQoc3RydWN0
IG5vZGUgKm5vZGVzLCBpbnQgbnVtbm9kZXMsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG5vZGVpZF90ICpub2RlaWRzKTsNCj4gPg0KPiA+IC0jZGVmaW5lIFZJUlRVQUxfQlVH
X09OKHgpDQo+ID4gLQ0KPiA+ICAvKiBFbnVtZXJhdGlvbnMgZm9yIE5VTUEgc3RhdHVzLiAqLw0K
PiA+ICBlbnVtIG51bWFfbW9kZSB7DQo+ID4gICAgICBudW1hX29uID0gMCwNCj4gPiBAQCAtNzcs
OSArNzUsOSBAQCBleHRlcm4gc3RydWN0IG5vZGVfZGF0YSBub2RlX2RhdGFbXTsNCj4gPiAgc3Rh
dGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChwdXJlKSkgbm9kZWlkX3QgcGh5c190b19uaWQocGFk
ZHJfdCBhZGRyKQ0KPiA+ICB7DQo+ID4gICAgICBub2RlaWRfdCBuaWQ7DQo+ID4gLSAgICBWSVJU
VUFMX0JVR19PTigocGFkZHJfdG9fcGR4KGFkZHIpID4+IG1lbW5vZGVfc2hpZnQpID49DQo+IG1l
bW5vZGVtYXBzaXplKTsNCj4gPiArICAgIEFTU0VSVCgocGFkZHJfdG9fcGR4KGFkZHIpID4+IG1l
bW5vZGVfc2hpZnQpIDwgbWVtbm9kZW1hcHNpemUpOw0KPiA+ICAgICAgbmlkID0gbWVtbm9kZW1h
cFtwYWRkcl90b19wZHgoYWRkcikgPj4gbWVtbm9kZV9zaGlmdF07DQo+ID4gLSAgICBWSVJUVUFM
X0JVR19PTihuaWQgPj0gTUFYX05VTU5PREVTIHx8ICFub2RlX2RhdGFbbmlkXSk7DQo+ID4gKyAg
ICBBU1NFUlQobmlkIDwgTUFYX05VTU5PREVTICYmIG5vZGVfZGF0YVtuaWRdLm5vZGVfc3Bhbm5l
ZF9wYWdlcyk7DQo+ID4gICAgICByZXR1cm4gbmlkOw0KPiA+ICB9DQo+ID4NCj4gDQo+IC4uLiBp
biB0aGUgZW50aXJlIHBhdGNoLg0KPiANCj4gSmFuDQo=

