Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C555AE003
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 08:41:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399394.640549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSH7-0000QC-E4; Tue, 06 Sep 2022 06:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399394.640549; Tue, 06 Sep 2022 06:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSH7-0000NG-B6; Tue, 06 Sep 2022 06:41:33 +0000
Received: by outflank-mailman (input) for mailman id 399394;
 Tue, 06 Sep 2022 06:41:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Bts=ZJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oVSH5-0000NA-VY
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 06:41:32 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80054.outbound.protection.outlook.com [40.107.8.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eeebcf1a-2dae-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 08:41:28 +0200 (CEST)
Received: from AM7PR04CA0030.eurprd04.prod.outlook.com (2603:10a6:20b:110::40)
 by PAVPR08MB9063.eurprd08.prod.outlook.com (2603:10a6:102:325::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Tue, 6 Sep
 2022 06:41:24 +0000
Received: from AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::69) by AM7PR04CA0030.outlook.office365.com
 (2603:10a6:20b:110::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Tue, 6 Sep 2022 06:41:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT060.mail.protection.outlook.com (100.127.140.216) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 06:41:23 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Tue, 06 Sep 2022 06:41:23 +0000
Received: from b6d8896b728f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 19F261C3-A53F-4191-983A-5741AB42F44D.1; 
 Tue, 06 Sep 2022 06:41:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b6d8896b728f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Sep 2022 06:41:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8711.eurprd08.prod.outlook.com (2603:10a6:10:401::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 06:41:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Tue, 6 Sep 2022
 06:41:13 +0000
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
X-Inumbo-ID: eeebcf1a-2dae-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Qh7rPBcHUgZkHATuuGDJuPZpK6FnUukcocu3OgjrXvCRGhfNHUox0BDa6r9YY7KtS2Dy9QIlrK2T1xFvX2yhlkjLvximHceiy++CDPZtOwDnWYALx/govt+RW0oOZ9ohzD1/ntUMob/j44wmZn9lsPgGDDlgypY7O9raEVvaXWAnBN83VHHIb46LNWTCFvclGZREFz2e19OaWp6s6HaVDKVWoXez818IajPxnzdf2aAB/1LzRaGSfYJ75PjuONXmJmA/LH4ZOoTh0xNC4f4XY/IcqxGJJM9D7FOMlfoTkmOGHyptQj4ZLrb+hOGUvaDT5vLTYAgrn8YYHPfcOlilfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ug7/sB5v5qriGhe8kvJtO8YG7xZW2naa63COGHavWYw=;
 b=VHbVxSUh9VRLlTT+evhlCf9vQCr3oPclpkWkcWoARPgub4RIg9JHpPBQQmCoXPkCMBN8lF98pNhrsUuMj043BNaSoRXMEcAd9+hSF+JjlAkePMKXHgIfESQAYogbys6y5ysszsO9jDyihfNn3hdCjas2GkIs+bC15sxvNcFa5y/iBexcrA0Vm3mM9PK6xIbDr+w9rrPTV+AOGDrZjtC2UuBnGufcusHOcVngK3BeNR7cinsTNrSv013dNH6bn86vQScHjoPjgpp8uDZFC3DEAwvpSOxC8SkqysybSxtxi2biYTpcSHHK195DOVA5lDpadNdKovRZCZ9jsLNe+tY25g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ug7/sB5v5qriGhe8kvJtO8YG7xZW2naa63COGHavWYw=;
 b=YAPiaEggho5uHfJySTYkTMgNQ23ud8zPfOmYB9Lu1be6NbtAz/AG1MA6vo3Br3VYTqmqoFgqL/pp6M/HT1PzRoQ1v61gCOnrwFp06/QjwXAEPfbeyMDhak3WYQrfQJStxNkpEIVEzRJ+q//ytucE0ZMKt19rM/eAVFXJ8QTKGic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qa7r6cZSQ4yPiwN49DvMm+qiWHu2watumMXBIQRhVXxC72cFpPY20hGN9JZlhpezdRNS5Q+fXcyRniBc1+suMmpLg/BzItDvnOi/DWTkTKfqu+WXs0rtQorqbMTbbtfGMAwp1UutXcV2zt6vOg6e9kYtqCq/iaM63hl6qHPCW/i1ZtkqcrDQvoAS6URzV6IM6XYKcCs0xuvEA/lqWt6xg7yK0USiAn0FDgWJ6jsVG9rdpHrb41XsaSsWgG8U1zjUBiz3quyTf4b9CHU4wkanG0pttZJ44yzaUiGLmnvf3uNSjKdGiXntLeDnVkix+ho5f5l3oAH4Uch2V4BiYWM2MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ug7/sB5v5qriGhe8kvJtO8YG7xZW2naa63COGHavWYw=;
 b=oPObpYS9rpmIDPh58hLl7g9reBCd+yk0mdZDeXRhAtt7oWn+37PBunR/PoLKpg5fWU6qXCuwdv0r/KB0CoyUp4siWnCCBW02EDbT+5KaNYkMtNbrM0T4uZ9L8+ORW5DHhFjX0MuDh5zdcS5Um1xLEIolVC3CxpuJYQCixRGpRkmnEhnYTxMnyPWnmnkogv/9hqDag3xTFEoF9Sk49ywi4y3cO44UNN4Z8OuofZdj2lWOAYcrQ4LOubMjUpjd6bZnQ0X4CzGTvjOxJtA9sK/7lVNzWgCYjZVwdWXe/ylyngfD3aRDGKwgiSuF34/DQdclncEMFSo8P9OAm1cURjOILA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ug7/sB5v5qriGhe8kvJtO8YG7xZW2naa63COGHavWYw=;
 b=YAPiaEggho5uHfJySTYkTMgNQ23ud8zPfOmYB9Lu1be6NbtAz/AG1MA6vo3Br3VYTqmqoFgqL/pp6M/HT1PzRoQ1v61gCOnrwFp06/QjwXAEPfbeyMDhak3WYQrfQJStxNkpEIVEzRJ+q//ytucE0ZMKt19rM/eAVFXJ8QTKGic=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH v2 1/4] docs, xen/arm: Introduce reserved heap memory
Thread-Topic: [PATCH v2 1/4] docs, xen/arm: Introduce reserved heap memory
Thread-Index: AQHYwPjzoXW29+zrjEaaAKDaLd6E0a3QvVUAgABZjgCAANyIgIAAAOmw
Date: Tue, 6 Sep 2022 06:41:13 +0000
Message-ID:
 <AS8PR08MB7991A12EAC371A6489C19F5F927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220905072635.16294-1-Henry.Wang@arm.com>
 <20220905072635.16294-2-Henry.Wang@arm.com>
 <d62add1a-3e05-7aaf-f44e-f2b3c8c0cfca@amd.com>
 <8325d0ce-1fd3-d754-9eaf-d73b19f8d53e@xen.org>
 <4030d661-7b25-4957-e2dc-069fb4030ea0@amd.com>
In-Reply-To: <4030d661-7b25-4957-e2dc-069fb4030ea0@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9D827F34F8C8AA449DB299573B7F83F7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 67af3148-f014-4db9-ef4f-08da8fd2d0f6
x-ms-traffictypediagnostic:
	DU0PR08MB8711:EE_|AM7EUR03FT060:EE_|PAVPR08MB9063:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IenW86inAV69wWCI32ZcmmROICVO5WqAewYaf0hyn9XRUB5/z2InIA3+ZZ28n1wHldIa5nB3/X1UFWJb9gMc2KDM+hlANiutTUKS/k+P0FO3xx1eqv8sCWGPBcd7PICZ/EOtsYgb5xFnWb8Koag376PFCXeQUviQR0lBwupXaVrxvC/RRwCkakMDvTw7qt2Ja4fpw5WgkBM+zkDzsegs5p/GpaKmpgVDGe+L9DOHOkNMaqH1V6XPOpLQRToAI+hOPDqvDDXuKcJmND141Z/hC4E5gBsAKePz4rJ3u8eY/NXzjG7EFiC3uzveOV1m6FxA3ZiAsr6pcrkNgg3Z+wc/AVxKD06r10j8diBlu3Ipyw6DYJXFQ3rd2xKoL6NAUH2h+b70Z8XRZRF/S2FigrzHdeIR8faruYuhnPP6HO69Pfw4migGMQcZAy/8mDUwMxJAHqJ1HPqzpvAK8y/gyJOi50EZ0cnFtP8ifQLbK1BcBqecg6mX2yELxE4nqrApEmmtkAYB7xywUdchKo3VjIjPGYW1eohOQW4JPTXgX0/DmF248hRkIBg/B9gu/eiTGoIKG9erWqBjUWMj4UqvCDs+zf10c44bCL6/gbo4+bpkgzflwAIWDPaJ1LrVS2fuHkL+EWSAREMJtc2OoX5SHLaijrXKzJskrr+xfbvJeVOaCGMRmCNcIneH3o3HPObzmvqhNcqzQ9taJBWUcfDzRPLHmm30VhqYrywaB54g4Vstvs3oXUmEWPbpgP4Y86gtOolou4RpWF4ufyNXWNwfCzMJww==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(110136005)(2906002)(33656002)(316002)(186003)(76116006)(5660300002)(8936002)(52536014)(66556008)(66446008)(66946007)(8676002)(4326008)(66476007)(54906003)(64756008)(86362001)(41300700001)(71200400001)(53546011)(478600001)(9686003)(7696005)(6506007)(26005)(38100700002)(38070700005)(83380400001)(55016003)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8711
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	82bc4962-d1e5-496c-213a-08da8fd2ca9f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pB3pQSjJH1z5f4cr7HsWo+bIqCpapt64e6LZqGKnl2HakuQ+/+6SxcXA2eV5+DN5cAPW2PbTocO/qCOF1sEQdOobRpVbUk+10Ke0KI1mvYCaPlFSqIZ48G/sUpcYpMvani23d0+pvTWMKyBZqe2bGldfDS5OOiJ5VcEdjBfkbn9qog8YNzkD/81KspNzUMyGlbHAwkKVQoN5Anqw0tlQAL893TICNHaXNsLNBgGPwgM9HAzF/2p1AX5cUN1LFsJ9U6D7xaB6o/m2uRQBhk2leFKny3AGoj/Yaeyckai9AyW6VLGIjrnXPM+Jn03LCWP+ajyxNj8ellYYOIb/e1wvyXyB8/QqAuG2h3akDagZQNLPdEHGfbcp9EUm3ZFm4cDfOOsxhfwxV7aju0U6PZRcrYVGuPXh0K3GzAc8LVqZYIanwCd9+gfBWQQazriRNvtSAx0FTh+6YB1WyK6lXVT60GZNzOUOrcDNOHFWM1/AZajtT9kkYbrbUqkvtguuirt49/oWnzIRYTLYy+lpTwWj3tl/4GmELXJecveqkFY/FyzizGRgiRzUsabRBeKbGT/+rV+1n1dhMyDcv0iPeuJgru+Psh44ynZfA098GGeh+c1P8t9d99tWCBnuct5q1KD+xSvXPN2NPI/G7YUOY/1uWmRSPv31gKGFbUm14i5bJ4KQqPKi1yePD55rA0MJdSib0HLR0ISM4e5Xjjr90kObW8/f7PR0BQL0W3vss4Oed61pqaSfnlR8iuF8HP75uKLyZTnT6/UNYZvBpzLsI2ip8A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(346002)(396003)(36840700001)(40470700004)(46966006)(70206006)(70586007)(356005)(47076005)(36860700001)(5660300002)(52536014)(55016003)(33656002)(54906003)(316002)(40480700001)(4326008)(86362001)(8676002)(82310400005)(2906002)(8936002)(110136005)(41300700001)(53546011)(7696005)(336012)(478600001)(40460700003)(83380400001)(26005)(82740400003)(6506007)(186003)(9686003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 06:41:23.7625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67af3148-f014-4db9-ef4f-08da8fd2d0f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9063

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hh
bCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
MS80XSBkb2NzLCB4ZW4vYXJtOiBJbnRyb2R1Y2UgcmVzZXJ2ZWQgaGVhcCBtZW1vcnkNCj4gDQo+
IEhpIEp1bGllbiwNCj4gDQo+IE9uIDA1LzA5LzIwMjIgMTk6MjQsIEp1bGllbiBHcmFsbCB3cm90
ZToNCj4gPg0KPiA+IEhpIE1pY2hhbCwNCj4gPg0KPiA+IE9uIDA1LzA5LzIwMjIgMTM6MDQsIE1p
Y2hhbCBPcnplbCB3cm90ZToNCj4gPj4gT24gMDUvMDkvMjAyMiAwOToyNiwgSGVucnkgV2FuZyB3
cm90ZToNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L3NldHVwLmgNCj4gYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vc2V0dXAuaA0KPiA+Pj4gaW5k
ZXggNTgxNWNjZjhjNS4uZDBjYzU1NjgzMyAxMDA2NDQNCj4gPj4+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9zZXR1cC5oDQo+ID4+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vc2V0dXAuaA0KPiA+Pj4gQEAgLTIyLDExICsyMiwxNiBAQCB0eXBlZGVmIGVudW0gew0KPiA+
Pj4gICAgICAgQk9PVE1PRF9VTktOT1dODQo+ID4+PiAgIH0gIGJvb3Rtb2R1bGVfa2luZDsNCj4g
Pj4+DQo+ID4+PiArdHlwZWRlZiBlbnVtIHsNCj4gPj4+ICsgICAgTUVNQkFOS19NRU1PUlksDQo+
ID4+PiArICAgIE1FTUJBTktfWEVOX0RPTUFJTiwgLyogd2hldGhlciB0aGUgbWVtb3J5IGJhbmsg
aXMgYm91bmQgdG8NCj4gYSBYZW4gZG9tYWluLiAqLw0KPiA+Pj4gKyAgICBNRU1CQU5LX1JTVkRf
SEVBUCwgLyogd2hldGhlciB0aGUgbWVtb3J5IGJhbmsgaXMgcmVzZXJ2ZWQgYXMNCj4gaGVhcC4g
Ki8NCj4gPj4+ICt9IG1lbWJhbmtfdHlwZTsNCj4gPj4gV2hlcmVhcyB0aGUgcGF0Y2ggaXRzZWxm
IGxvb2tzIG9rIChpdCBtdXN0IGJlIG1vZGlmaWVkIGFueXdheSBnaXZlbiB0aGUNCj4gY29tbWVu
dHMgZm9yIHBhdGNoICMyKSwNCj4gPj4gTUVNQkFOS19YRU5fRE9NQUlOIG5hbWUgaXMgcXVpdGUg
YW1iaWd1b3VzIHRvIG1lLCBub3cgd2hlbiBpdCBpcw0KPiBwYXJ0IG9mIG1lbWJhbmtfdHlwZSBl
bnVtLg0KPiA+PiBTb21ldGhpbmcgbGlrZSBNRU1CQU5LX1NUQVRJQyBvciBNRU1CQU5LX1NUQVRJ
Q01FTSB3b3VsZCBiZQ0KPiBtdWNoIGNsZWFuZXIgaW4gbXkgb3Bpbmlvbg0KPiA+PiBhcyBpdCB3
b3VsZCBkaXJlY3RseSBpbmRpY2F0ZSB3aGF0IHR5cGUgb2YgbWVtb3J5IHdlIGFyZSB0YWxraW5n
IGFib3V0Lg0KPiA+DQo+ID4gSSBhbSBub3Qgc3VyZS4gVGVjaG5pY2FsbHkgdGhlIHJlc2VydmVk
IGhlYXAgaXMgc3RhdGljIG1lbW9yeSB0aGF0IGhhcw0KPiA+IGJlZW4gYWxsb2NhdGVkIGZvciB0
aGUgaGVhcC4gSW4gZmFjdCwgSSB0aGluayB0aG4gbmFtZSAic3RhdGljbWVtIiBpcw0KPiA+IG5v
dyBiZWNvbWluZyBxdWl0ZSBjb25mdXNpbmcgYmVjYXVzZSB3ZSBhcmUgcmVmZXJyaW5nIHRvIGEg
dmVyeSBzcGVjaWZpYw0KPiA+IHVzZSBjYXNlIChpLmUuIG1lbW9yeSB0aGF0IGhhcyBiZWVuIHJl
c2VydmVkIGZvciBkb21haW4gdXNlKS4NCj4gPg0KPiA+IFNvIEkgd291bGQgcHJlZmVyIGlmIHdl
IGtlZXAgImRvbWFpbiIgaW4gdGhlIG5hbWUuIE1heWJlDQo+ID4gTUVNQkFOS19TVEFUSUNfRE9N
QUlOIG9yIE1FTUJBTktfUkVTRVJWRURfRE9NQUlOLg0KPiA+DQo+IFBlcnNvbmFsbHkgSSB3b3Vs
ZCBkcm9wIGNvbXBsZXRlbHkgdXNpbmcgdGhlICJyZXNlcnZlZCBoZWFwIiBuYW1pbmcgaW4NCj4g
ZmF2b3INCj4gb2YgInN0YXRpYyBoZWFwIiBiZWNhdXNlICJzdGF0aWNtZW0iIGlzIGFsc28gc29t
ZXRoaW5nIHdlIHJlc2VydmUgYXQgYm9vdA0KPiB0aW1lIGZvciBhIGRvbWFpbiB1c2UuDQo+IFRo
aXMgd291bGQgYWxzbyBkaXJlY3RseSBjb3JyZWxhdGUgdG8gdGhlIGRldmljZSB0cmVlIHByb3Bl
cnR5ICJzdGF0aWMtaGVhcCINCj4gYW5kICJzdGF0aWMtbWVtIi4NCj4gVGhlbiBzdWNoIGVudW0g
d291bGQgYmUgY3JlYXRlZCBhcyBmb2xsb3dzIGFuZCBmb3IgbWUgdGhpcyBpcyB0aGUgY2xlYW5l
c3QNCj4gc29sdXRpb246DQo+IE1FTUJBTktfREVGQVVMVA0KPiBNRU1CQU5LX1NUQVRJQ19ET01B
SU4NCj4gTUVNQkFOS19TVEFUSUNfSEVBUA0KPiANCj4gQnV0IEkgdGhpbmsgd2UgYXJlIGFscmVh
ZHkgdG9vIGxhdGUgaW4gdGhpcyBzZXJpZXMgdG8gcmVxdWVzdCBzdWNoIGNoYW5nZXMsDQoNCkkg
YW0gb2sgd2l0aCBhIHB1cmUgcmVuYW1pbmcgdG8gc3RhdGljIGhlYXAgaWYgSnVsaWVuIGlzIG9r
IHdpdGggdGhhdC4gSSB0aGluaw0KSnVsaWVuIGhhcyBkb25lIG1vc3Qgb2YgdGhlIGNvZGUgcmV2
aWV3IGFuZCB3ZSBzdGlsbCBoYXZlIDJ+MyBkYXlzIGZvciBpdC4NCg0KS2luZCByZWdhcmRzLA0K
SGVucnkNCg0KPiBTbyB3aXRoIHRoZSBjdXJyZW50IG5hbWluZyB3ZSBjYW4gZ28gZm9yOg0KPiBN
RU1CQU5LX0RFRkFVTFQNCj4gTUVNQkFOS19SU1ZEX0RPTUFJTiAvKiBtZW1vcnkgcmVzZXJ2ZWQg
Zm9yIGEgZG9tYWluIHVzZSAqLw0KPiBNRU1CQU5LX1JTVkRfSEVBUCAgIC8qIG1lbW9yeSByZXNl
cnZlZCBmb3IgYSBoZWFwIHVzZSAqLw0KPiANCj4gPiBDaGVlcnMsDQo+ID4NCj4gPiAtLQ0KPiA+
IEp1bGllbiBHcmFsbA0KPiANCj4gfk1pY2hhbA0K

