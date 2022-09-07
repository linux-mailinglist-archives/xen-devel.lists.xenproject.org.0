Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5605AF97D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 03:52:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400721.642344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVkEp-0006uV-TZ; Wed, 07 Sep 2022 01:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400721.642344; Wed, 07 Sep 2022 01:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVkEp-0006rd-On; Wed, 07 Sep 2022 01:52:23 +0000
Received: by outflank-mailman (input) for mailman id 400721;
 Wed, 07 Sep 2022 01:52:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q9fF=ZK=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oVkEo-0006rX-1e
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 01:52:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70070.outbound.protection.outlook.com [40.107.7.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b541c14d-2e4f-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 03:52:20 +0200 (CEST)
Received: from DB6PR0802CA0046.eurprd08.prod.outlook.com (2603:10a6:4:a3::32)
 by VI1PR08MB5376.eurprd08.prod.outlook.com (2603:10a6:803:13e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 01:52:08 +0000
Received: from DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::71) by DB6PR0802CA0046.outlook.office365.com
 (2603:10a6:4:a3::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Wed, 7 Sep 2022 01:52:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT033.mail.protection.outlook.com (100.127.142.251) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Wed, 7 Sep 2022 01:52:07 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Wed, 07 Sep 2022 01:52:07 +0000
Received: from 242bada1413d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FAA7F4A4-75DE-4C1F-BEED-D91DA6774E46.1; 
 Wed, 07 Sep 2022 01:51:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 242bada1413d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 01:51:59 +0000
Received: from VI1PR08MB4541.eurprd08.prod.outlook.com (2603:10a6:803:f9::15)
 by DB9PR08MB6555.eurprd08.prod.outlook.com (2603:10a6:10:257::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 01:51:55 +0000
Received: from VI1PR08MB4541.eurprd08.prod.outlook.com
 ([fe80::6c0f:3fa7:3279:802d]) by VI1PR08MB4541.eurprd08.prod.outlook.com
 ([fe80::6c0f:3fa7:3279:802d%2]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 01:51:54 +0000
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
X-Inumbo-ID: b541c14d-2e4f-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lhqrgkjGTtYacmPQGIBqtiHQ919KU/0JyGGsLrT53PKKg5pK9qa174p0WsQjDgLwAgXOOhVFY6SvJG+hmkCvaPk3e2lWS2DITs00cuAE78M5cAabTMNqYUHDU8QekiS0nFIJpMO2WclUTeaqPmvNHWNoMlOr0oRtyuH3gW6q7jyTThegzKzaifdi59axnogt6v+eoG4pZulAgiiCWmc6xe4QbJLuunEsTmUZTBdIyugICV0eUZW9TgZN4wIZGWWYDRQrctBcmMapDpSMukRY2bZDYa8rZs39XvVkmgPiBgb8dh3jrZkgnOsw6fxa63ojh/uG9o2pyFcybvDorctlgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HE9saJQTobUGhxaXnO3gVZQOTovetEBZrp3nW3mrBo=;
 b=RwcNvGhyKq7bq6LPElydsVERykJWy5NOnxwUW6SisElHKBkjgLMh5xPeKS6UUXjImuO7oqN+3ouKppBIK7ukDmyguzo8PVwW1To6iTonv3p9vz71lk5juyY+EChYGloLqmyu9/R0bEtKOZIarhdE9txQHMn0Bkw76ExTSSRz2mzVvDCAcUqA0v0t1NwwBvWKmouw+Ng77w/M369JaLZ8rso5dW4adfJWtX30rFdUtMtBShNE6YY8/ERDiKUp34Cl0EgxHBJ/SYE/Slg9brcKub95o04PQgGdrS9B25q+24/lW7iXlxmviIpoamtnRkE5YS0q+tP9Ebl7Wr5ePqEmGg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HE9saJQTobUGhxaXnO3gVZQOTovetEBZrp3nW3mrBo=;
 b=naSz46mPVrZOPR2pnoOfXxCSsUThe1DIOwe9dkhlhzs95+FDf78CHJHolXLOUFZwnTQlHw0j8AAtROle5BPAk5oUwlm+M70ujnUMYW5wa/B5goHGLy3m8ctHqaJO1XQzON2BD4r/oVG5imCR/3cFie6WY+WYsSFtDdFMsq/iDug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfZC/KJI0XiAk3M0JW+2aVH6TH+L9tn8a1lA/jTytwQhWVPozRmEH0Aw1GFtIslBKbUu2Z5GlE0OMS8m5bYrnjjZSWhpQcMbzDf2GnjRqzgZMm57Yn0V0H5kOCwIAV+qwIq4jXw383izcCHHs0ltjB9q+R9LcNmvutOPTBx5U4hoC0EwbtW8CFzE7+Zci6bMvalAd9UVi54/ImgbYE7V1UDHy9AVwF3IiHL0NDs0c9xVtgJL3FOjfvuMamSZRTPLS2H5+Qjma0vS/q+/dlHsyI5LUdlCN8M6PTJ6C9nqtVt5Wn40Fh55jYQnxw4Br2cY+xAZ8U4unIiWWvF8y2+Apg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HE9saJQTobUGhxaXnO3gVZQOTovetEBZrp3nW3mrBo=;
 b=TC2rrQhEL49YPxFwWc61uSzu/VyUlB9j/fj9w9T+j0flk3mXHKhMoiOMMXd373gv1f+qZa9s70gJm0Z629u/F/pVNTqJAhNZ2ssgAG7qNMfrXaBJrr1B571MnILs4UI4/7o+uri5d+SkOI/bT864vdQ12Gji6MBlswEs1XE7wmsYOS1CGC3SAtIbeeuttadWRdMY9IBVYiR9AtbaOZVxONSGxBREMorrZm/91Nb14s+kXajdktzPkIA+hpyEZXm/nIC9yVytRRHc40y4XJLFb4zxDeIBgsn+bl6ks1aVlL3duAWudBw8/qJ/bBBKfi/oQE+1d2DtjSKTbkWOK8v+Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HE9saJQTobUGhxaXnO3gVZQOTovetEBZrp3nW3mrBo=;
 b=naSz46mPVrZOPR2pnoOfXxCSsUThe1DIOwe9dkhlhzs95+FDf78CHJHolXLOUFZwnTQlHw0j8AAtROle5BPAk5oUwlm+M70ujnUMYW5wa/B5goHGLy3m8ctHqaJO1XQzON2BD4r/oVG5imCR/3cFie6WY+WYsSFtDdFMsq/iDug=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: RE: [PATCH v7 1/9] xen/arm: introduce static shared memory
Thread-Topic: [PATCH v7 1/9] xen/arm: introduce static shared memory
Thread-Index: AQHYwc8YBf6RzKF49UaCIf2FqNDCyq3SsZmAgACDQLA=
Date: Wed, 7 Sep 2022 01:51:52 +0000
Message-ID:
 <VI1PR08MB45410C0E64B6F0D39B32C498F7419@VI1PR08MB4541.eurprd08.prod.outlook.com>
References: <20220906085941.944592-1-Penny.Zheng@arm.com>
 <20220906085941.944592-2-Penny.Zheng@arm.com>
 <c2fd0e69-1eee-89db-44d3-0b8e59a4eced@xen.org>
In-Reply-To: <c2fd0e69-1eee-89db-44d3-0b8e59a4eced@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4530EDB4B31BD24FA2F91269C60EABDC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 899befaf-ed3e-4b25-435c-08da90739269
x-ms-traffictypediagnostic:
	DB9PR08MB6555:EE_|DBAEUR03FT033:EE_|VI1PR08MB5376:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BLClUycMK30LbYPUVVF3PaVBthmlOJsAclLDzoyGkziR57h3/lf8UT6IL/CE8f9cHWIJgPB41DhysRXZFUdNMWQimZsqSZQZNIXLWWU11rstUnlVTOto7Dwuic4uMGU4a7r6EtbmE8cVQkmWXT9nDztBSWq0/OGGtFUTruO6usL5lQzKfJoLk2seaOvWq0nuPM0bIrbUg0/3DGzOiWk/dpxwyJkJfHUiWy/3aGd15FeXB+Ugi5kJ9qjXPXLFZ12abwlC21ws3pUWb7loi6yo/3nLa4UqYkJrIR921QJ2MotTi+lGbNKjHZXYXPFfRDa3MbtNZZf2irFk5yNTjjJyqcPFUQfePrH10bMP2eqw2N18SK3NPXLiF6tkse9yf8ScOZUn/PsSHmXKl7wQuLn6g4e1mAv1J9PaceA8LC8uHltc/3dBxmF7CTcjlkZ4/V+bV3O5TTPQRHdNyxYOtbsE+dm4X+lfPfyIYWvJwoGMpj2ICOhKGTb+/HIoAGbiPxQ60oP8jeA7EK91uHzM+WQKcq871pIMTj3ioI7uPIA4XlxFFgzb9gN3B5pKVMfu4pzEbnUgc+74SMutAb1ndw03y1wwfw3vAJZpzCEsXpieFbw9Hmtbgs56FngiKDjooNIus4BQYEwcthPf9swIMW50+Xq2abJn74E7X6ZNFkiomKDV0T26hiAvIEVIDVIs3s9K7e5bKHlSaVeL4W0zkGac9wI9BPdAua6MlVU2rQjXpI6+RVCOeY4ouzqRzvDg+0vENtUSiCFPRvNR4C8zu6gREl05wP4FZ21EN7X2AByGAoX4LVAF3GzQUAVw+cHVehYeYAnBLJpa6RXmXxboOrczgjdM9d1CjgUDzxvdBsiGuXU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB4541.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(38070700005)(83380400001)(33656002)(76116006)(122000001)(66556008)(2906002)(66446008)(38100700002)(4326008)(8676002)(64756008)(66946007)(66476007)(186003)(5660300002)(52536014)(316002)(8936002)(86362001)(966005)(478600001)(9686003)(6506007)(55016003)(41300700001)(53546011)(71200400001)(7696005)(26005)(110136005)(54906003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6555
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	854dcd8c-dfad-44eb-8eb6-08da90738991
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UMJPP3L8+3tPWVYIwLF1GCkivSc/0mzhS0STBElEwc4CEHkcsCcf/sbnQ3wI0Pc7TXFD4mAZCoSM8J3gGBFucmApUqtsdUIWHZ19E9ex5MnmHFLLeSQ44R26iseUFlAguFse12Asnmmo1PojDNXZ5728BA1ks3HC0q8tanDio6huwsLqvHIZ45iK/R8oddUE9S8AFv8pFKYMtKrII0VLB+XflDZPoCrqYs6B85lO82AVC/8Vv6RTUomMmndKyF5X16sVH0PY1FbCyE6W2wsu2EdP8kyAOzRfTBIgnDRBeKuXNw4ZOJ+T58nY1JAGPBTQIlaXNM9uukapiofeLbFtQy6kGKrlg5tGUiD9LeSSAoV/dKEoDpoMJkNB9dnEK9Im2pCJrzzizbRec4ZOZagmxDpO1/K3DVA4m4TimYzx1x4MwbRrON6/MrRulbLFJDu2k119yVd4pXvCjLcMJVbkW/CrjYoyHAuLRoLrHdkSlip7J3koXJh1XzGUq6pE0Pkm2cIQsYol8XC7WX+zaXyiA73gtS47k20fEv1thVnHrMRz/UTV8THTxWZ/LxlyfP7kjcx88GbCoxYFf4lmvoL2IU6iuiUSuszKD/VKMWDSQhEkBQ4/o7FzxbEbeSjv92ltba+M8k7UV7roLjmdkzA6l3W1Vz/cp9kYjBCH5koZFlaTF4sKd8LqIbaAowNbVKRtVm15KRhsL1m5WvpzkZPMa0uFzgEZThYghdszM54NmDBRopX1ACZX6Ha84qLhnYX1T1AzmZ0TgrV3300Jp/GU5iY52YD7yPm2U96q15y5DWE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966006)(36840700001)(40470700004)(356005)(40460700003)(81166007)(70586007)(82740400003)(36860700001)(8676002)(4326008)(110136005)(70206006)(82310400005)(316002)(83380400001)(40480700001)(2906002)(52536014)(55016003)(5660300002)(8936002)(41300700001)(9686003)(186003)(47076005)(336012)(26005)(478600001)(966005)(53546011)(6506007)(54906003)(7696005)(33656002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 01:52:07.8357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 899befaf-ed3e-4b25-435c-08da90739269
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5376

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgNywg
MjAyMiAyOjAxIEFNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFy
bS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBC
ZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+Ow0KPiBWb2xvZHlteXIg
QmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBIZW5yeSBXYW5nDQo+IDxIZW5y
eS5XYW5nQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjcgMS85XSB4ZW4vYXJtOiBp
bnRyb2R1Y2Ugc3RhdGljIHNoYXJlZCBtZW1vcnkNCj4gDQo+IEhpIFBlbm55LA0KPiANCj4gT24g
MDYvMDkvMjAyMiAwOTo1OSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gICBzdGF0aWMgaW50IF9f
aW5pdCBlYXJseV9zY2FuX25vZGUoY29uc3Qgdm9pZCAqZmR0LA0KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGludCBub2RlLCBjb25zdCBjaGFyICpuYW1lLCBpbnQgZGVw
dGgsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIGFkZHJlc3Nf
Y2VsbHMsIHUzMiBzaXplX2NlbGxzLA0KPiA+IEBAIC0zODYsNiArNTQ5LDggQEAgc3RhdGljIGlu
dCBfX2luaXQgZWFybHlfc2Nhbl9ub2RlKGNvbnN0IHZvaWQgKmZkdCwNCj4gPiAgICAgICAgICAg
cHJvY2Vzc19jaG9zZW5fbm9kZShmZHQsIG5vZGUsIG5hbWUsIGFkZHJlc3NfY2VsbHMsIHNpemVf
Y2VsbHMpOw0KPiA+ICAgICAgIGVsc2UgaWYgKCBkZXB0aCA9PSAyICYmIGRldmljZV90cmVlX25v
ZGVfY29tcGF0aWJsZShmZHQsIG5vZGUsDQo+ICJ4ZW4sZG9tYWluIikgKQ0KPiA+ICAgICAgICAg
ICByYyA9IHByb2Nlc3NfZG9tYWluX25vZGUoZmR0LCBub2RlLCBuYW1lLCBhZGRyZXNzX2NlbGxz
LA0KPiA+IHNpemVfY2VsbHMpOw0KPiA+ICsgICAgZWxzZSBpZiAoIGRlcHRoIDw9IDMgJiYgZGV2
aWNlX3RyZWVfbm9kZV9jb21wYXRpYmxlKGZkdCwgbm9kZSwNCj4gInhlbixkb21haW4tc2hhcmVk
LW1lbW9yeS12MSIpICkNCj4gPiArICAgICAgICByYyA9IHByb2Nlc3Nfc2htX25vZGUoZmR0LCBu
b2RlLCBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzKTsNCj4gPg0KPiA+ICAgICAgIGlmICggcmMg
PCAwICkNCj4gPiAgICAgICAgICAgcHJpbnRrKCJmZHQ6IG5vZGUgYCVzJzogcGFyc2luZyBmYWls
ZWRcbiIsIG5hbWUpOyBkaWZmIC0tZ2l0DQo+ID4gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20v
c2V0dXAuaA0KPiBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zZXR1cC5oDQo+ID4gaW5kZXgg
NTgxNWNjZjhjNS4uOTk1ZWVlMWQwOSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5j
bHVkZS9hc20vc2V0dXAuaA0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zZXR1
cC5oDQo+ID4gQEAgLTIzLDEwICsyMywxNyBAQCB0eXBlZGVmIGVudW0gew0KPiA+ICAgfSAgYm9v
dG1vZHVsZV9raW5kOw0KPiA+DQo+ID4NCj4gPiArLyogSW5kaWNhdGVzIHRoZSBtYXhpbXVtIG51
bWJlciBvZiBjaGFyYWN0ZXJzKFwwIGluY2x1ZGVkKSBmb3Igc2htX2lkDQo+ID4gKyovICNkZWZp
bmUgTUFYX1NITV9JRF9MRU5HVEggMTYNCj4gPiArDQo+ID4gICBzdHJ1Y3QgbWVtYmFuayB7DQo+
ID4gICAgICAgcGFkZHJfdCBzdGFydDsNCj4gPiAgICAgICBwYWRkcl90IHNpemU7DQo+ID4gICAg
ICAgYm9vbCB4ZW5fZG9tYWluOyAvKiB3aGV0aGVyIHRoZSBtZW1vcnkgYmFuayBpcyBib3VuZCB0
byBhIFhlbg0KPiA+IGRvbWFpbi4gKi8NCj4gPiArI2lmZGVmIENPTkZJR19TVEFUSUNfU0hNDQo+
ID4gKyAgICBjaGFyIHNobV9pZFtNQVhfU0hNX0lEX0xFTkdUSF07DQo+ID4gKyAgICB1bnNpZ25l
ZCBpbnQgbnJfc2htX2JvcnJvd2VyczsNCj4gPiArI2VuZGlmDQo+IA0KPiBJIGZvcmdvdCB0byBt
ZW50aW9uIHRoYXQgdGhpcyB3aWxsIGNsYXNoIHdpdGggSGVucnkncyBzZXJpZXMgWzFdLiBBcyBi
b3RoIHNlcmllcw0KPiBhcmUgbWVhbnQgZm9yIDQuMTcsIHBsZWFzZSBjb29yZGluYXRlIHRvIGRl
Y2lkZSB3aGljaCBzZXJpZXMgc2hvdWxkIGJlDQo+IG1lcmdlZCBmaXJzdCAodGhpcyBpcyB0byBh
dm9pZCBsYXN0IG1pbnV0ZSBjbGFzaCBvbiBGcmlkYXkpLg0KPiANCg0KSSdsbCBwdXNoIHY4IEFT
QVAgd2hlbiBoZW5yeSdzIGNvbW1pdHMgZ2V0IGNvbW1pdHRlZH5+fn4NCg0KPiBDaGVlcnMsDQo+
IA0KPiBbMV0NCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzIwMjIwOTA1MDcy
NjM1LjE2Mjk0LTEtDQo+IEhlbnJ5LldhbmdAYXJtLmNvbS8NCj4gDQo+IC0tDQo+IEp1bGllbiBH
cmFsbA0K

