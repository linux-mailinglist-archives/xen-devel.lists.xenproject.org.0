Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C71F53202B
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 03:08:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336093.560385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntJ1D-0007ud-Tk; Tue, 24 May 2022 01:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336093.560385; Tue, 24 May 2022 01:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntJ1D-0007rU-QB; Tue, 24 May 2022 01:07:27 +0000
Received: by outflank-mailman (input) for mailman id 336093;
 Tue, 24 May 2022 01:07:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aI9d=WA=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ntJ1C-0007r5-0W
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 01:07:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddd19dcf-dafd-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 03:07:24 +0200 (CEST)
Received: from AS9PR06CA0067.eurprd06.prod.outlook.com (2603:10a6:20b:464::26)
 by VI1PR08MB5439.eurprd08.prod.outlook.com (2603:10a6:803:13b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Tue, 24 May
 2022 01:07:18 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::19) by AS9PR06CA0067.outlook.office365.com
 (2603:10a6:20b:464::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Tue, 24 May 2022 01:07:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 01:07:17 +0000
Received: ("Tessian outbound 07c1c99345b0:v119");
 Tue, 24 May 2022 01:07:17 +0000
Received: from 88e382616667.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 91DD7381-2227-449F-A968-F84F68140F39.1; 
 Tue, 24 May 2022 01:07:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 88e382616667.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 May 2022 01:07:08 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM6PR08MB4327.eurprd08.prod.outlook.com (2603:10a6:20b:ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Tue, 24 May
 2022 01:07:04 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e%3]) with mapi id 15.20.5273.022; Tue, 24 May 2022
 01:07:03 +0000
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
X-Inumbo-ID: ddd19dcf-dafd-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RGtmHxPrpVmv1a5V+RKyWVhLtf4STmBHvBO1sPRvHKgaWxtbWz3TZ9Ka7aG6SQ22g9jok2tebX3pWPqS/9NZei61O1apyVv2LSx9YB8fK+lxboYFNGU9kU3T4gCFk/enPG7Q+l2wavn7Agtd68aNarampI+UX1Z6VU38eTGpzxMqp2ZG4G4w7oLD4e9DKll+pVqfjOV8oeygKzmFTbqybne1iut0Igb5leog8I6DNMxC/BEhhdW+ycdoa9SuHFC9FsTzmfuLGpg16vOMVCJKn5QMOSnecWYjQzid/8fxe01gTAtwJ++pgb3kvH7HbJvTQU26CfnS9lFI/9QSzxhlHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYzxOUjOLbqe1e4CwOaHvw457RqSw57OYffXqwCDFb4=;
 b=Q5ljafge0kBYeifk8TkJKrB0DBDMzFs1NlHxW+BllHAqOsY/d9ogh9xhMeSh0q6S13k5Hz2ZuPsx+qqzG3LYs9wsrce2eVAr42CsxF1Ynz93NsbvRflig0xhzvJxATjOm8YwapLLbfchlzNi8MfhB1T5O8RejS8XyVWPlMO0ykRN1Vtptu1z8OevdEE53iA3SuMczywdEmcwoM0bysEsG8kjWwyndReo0/DQKKQa7nBmrWYP46DmamcDbpQhssOjIZVYzRtD/UsB9u0U0VAMLBGcEhEG9J08QCKG1OL6TA0yj6TZGFrqhV6Q/GgGksFyKH5zbzf2zP6uOyE20KHHEQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYzxOUjOLbqe1e4CwOaHvw457RqSw57OYffXqwCDFb4=;
 b=SDHDhFaezGcH4SNFNq/sSWL0eQPbFehtRG7AA6r8vTixvt5OvidkNUXocvVKrbC/Zdnvqg+ZdUE/l/diCivb2qdVtaCtbL0xO5Kgkf/AsJ+zfll27bVwh91WFdpoDLqt9bWjS70qsseX1ZOuxqzdLpM05YjmnZJMbRvia9+fuLg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ql51eOi3LOrcdG9m/9zbJz0YfV+sKUY0dcxrk+ifIEuUzPLUmAkGm/lT8bTJufe2W9aiZ8kOyU9PAFK6+R08QdZmrZklrQTZPYqFk5avguYZo2KUUaVO0NFQl8Ht9FHmRjIbPpUDGAhoCmOIUb2m7de6i2+//dUSD6MT/bblk3eu7nAJaMg+vzsp4JWr1qqTV+KKo2gZQalWDgNb2XtH4++DfAPp2+Ykp2oof13nB3h6WGMpDcoiGxwjGFO2SwjSC4NatkCJR0nyn0PXVjXzjgwd7pATC8zblQ2QoGu/CBMMaA7oKrmDFcvDawclRCKa1Pequ2pje381UE80zzOX8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYzxOUjOLbqe1e4CwOaHvw457RqSw57OYffXqwCDFb4=;
 b=B17AUycGTJQ7F3y4gvu8bzVeSvnMHNYcYLMMn6AQFY8zRCorNapCV9PPTkPQqFxpdTu8qTQlKlvib1Hswv3ECy/09RAIJRjwkJG0P6Idhg54ruq3HmToWdYt4PKAwQERtdCbiG4AGowHuINCS6NIEkOnc5IvQHHZq0dXzJreJNLiyoaKIrU9byLGAzyilPCy4lI/bBMbmxCc1IpTN94bBQ3IpXsTt5u62iX8XZ2yFrKeBIiBtl21AuTPi+/SaWijq/PqNfl0Ck4OYkW6+ikvtlTmFDNV08rbkL6AVRQciLOha3e0odWfDjWPxolSwES/Sjq9tGV3zf41hGYJpSsy4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYzxOUjOLbqe1e4CwOaHvw457RqSw57OYffXqwCDFb4=;
 b=SDHDhFaezGcH4SNFNq/sSWL0eQPbFehtRG7AA6r8vTixvt5OvidkNUXocvVKrbC/Zdnvqg+ZdUE/l/diCivb2qdVtaCtbL0xO5Kgkf/AsJ+zfll27bVwh91WFdpoDLqt9bWjS70qsseX1ZOuxqzdLpM05YjmnZJMbRvia9+fuLg=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Michal Orzel <Michal.Orzel@arm.com>, Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm: setup: nr_banks should be unsigned int
Thread-Topic: [PATCH] xen/arm: setup: nr_banks should be unsigned int
Thread-Index: AQHYbt36sziAOg4NNEauktgt4qmeGq0tNzTA
Date: Tue, 24 May 2022 01:07:03 +0000
Message-ID:
 <PAXPR08MB7420B675C676268501048D1B9ED79@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220523194631.66262-1-julien@xen.org>
In-Reply-To: <20220523194631.66262-1-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9261E93E4A65DD4E8AAB7B79CC5EE8A3.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a8319b6e-d137-49fa-1cd8-08da3d21bf67
x-ms-traffictypediagnostic:
	AM6PR08MB4327:EE_|VE1EUR03FT028:EE_|VI1PR08MB5439:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB54393E7BE37C150BEFED8A439ED79@VI1PR08MB5439.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 w2jEI5eMR6by1kRKsMmOknNfJHlN2NTYRC8aimvtBtQYukrsYGP1sZRI5qxlwJSu+YJYOT/1NHqlm9dQnrle4RlXsg17nz0wtXoEkMoKOjm287HmtmRZQzcNz+TbNDyQhU7lRG2dshyNokcmp4tH4yDH44ZHduGAxwqVsK5V9dDTme0ou4ddrf+3Qfope4EVwmIIfXpjEL8EYVvyVals39mLIXCPndK8BPSCL1pVTzJPznjRVmW1apV/eUaLNSs2yB5lI4jK2sBobf4cqPN9/H9frfd+8nm4xIZGwKCeWfOZ5mcERpcbYeyR0USASCfMekA0aOcESD47beGnpOoVln/L4zhdLp+wCzF4E0/3NawiTgfKVkXgaAhV+gYK1yqjZXDpY5xbtDivbvBGMOk7YA+l4zOm5U0j/0ToIPr2WxoPWWH9Bqipq604NnUqZ3Ys/OJNaHIaX1Lv2Zs2uDtHI+3Ed2eZ/CHYe7Z/awppv73E9G7W1hh/Fn+9giUl/HTeaERHGPlo+BOIsCxn2LB88uBl2LF9b5/FGND7LRoqHVRDcNKIbhCxI6WOLSy1L+Y0uC5iqi+SjuATMM4+8ncEx+SQQiHC2A3480Z5HDfxJn+DTafuLk9Ve8h7hSccATWaIp2GEmLzU3qnC5GqcZ6OSwN3SIevvGn/TWT3tEMBVvw7NEV9IqAWMtojSinBf58EUSmV269ebNFv5NhVhrHCTA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(110136005)(66446008)(38070700005)(64756008)(66556008)(2906002)(316002)(33656002)(83380400001)(76116006)(54906003)(8676002)(66946007)(4326008)(71200400001)(122000001)(38100700002)(6506007)(186003)(53546011)(508600001)(7696005)(5660300002)(8936002)(52536014)(55016003)(26005)(9686003)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4327
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c339136a-b4ab-4871-02a7-08da3d21b6ed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zRNiVGthbBrSCYDAz/r1dgIjoBwUHomylQMaWexwd+dCmUk/sweFQIsbi7vj4hvscps1xv9MsUR/yPrjDNT+V9dQifFQNvQs7sLMn2b3XVM0Q7BgQY7HPuPmoLJwD1EGXCuMrKUX7zPprcCzzdgzWsnJssVQ5aL/PPbx5JVETWsRFWEPIkKKrYHU+kqkouXObtLypNElI+UKBKy6AcHtKTXtxisnqHLjRt+6Kfr3O9RjMUXUXiTifVaqYoRw8TtYG+VgjRkiHDlLcCUwr4mTYULwLnGgUWJmUL63rH2U+EXC62hBT3XhqEgZjGsfSCIVdsQyckbRrj7+79DEIWJY4XU1raVXZh12ttunVoRWxwYHVR742uHH+gqOgwOnRYFg3ujz45EKczQkMvPHioNu6+5uOk8h6bdPgpfvAZUOdSACsvWl3rCFOPCY1dOwFnYuiCDDA/2x/AvPksqZISjsjNZkCi1Pvx7xyRSMv85XbLJU+dy0idLnG/OaCS0GhNQnQebMxi/kENuTxjHhRZm8zr4+2KkiuZES2eGSaEc1eEXsV7rJ7dFULSAWopiOG0R1D6WsqXjMYwMeNamS+dTkAIkshs+LR4sHi0zVw2YjVN6FqhtIhRgM8UCvYx1SylckSn69clSaefYnu3+p8p0ScrnXZ4U7a972bY8XD9AINfi2u6X++1H3HBUkiMqgqzkz
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(81166007)(82310400005)(316002)(47076005)(53546011)(54906003)(70586007)(70206006)(186003)(336012)(107886003)(52536014)(356005)(7696005)(8936002)(4326008)(8676002)(33656002)(110136005)(508600001)(9686003)(86362001)(26005)(6506007)(36860700001)(5660300002)(83380400001)(55016003)(2906002)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 01:07:17.9324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8319b6e-d137-49fa-1cd8-08da3d21bf67
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5439

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFhlbi1k
ZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBP
Zg0KPiBKdWxpZW4gR3JhbGwNCj4gU2VudDogMjAyMsTqNdTCMjTI1SAzOjQ3DQo+IFRvOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IE1pY2hhbCBPcnplbCA8TWljaGFsLk9y
emVsQGFybS5jb20+OyBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPjsNCj4gU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz47DQo+IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNv
bT47IFZvbG9keW15ciBCYWJjaHVrDQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4g
U3ViamVjdDogW1BBVENIXSB4ZW4vYXJtOiBzZXR1cDogbnJfYmFua3Mgc2hvdWxkIGJlIHVuc2ln
bmVkIGludA0KPiANCj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4g
DQo+IEl0IGlzIG5vdCBwb3NzaWJsZSB0byBoYXZlIGEgbmVnYXRpdmUgbnVtYmVyIG9mIGJhbmtz
LiBTbyBzd2l0Y2gNCj4gdG8gdW5zaWduZWQgaW50Lg0KPiANCj4gVGhlIHR5cGUgY2hhbmdlIGlz
IGFsc28gcHJvcGFnYXRlZCB0byBhbnkgdXNlcnMgb2YgbnJfYmFua3MgdGhhdA0KPiB3ZXJlIHVz
aW5nICJpbnQiICh0aGVyZSBhcmUgbm90IHRoYXQgbWFueSkuDQo+IA0KPiBOb3RlIHRoYXQgZmR0
X251bV9tZW1fcnN2KCkgY2FuIGFjdHVhbGx5IHJldHVybnMgYSBuZWdhdGl2ZSB2YWx1ZQ0KPiBp
biBjYXNlIG9mIGFuIGVycm9yLiBTbyB0aGUgcmV0dXJuIHNob3VsZCBiZSBjaGVja2VkIGJlZm9y
ZSBhc3NpZ25pbmcNCj4gdGhlIHJlc3VsdCB0byBhbiB1bnNpZ25lZCB2YXJpYWJsZS4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+IC0tLQ0K
PiAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jICAgICAgfCAgOSArKysrKy0tLS0NCj4gIHhl
bi9hcmNoL2FybS9lZmkvZWZpLWRvbTAuYyAgICAgIHwgIDQgKystLQ0KPiAgeGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL3NldHVwLmggfCAgNiArKystLS0NCj4gIHhlbi9hcmNoL2FybS9zZXR1cC5j
ICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKy0tLS0NCj4gIDQgZmlsZXMgY2hhbmdlZCwg
MjMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+
IGluZGV4IGFhNzc3NzQxYmRkMC4uNmVjYjY2NzNhM2NkIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
DQo+IEBAIC0xMTEsNyArMTExLDggQEAgc3RhdGljIGJvb2wgX19pbml0IGluc2VydF8xMV9iYW5r
KHN0cnVjdCBkb21haW4gKmQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IHBhZ2VfaW5mbyAqcGcsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IG9yZGVyKQ0KPiAgew0KPiAtICAgIGludCByZXMsIGk7DQo+ICsgICAg
dW5zaWduZWQgaW50IGk7DQo+ICsgICAgaW50IHJlczsNCj4gICAgICBtZm5fdCBzbWZuOw0KPiAg
ICAgIHBhZGRyX3Qgc3RhcnQsIHNpemU7DQo+IA0KPiBAQCAtMjY0LDcgKzI2NSw3IEBAIHN0YXRp
YyB2b2lkIF9faW5pdCBhbGxvY2F0ZV9tZW1vcnlfMTEoc3RydWN0IGRvbWFpbiAqZCwNCj4gICAg
ICBjb25zdCB1bnNpZ25lZCBpbnQgbWluX29yZGVyID0gZ2V0X29yZGVyX2Zyb21fYnl0ZXMoTUIo
NCkpOw0KPiAgICAgIHN0cnVjdCBwYWdlX2luZm8gKnBnOw0KPiAgICAgIHVuc2lnbmVkIGludCBv
cmRlciA9IGdldF9hbGxvY2F0aW9uX3NpemUoa2luZm8tPnVuYXNzaWduZWRfbWVtKTsNCj4gLSAg
ICBpbnQgaTsNCj4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4gDQo+ICAgICAgYm9vbCBsb3dtZW0g
PSB0cnVlOw0KPiAgICAgIHVuc2lnbmVkIGludCBsb3dtZW1fYml0c2l6ZSA9IG1pbigzMlUsIGFy
Y2hfZ2V0X2RtYV9iaXRzaXplKCkpOw0KPiBAQCAtMTAyMiw4ICsxMDIzLDggQEAgc3RhdGljIGlu
dCBfX2luaXQgbWFrZV9tZW1vcnlfbm9kZShjb25zdCBzdHJ1Y3QNCj4gZG9tYWluICpkLA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgYWRkcmNlbGxzLCBpbnQgc2l6
ZWNlbGxzLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbWVt
aW5mbyAqbWVtKQ0KPiAgew0KPiAtICAgIGludCByZXMsIGk7DQo+IC0gICAgaW50IHJlZ19zaXpl
ID0gYWRkcmNlbGxzICsgc2l6ZWNlbGxzOw0KPiArICAgIHVuc2lnbmVkIGludCBpOw0KPiArICAg
IGludCByZXMsIHJlZ19zaXplID0gYWRkcmNlbGxzICsgc2l6ZWNlbGxzOw0KPiAgICAgIGludCBu
cl9jZWxscyA9IDA7DQo+ICAgICAgLyogUGxhY2Vob2xkZXIgZm9yIG1lbW9yeUAgKyBhIDY0LWJp
dCBudW1iZXIgKyBcMCAqLw0KPiAgICAgIGNoYXIgYnVmWzI0XTsNCj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9lZmkvZWZpLWRvbTAuYyBiL3hlbi9hcmNoL2FybS9lZmkvZWZpLWRvbTAuYw0K
PiBpbmRleCA0OTQ0MjBlYWEyM2UuLmFhZTBmOTc5MTEyYSAxMDA2NDQNCj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2VmaS9lZmktZG9tMC5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9lZmkvZWZpLWRvbTAu
Yw0KPiBAQCAtMzQsMTQgKzM0LDE0IEBADQo+ICAvKiBDb25zdGFudCB0byBpbmRpY2F0ZSAiWGVu
IiBpbiB1bmljb2RlIHUxNiBmb3JtYXQgKi8NCj4gIHN0YXRpYyBjb25zdCBDSEFSMTYgeGVuX2Vm
aV9md192ZW5kb3JbXSA9IHsweDAwNTgsIDB4MDA2NSwgMHgwMDZFLA0KPiAweDAwMDB9Ow0KPiAN
Cj4gLXNpemVfdCBfX2luaXQgZXN0aW1hdGVfZWZpX3NpemUoaW50IG1lbV9ucl9iYW5rcykNCj4g
K3NpemVfdCBfX2luaXQgZXN0aW1hdGVfZWZpX3NpemUodW5zaWduZWQgaW50IG1lbV9ucl9iYW5r
cykNCj4gIHsNCj4gICAgICBzaXplX3Qgc2l6ZTsNCj4gICAgICBzaXplX3QgZXN0X3NpemUgPSBz
aXplb2YoRUZJX1NZU1RFTV9UQUJMRSk7DQo+ICAgICAgc2l6ZV90IGVjdF9zaXplID0gc2l6ZW9m
KEVGSV9DT05GSUdVUkFUSU9OX1RBQkxFKTsNCj4gICAgICBzaXplX3QgZW1kX3NpemUgPSBzaXpl
b2YoRUZJX01FTU9SWV9ERVNDUklQVE9SKTsNCj4gICAgICBzaXplX3QgZndfdmVuZG9yX3NpemUg
PSBzaXplb2YoeGVuX2VmaV9md192ZW5kb3IpOw0KPiAtICAgIGludCBhY3BpX21lbV9ucl9iYW5r
cyA9IDA7DQo+ICsgICAgdW5zaWduZWQgaW50IGFjcGlfbWVtX25yX2JhbmtzID0gMDsNCj4gDQo+
ICAgICAgaWYgKCAhYWNwaV9kaXNhYmxlZCApDQo+ICAgICAgICAgIGFjcGlfbWVtX25yX2Jhbmtz
ID0gYm9vdGluZm8uYWNwaS5ucl9iYW5rczsNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9p
bmNsdWRlL2FzbS9zZXR1cC5oDQo+IGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3NldHVwLmgN
Cj4gaW5kZXggN2ExZTFkNjc5ODljLi4yYmIwMWVjZmE4OGYgMTAwNjQ0DQo+IC0tLSBhL3hlbi9h
cmNoL2FybS9pbmNsdWRlL2FzbS9zZXR1cC5oDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRl
L2FzbS9zZXR1cC5oDQo+IEBAIC0zMCw3ICszMCw3IEBAIHN0cnVjdCBtZW1iYW5rIHsNCj4gIH07
DQo+IA0KPiAgc3RydWN0IG1lbWluZm8gew0KPiAtICAgIGludCBucl9iYW5rczsNCj4gKyAgICB1
bnNpZ25lZCBpbnQgbnJfYmFua3M7DQo+ICAgICAgc3RydWN0IG1lbWJhbmsgYmFua1tOUl9NRU1f
QkFOS1NdOw0KPiAgfTsNCj4gDQo+IEBAIC05Myw3ICs5Myw3IEBAIGV4dGVybiBkb21pZF90IG1h
eF9pbml0X2RvbWlkOw0KPiANCj4gIHZvaWQgY29weV9mcm9tX3BhZGRyKHZvaWQgKmRzdCwgcGFk
ZHJfdCBwYWRkciwgdW5zaWduZWQgbG9uZyBsZW4pOw0KPiANCj4gLXNpemVfdCBlc3RpbWF0ZV9l
Zmlfc2l6ZShpbnQgbWVtX25yX2JhbmtzKTsNCj4gK3NpemVfdCBlc3RpbWF0ZV9lZmlfc2l6ZSh1
bnNpZ25lZCBpbnQgbWVtX25yX2JhbmtzKTsNCj4gDQo+ICB2b2lkIGFjcGlfY3JlYXRlX2VmaV9z
eXN0ZW1fdGFibGUoc3RydWN0IGRvbWFpbiAqZCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgbWVtYmFuayB0YmxfYWRkW10pOw0KPiBAQCAtMTA5LDcgKzEwOSw3
IEBAIHZvaWQgY3JlYXRlX2RvbTAodm9pZCk7DQo+IA0KPiAgdm9pZCBkaXNjYXJkX2luaXRpYWxf
bW9kdWxlcyh2b2lkKTsNCj4gIHZvaWQgZndfdW5yZXNlcnZlZF9yZWdpb25zKHBhZGRyX3Qgcywg
cGFkZHJfdCBlLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAoKmNiKShwYWRk
cl90LCBwYWRkcl90KSwgaW50IGZpcnN0KTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
IHZvaWQgKCpjYikocGFkZHJfdCwgcGFkZHJfdCksIHVuc2lnbmVkIGludA0KPiBmaXJzdCk7DQo+
IA0KPiAgc2l6ZV90IGJvb3RfZmR0X2luZm8oY29uc3Qgdm9pZCAqZmR0LCBwYWRkcl90IHBhZGRy
KTsNCj4gIGNvbnN0IGNoYXIgKmJvb3RfZmR0X2NtZGxpbmUoY29uc3Qgdm9pZCAqZmR0KTsNCj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMN
Cj4gaW5kZXggZGIxNzY4YzAzZjAzLi5iMzBiY2NiYWE3ZGYgMTAwNjQ0DQo+IC0tLSBhL3hlbi9h
cmNoL2FybS9zZXR1cC5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+IEBAIC0yMDEs
OSArMjAxLDE3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwcm9jZXNzb3JfaWQodm9pZCkNCj4gDQo+
ICBzdGF0aWMgdm9pZCBfX2luaXQgZHRfdW5yZXNlcnZlZF9yZWdpb25zKHBhZGRyX3QgcywgcGFk
ZHJfdCBlLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lk
ICgqY2IpKHBhZGRyX3QsIHBhZGRyX3QpLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpbnQgZmlyc3QpDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmaXJzdCkNCj4gIHsNCj4gLSAgICBpbnQgaSwgbnIg
PSBmZHRfbnVtX21lbV9yc3YoZGV2aWNlX3RyZWVfZmxhdHRlbmVkKTsNCj4gKyAgICB1bnNpZ25l
ZCBpbnQgaSwgbnI7DQo+ICsgICAgaW50IHJjOw0KPiArDQo+ICsgICAgcmMgPSBmZHRfbnVtX21l
bV9yc3YoZGV2aWNlX3RyZWVfZmxhdHRlbmVkKTsNCj4gKyAgICBpZiAoIHJjIDwgMCApDQo+ICsg
ICAgICAgIHBhbmljKCJVbmFibGUgdG8gcmV0cmlldmUgdGhlIG51bWJlciBvZiByZXNlcnZlZCBy
ZWdpb25zDQo+IChyYz0lZClcbiIsDQo+ICsgICAgICAgICAgICAgIHJjKTsNCj4gKw0KPiArICAg
IG5yID0gcmM7DQo+IA0KPiAgICAgIGZvciAoIGkgPSBmaXJzdDsgaSA8IG5yIDsgaSsrICkNCj4g
ICAgICB7DQo+IEBAIC0yNDksNyArMjU3LDggQEAgc3RhdGljIHZvaWQgX19pbml0IGR0X3VucmVz
ZXJ2ZWRfcmVnaW9ucyhwYWRkcl90IHMsDQo+IHBhZGRyX3QgZSwNCj4gIH0NCj4gDQo+ICB2b2lk
IF9faW5pdCBmd191bnJlc2VydmVkX3JlZ2lvbnMocGFkZHJfdCBzLCBwYWRkcl90IGUsDQo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAoKmNiKShwYWRkcl90LCBwYWRk
cl90KSwgaW50IGZpcnN0KQ0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZv
aWQgKCpjYikocGFkZHJfdCwgcGFkZHJfdCksDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgaW50IGZpcnN0KQ0KPiAgew0KPiAgICAgIGlmICggYWNwaV9kaXNh
YmxlZCApDQo+ICAgICAgICAgIGR0X3VucmVzZXJ2ZWRfcmVnaW9ucyhzLCBlLCBjYiwgZmlyc3Qp
Ow0KPiBAQCAtNjkzLDcgKzcwMiw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9tbSh2b2lk
KQ0KPiAgICAgIHBhZGRyX3QgcmFtX3N0YXJ0LCByYW1fZW5kLCByYW1fc2l6ZSwgZTsNCj4gICAg
ICB1bnNpZ25lZCBsb25nIHJhbV9wYWdlczsNCj4gICAgICB1bnNpZ25lZCBsb25nIGhlYXBfcGFn
ZXMsIHhlbmhlYXBfcGFnZXMsIGRvbWhlYXBfcGFnZXM7DQo+IC0gICAgaW50IGk7DQo+ICsgICAg
dW5zaWduZWQgaW50IGk7DQo+ICAgICAgY29uc3QgdWludDMyX3QgY3RyID0gUkVBRF9DUDMyKENU
Uik7DQo+IA0KPiAgICAgIGlmICggIWJvb3RpbmZvLm1lbS5ucl9iYW5rcyApDQoNClJldmlld2Vk
LWJ5OiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCg0KPiAtLQ0KPiAyLjMyLjANCj4gDQoN
Cg==

