Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717B6450227
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 11:13:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225737.389869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmYzF-0005nb-MM; Mon, 15 Nov 2021 10:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225737.389869; Mon, 15 Nov 2021 10:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmYzF-0005ke-Ib; Mon, 15 Nov 2021 10:13:17 +0000
Received: by outflank-mailman (input) for mailman id 225737;
 Mon, 15 Nov 2021 10:13:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z40d=QC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mmYzE-0005kY-Ss
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 10:13:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7d00::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a553c971-45fc-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 11:13:15 +0100 (CET)
Received: from AS9PR04CA0061.eurprd04.prod.outlook.com (2603:10a6:20b:48b::15)
 by AM9PR08MB7291.eurprd08.prod.outlook.com (2603:10a6:20b:436::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Mon, 15 Nov
 2021 10:13:13 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48b:cafe::e7) by AS9PR04CA0061.outlook.office365.com
 (2603:10a6:20b:48b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Mon, 15 Nov 2021 10:13:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Mon, 15 Nov 2021 10:13:13 +0000
Received: ("Tessian outbound 1cfce3f02e53:v109");
 Mon, 15 Nov 2021 10:13:13 +0000
Received: from 9fb19854e47f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 498E6AE5-1271-4407-A6E3-BB865EF2CC92.1; 
 Mon, 15 Nov 2021 10:13:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9fb19854e47f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Nov 2021 10:13:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3271.eurprd08.prod.outlook.com (2603:10a6:209:47::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Mon, 15 Nov
 2021 10:13:03 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 10:13:03 +0000
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
X-Inumbo-ID: a553c971-45fc-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spZAT6W81ggCozky8fV7Gcx4QMlj1IcrJoENlS0LI0c=;
 b=3W8pserLABaaAQhoqgtH5Xb1XqZvmqF4Hdyn4+wM/WAi8WLolgCUysQEOi45c4lWmTCtN8JNyvVOx5JJnAf1iGd0T8cW8cWSXyOlPJ+0Hy+tKaQeMIHB2pXzw+CiZoGAPpYQdV+1coqHhTo49Ay8Zl54bIbBf26hVpGbSXTfkCQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 725e6220502bda9e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdVkENrjBPiuxAqactBv5ZDXZ3oxHisJkAHFOr4BNCohnS+P+gQcrK5rJlvVyaI63Rd1Q4QmaKBQCl7KQGly0/BEiOolSipSR+n/8ujNO5RWVhyDeq5RAuMVGq4MS7zj9qKiIKzuvGX0+c7BLjY3AGnOawF9eQMv8M0zYMPf5KQFKR6Pu2p+BCAYPMkDmHbbhchQEuP/CXAth49TpLA2Z0nTx3k/HgegpprZ3awPAWV05o+gIdsON7VP9LBRVOep0rjoUSxdQiejqbyhayqH8GAGfwqa96TOIzUvgNwLlYGZxNugwoqi+Shk3giODgwwc8xYywBtxMhhSj3QH9UdIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spZAT6W81ggCozky8fV7Gcx4QMlj1IcrJoENlS0LI0c=;
 b=dcEQ/AxTy4hFdodiysv+lhsadhHj/8rXqy2WwhUJ0a8z9r6Ma6twNLByAfoRTFm9/VcJIN0eN7hCScGupEG39eGUyd/f/Vd6oOOPpwJ8nZsG4t9nIFtDUsYugHM2y1OwRqPwLOrvWLKD6DW1kg5U6lVicjknkNidVMSPidkxLvfpuvVapFuew17sC158DYxCALcXTYgteDJZeBfK0CjCEw2N9Dkvin7x9R9/9NY2C4VFEVE0YFJfQeTqLu3f0QCClnsGRb7N9gECfvb9l+cOQs4QYVJ/f8p/FZ4SIop44nKlE7GTUn2lTe8hojljL4XwD8RdPoS6buu0UMqJeD5bBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spZAT6W81ggCozky8fV7Gcx4QMlj1IcrJoENlS0LI0c=;
 b=3W8pserLABaaAQhoqgtH5Xb1XqZvmqF4Hdyn4+wM/WAi8WLolgCUysQEOi45c4lWmTCtN8JNyvVOx5JJnAf1iGd0T8cW8cWSXyOlPJ+0Hy+tKaQeMIHB2pXzw+CiZoGAPpYQdV+1coqHhTo49Ay8Zl54bIbBf26hVpGbSXTfkCQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/5] xen/domain: Remove function pointers from domain
 pause helpers
Thread-Topic: [PATCH 1/5] xen/domain: Remove function pointers from domain
 pause helpers
Thread-Index: AQHX1yW51DCh4Kb6WkC+olJaqOqcEawEZHMA
Date: Mon, 15 Nov 2021 10:13:03 +0000
Message-ID: <D0965ED8-C1FE-473F-91C7-3EE18ABAB3C4@arm.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-2-andrew.cooper3@citrix.com>
In-Reply-To: <20211111175740.23480-2-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9e3ae1a8-5e72-4d14-4809-08d9a82088bf
x-ms-traffictypediagnostic: AM6PR08MB3271:|AM9PR08MB7291:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB729126E678157E18CB5CB4969D989@AM9PR08MB7291.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 luYqxnDanqLolx0RglfN1q2zV/yW4JbYpOrlZzBmf6Y6WZOWn6ZMZrvr8OmYp2MsACJvKRvuQUhnv4bhbBMxZu6TDKAr/YDWWW/aUp38ExC5OES0wqmfcXBP2BkAGavgLWP/xSqdvopSIo2nI8UBIJgE16tWllRsz3yNC4B5G6RJY7+XvCY9WxWTP/PIYh+QY2s+fvrxzJ+Tl+rFsTMmL13AqtEY4kdwFFJzI/+SuvcpPjbu+lky0VxC6FUU+GonjoXd41oX1w3U8dIkL09VVqqGL/Dy4n91LAkVEYMejurzPVdz+cTwv3SSkCux5qJlESRZQTJazWwPTNEYkLyN1Vu4l6huqESx9TFDd8IYMHK6CUitYybvMm7fp3bYOYw8mVF9kb3IcnWJIvjHLtRzgSctQ8KkROD5+q3a/patDarlaXaIPwb03FuJn36Yza0wMPErlHk8lb2TptO/WrGNoPG8vCDpsKX5f8VcJo6rQ8gFOheBS+56gqXTKK2VqXzpNjTjQ7+SVNl1eNyd8crrN8W1T7VwyIgfPejoaa6YU3XwcAecTrzjm/FYqteSoBaafwmbPt2P1QSIgHuTjQ/k7Vvzls6alX517DVcGSKI87k7FKVwkhVFc6ifmDzx/U1hoJBbV55GWrI+EsRGqq6NuAO8JooKGwbQW+WCQ8kfrm1Kf2Vfg67TgLHPi3Hbxy8lEayDbnM1TKC1N4V3YlCeoiN028KXldd3h36rzPfVL/DBTc6+9GfhG+1D6eFHyhRp
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(91956017)(71200400001)(66476007)(53546011)(6486002)(4326008)(33656002)(2906002)(76116006)(54906003)(186003)(66446008)(64756008)(26005)(66556008)(6512007)(508600001)(66946007)(38070700005)(8936002)(86362001)(5660300002)(36756003)(2616005)(83380400001)(38100700002)(122000001)(6506007)(6916009)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <83A2EC20EF4D31459DAFF025C5D24AB8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3271
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3e85cf94-a4cd-46ec-01b1-08d9a82082d3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R/xr9mUkhB9BFJsToWbN+XhzLIQhptlwvMElwyZIuASDBTbKzl6TcohSGd3lt6j+5gmwuz++pUOO2j/PG4jkX+Vs6BSs5Wfh03T4opkh3rYgbgJnWM17F6xlhPLj4Z4QsPnhgt9KOSPiRMUqsCQBbZA1F2aI17jUvzn/VahuC9bnLud1Zd0cWvIypLKG30JCUJR6CtKAJQzk4KrRfIVstXAnt/Ji8bMnG194gAI34DhD/IX8eRUM0zT2LPxMT/PX0wjxQm/5fOs6lH0+zAqW9SjWEh/BV2lza775VUexAf6p0uF3/gZybQJfA7t896jSHQ1ip2/d2hhZ3PbF5eiL6Hux06/0zHlN9V6J+wqMh1QaSQq1WTO/lXCaDdsqhmqIV5CzqX6ytkNkeOhKso4fZ19bUAtk5LcyamhECf7LEe8p3TT5K53lggsINtDI1ZaZ5YFMxQ2E+8n8Tb3w8k4pkdMjSqOqqO+2y/EqOv94V/0qGGkXtHKNn6bbsFUArcU5Jg6Px7s0sKKGSNPoVfFt8Kpkhs3nh+oRbb7b4R2tUy+1CPFwUy+QN++N6XTg+QCdr4hDfuljexL8FjVG6DCRDThu8ZFSqtRIzYYf/5AJQ36ATwqOdqT8I1BldazsVUXQCBADO6qa4UZu2IormfmnUp9zCrDYD02AlBxrJMRYMorBg62gX+6YO4AdXbq/B0OflwZqV7LfMtCSnAAuWfgKXw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(26005)(86362001)(82310400003)(4326008)(33656002)(53546011)(316002)(6506007)(54906003)(70206006)(5660300002)(8676002)(6486002)(70586007)(8936002)(508600001)(2906002)(186003)(6512007)(47076005)(2616005)(107886003)(81166007)(36860700001)(356005)(6862004)(36756003)(83380400001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 10:13:13.4823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3ae1a8-5e72-4d14-4809-08d9a82088bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7291

SGkgQW5kcmV3LA0KDQo+IE9uIDExIE5vdiAyMDIxLCBhdCAxNzo1NywgQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBSZXRwb2xpbmVzIGFyZSBl
eHBlbnNpdmUsIGFuZCBhbGwgdGhlc2UgZG8gYXJlIHNlbGVjdCBiZXR3ZWVuIHRoZSBzeW5jIGFu
ZA0KPiBub3N5bmMgaGVscGVycy4gIFBhc3MgYSBib29sZWFuIGluc3RlYWQsIGFuZCB1c2UgZGly
ZWN0IGNhbGxzIGV2ZXJ5d2hlcmUuDQo+IA0KPiBQYXVzZS91bnBhdXNlIG9wZXJhdGlvbnMgb24g
YmVoYWxmIG9mIGRvbTAgYXJlIG5vdCBmYXN0cGF0aHMsIHNvIGF2b2lkDQo+IGV4cG9zaW5nIHRo
ZSBfX2RvbWFpbl9wYXVzZV9ieV9zeXN0ZW1jb250cm9sbGVyKCkgaW50ZXJuYWwuDQo+IA0KPiBU
aGlzIGFjdHVhbGx5IGNvbXBpbGVzIHNtYWxsZXIgdGhhbiBiZWZvcmU6DQo+IA0KPiAgJCAuLi9z
Y3JpcHRzL2Jsb2F0LW8tbWV0ZXIgeGVuLXN5bXMtYmVmb3JlIHhlbi1zeW1zLWFmdGVyDQo+ICBh
ZGQvcmVtb3ZlOiAzLzEgZ3Jvdy9zaHJpbms6IDAvNSB1cC9kb3duOiAyNTAvLTI3MyAoLTIzKQ0K
PiAgRnVuY3Rpb24gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2xkICAgICBu
ZXcgICBkZWx0YQ0KPiAgX2RvbWFpbl9wYXVzZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtICAgICAxMTUgICAgKzExNQ0KPiAgZG9tYWluX3BhdXNlX2J5X3N5c3RlbWNvbnRyb2xs
ZXIgICAgICAgICAgICAgICAtICAgICAgNjkgICAgICs2OQ0KPiAgZG9tYWluX3BhdXNlX2J5X3N5
c3RlbWNvbnRyb2xsZXJfbm9zeW5jICAgICAgICAtICAgICAgNjYgICAgICs2Ng0KPiAgZG9tYWlu
X2tpbGwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNDI2ICAgICAzOTggICAgIC0y
OA0KPiAgZG9tYWluX3Jlc3VtZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMjQ2ICAg
ICAyMTQgICAgIC0zMg0KPiAgZG9tYWluX3BhdXNlX2V4Y2VwdF9zZWxmICAgICAgICAgICAgICAg
ICAgICAgMTg5ICAgICAxNDEgICAgIC00OA0KPiAgZG9tYWluX3BhdXNlICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDU5ICAgICAgMTAgICAgIC00OQ0KPiAgZG9tYWluX3BhdXNlX25v
c3luYyAgICAgICAgICAgICAgICAgICAgICAgICAgIDU5ICAgICAgIDcgICAgIC01Mg0KPiAgX19k
b21haW5fcGF1c2VfYnlfc3lzdGVtY29udHJvbGxlciAgICAgICAgICAgIDY0ICAgICAgIC0gICAg
IC02NA0KPiANCj4gZGVzcGl0ZSBHQ0MncyBiZXN0IGVmZm9ydHMuICBUaGUgbmV3IF9kb21haW5f
cGF1c2VfYnlfc3lzdGVtY29udHJvbGxlcigpDQo+IHJlYWxseSBzaG91bGQgbm90IGJlIGlubGlu
ZWQsIGNvbnNpZGVyaW5nIHRoYXQgdGhlIGRpZmZlcmVuY2UgaXMgb25seSB0aGUNCj4gc2V0dXAg
b2YgdGhlIHN5bmMgYm9vbGVhbiB0byBwYXNzIHRvIF9kb21haW5fcGF1c2UoKSwgYW5kIHRoZXJl
IGFyZSBwbGVudHkgb2YNCj4gcmVnaXN0ZXJzIHRvIHNwYXJlLg0KDQpUbyBhZGQgYW4gYXJndW1l
bnQgdG8gdGhlIGRpc2N1c3Npb24gSSB3b3VsZCBzYXkgdGhhdCBwcmV2ZW50aW5nIHRvIHVzZSBm
dW5jdGlvbg0KcG9pbnRlcnMgaXMgc29tZXRoaW5nIHRoYXQgaXMgZ29vZCBmb3IgRnVTYSBzbyBJ
IGFtIGluIGZhdm91ciBoZXJlLg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiAtLS0NCj4gQ0M6IEphbiBCZXVsaWNoIDxK
QmV1bGljaEBzdXNlLmNvbT4NCj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPg0KPiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gQ0M6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+DQo+IENDOiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBh
bS5jb20+DQo+IENDOiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+
DQo+IC0tLQ0KPiB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICB8IDMxICsrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0NCj4geGVuL2luY2x1ZGUveGVuL3NjaGVkLmggfCAxNSArKysrKy0tLS0t
LS0tLS0NCj4gMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWFpbi5jIGIveGVuL2NvbW1vbi9k
b21haW4uYw0KPiBpbmRleCA1NmQ0N2RkNjY0NzguLjU2Mjg3MmNkZjg3YSAxMDA2NDQNCj4gLS0t
IGEveGVuL2NvbW1vbi9kb21haW4uYw0KPiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jDQo+IEBA
IC0xMjM0LDE1ICsxMjM0LDE4IEBAIGludCB2Y3B1X3VucGF1c2VfYnlfc3lzdGVtY29udHJvbGxl
cihzdHJ1Y3QgdmNwdSAqdikNCj4gICAgIHJldHVybiAwOw0KPiB9DQo+IA0KPiAtc3RhdGljIHZv
aWQgZG9fZG9tYWluX3BhdXNlKHN0cnVjdCBkb21haW4gKmQsDQo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdm9pZCAoKnNsZWVwX2ZuKShzdHJ1Y3QgdmNwdSAqdikpDQo+ICtzdGF0aWMg
dm9pZCBfZG9tYWluX3BhdXNlKHN0cnVjdCBkb21haW4gKmQsIGJvb2wgc3luYyAvKiBvciBub3N5
bmMgKi8pDQoNCkhlcmUgeW91IHVzZSBjb21tZW50cyBpbnNpZGUgdGhlIGZ1bmN0aW9uIGRlZmlu
aXRpb24uDQpJIHRoaW5rIHRoaXMgaXMgc29tZXRoaW5nIHRoYXQgc2hvdWxkIGJlIGF2b2lkZWQg
YW5kIGluIHRoaXMgc3BlY2lmaWMgY2FzZSBhDQpib29sZWFuIHN5bmMgaXMgY2xlYXIgZW5vdWdo
IG5vdCB0byBuZWVkIHRvIGV4cGxhaW4gdGhhdCBmYWxzZSBpcyBub3NpbmcuDQoNCj4gew0KPiAg
ICAgc3RydWN0IHZjcHUgKnY7DQo+IA0KPiAgICAgYXRvbWljX2luYygmZC0+cGF1c2VfY291bnQp
Ow0KPiANCj4gLSAgICBmb3JfZWFjaF92Y3B1KCBkLCB2ICkNCj4gLSAgICAgICAgc2xlZXBfZm4o
dik7DQo+ICsgICAgaWYgKCBzeW5jICkNCj4gKyAgICAgICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYg
KQ0KPiArICAgICAgICAgICAgdmNwdV9zbGVlcF9zeW5jKHYpOw0KPiArICAgIGVsc2UNCj4gKyAg
ICAgICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQ0KPiArICAgICAgICAgICAgdmNwdV9zbGVlcF9u
b3N5bmModik7DQo+IA0KPiAgICAgYXJjaF9kb21haW5fcGF1c2UoZCk7DQo+IH0NCj4gQEAgLTEy
NTAsMTIgKzEyNTMsMTIgQEAgc3RhdGljIHZvaWQgZG9fZG9tYWluX3BhdXNlKHN0cnVjdCBkb21h
aW4gKmQsDQo+IHZvaWQgZG9tYWluX3BhdXNlKHN0cnVjdCBkb21haW4gKmQpDQo+IHsNCj4gICAg
IEFTU0VSVChkICE9IGN1cnJlbnQtPmRvbWFpbik7DQo+IC0gICAgZG9fZG9tYWluX3BhdXNlKGQs
IHZjcHVfc2xlZXBfc3luYyk7DQo+ICsgICAgX2RvbWFpbl9wYXVzZShkLCB0cnVlIC8qIHN5bmMg
Ki8pOw0KU2FtZSBoZXJlLg0KDQo+IH0NCj4gDQo+IHZvaWQgZG9tYWluX3BhdXNlX25vc3luYyhz
dHJ1Y3QgZG9tYWluICpkKQ0KPiB7DQo+IC0gICAgZG9fZG9tYWluX3BhdXNlKGQsIHZjcHVfc2xl
ZXBfbm9zeW5jKTsNCj4gKyAgICBfZG9tYWluX3BhdXNlKGQsIGZhbHNlIC8qIG5vc3luYyAqLyk7
DQpTYW1lIGhlcmUuDQoNCj4gfQ0KPiANCj4gdm9pZCBkb21haW5fdW5wYXVzZShzdHJ1Y3QgZG9t
YWluICpkKQ0KPiBAQCAtMTI2OSw4ICsxMjcyLDggQEAgdm9pZCBkb21haW5fdW5wYXVzZShzdHJ1
Y3QgZG9tYWluICpkKQ0KPiAgICAgICAgICAgICB2Y3B1X3dha2Uodik7DQo+IH0NCj4gDQo+IC1p
bnQgX19kb21haW5fcGF1c2VfYnlfc3lzdGVtY29udHJvbGxlcihzdHJ1Y3QgZG9tYWluICpkLA0K
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAoKnBhdXNlX2Zu
KShzdHJ1Y3QgZG9tYWluICpkKSkNCj4gK3N0YXRpYyBpbnQgX2RvbWFpbl9wYXVzZV9ieV9zeXN0
ZW1jb250cm9sbGVyKA0KPiArICAgIHN0cnVjdCBkb21haW4gKmQsIGJvb2wgc3luYyAvKiBvciBu
b3N5bmMgKi8pDQpTYW1lIGhlcmUuDQoNCj4gew0KPiAgICAgaW50IG9sZCwgbmV3LCBwcmV2ID0g
ZC0+Y29udHJvbGxlcl9wYXVzZV9jb3VudDsNCj4gDQo+IEBAIC0xMjg5LDExICsxMjkyLDIxIEBA
IGludCBfX2RvbWFpbl9wYXVzZV9ieV9zeXN0ZW1jb250cm9sbGVyKHN0cnVjdCBkb21haW4gKmQs
DQo+ICAgICAgICAgcHJldiA9IGNtcHhjaGcoJmQtPmNvbnRyb2xsZXJfcGF1c2VfY291bnQsIG9s
ZCwgbmV3KTsNCj4gICAgIH0gd2hpbGUgKCBwcmV2ICE9IG9sZCApOw0KPiANCj4gLSAgICBwYXVz
ZV9mbihkKTsNCj4gKyAgICBfZG9tYWluX3BhdXNlKGQsIHN5bmMpOw0KPiANCj4gICAgIHJldHVy
biAwOw0KPiB9DQo+IA0KPiAraW50IGRvbWFpbl9wYXVzZV9ieV9zeXN0ZW1jb250cm9sbGVyKHN0
cnVjdCBkb21haW4gKmQpDQo+ICt7DQo+ICsgICAgcmV0dXJuIF9kb21haW5fcGF1c2VfYnlfc3lz
dGVtY29udHJvbGxlcihkLCB0cnVlIC8qIHN5bmMgKi8pOw0KU2FtZSBoZXJlLg0KDQo+ICt9DQo+
ICsNCj4gK2ludCBkb21haW5fcGF1c2VfYnlfc3lzdGVtY29udHJvbGxlcl9ub3N5bmMoc3RydWN0
IGRvbWFpbiAqZCkNCj4gK3sNCj4gKyAgICByZXR1cm4gX2RvbWFpbl9wYXVzZV9ieV9zeXN0ZW1j
b250cm9sbGVyKGQsIGZhbHNlIC8qIG5vc3luYyAqLyk7DQpTYW1lIGhlcmUuDQoNCkNoZWVycw0K
QmVydHJhbmQNCg0KPiArfQ0KPiArDQo+IGludCBkb21haW5fdW5wYXVzZV9ieV9zeXN0ZW1jb250
cm9sbGVyKHN0cnVjdCBkb21haW4gKmQpDQo+IHsNCj4gICAgIGludCBvbGQsIG5ldywgcHJldiA9
IGQtPmNvbnRyb2xsZXJfcGF1c2VfY291bnQ7DQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94
ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+IGluZGV4IDI4MTQ2ZWU0MDRl
Ni4uMzdmNzhjYzRjNGM5IDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0K
PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPiBAQCAtOTIwLDI2ICs5MjAsMjEgQEAg
c3RhdGljIGlubGluZSBib29sIHZjcHVfY3B1X2RpcnR5KGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQ0K
PiANCj4gdm9pZCB2Y3B1X2Jsb2NrKHZvaWQpOw0KPiB2b2lkIHZjcHVfdW5ibG9jayhzdHJ1Y3Qg
dmNwdSAqdik7DQo+ICsNCj4gdm9pZCB2Y3B1X3BhdXNlKHN0cnVjdCB2Y3B1ICp2KTsNCj4gdm9p
ZCB2Y3B1X3BhdXNlX25vc3luYyhzdHJ1Y3QgdmNwdSAqdik7DQo+IHZvaWQgdmNwdV91bnBhdXNl
KHN0cnVjdCB2Y3B1ICp2KTsNCj4gKw0KPiBpbnQgdmNwdV9wYXVzZV9ieV9zeXN0ZW1jb250cm9s
bGVyKHN0cnVjdCB2Y3B1ICp2KTsNCj4gaW50IHZjcHVfdW5wYXVzZV9ieV9zeXN0ZW1jb250cm9s
bGVyKHN0cnVjdCB2Y3B1ICp2KTsNCj4gDQo+IHZvaWQgZG9tYWluX3BhdXNlKHN0cnVjdCBkb21h
aW4gKmQpOw0KPiB2b2lkIGRvbWFpbl9wYXVzZV9ub3N5bmMoc3RydWN0IGRvbWFpbiAqZCk7DQo+
IHZvaWQgZG9tYWluX3VucGF1c2Uoc3RydWN0IGRvbWFpbiAqZCk7DQo+ICsNCj4gK2ludCBkb21h
aW5fcGF1c2VfYnlfc3lzdGVtY29udHJvbGxlcihzdHJ1Y3QgZG9tYWluICpkKTsNCj4gK2ludCBk
b21haW5fcGF1c2VfYnlfc3lzdGVtY29udHJvbGxlcl9ub3N5bmMoc3RydWN0IGRvbWFpbiAqZCk7
DQo+IGludCBkb21haW5fdW5wYXVzZV9ieV9zeXN0ZW1jb250cm9sbGVyKHN0cnVjdCBkb21haW4g
KmQpOw0KPiAtaW50IF9fZG9tYWluX3BhdXNlX2J5X3N5c3RlbWNvbnRyb2xsZXIoc3RydWN0IGRv
bWFpbiAqZCwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQg
KCpwYXVzZV9mbikoc3RydWN0IGRvbWFpbiAqZCkpOw0KPiAtc3RhdGljIGlubGluZSBpbnQgZG9t
YWluX3BhdXNlX2J5X3N5c3RlbWNvbnRyb2xsZXIoc3RydWN0IGRvbWFpbiAqZCkNCj4gLXsNCj4g
LSAgICByZXR1cm4gX19kb21haW5fcGF1c2VfYnlfc3lzdGVtY29udHJvbGxlcihkLCBkb21haW5f
cGF1c2UpOw0KPiAtfQ0KPiAtc3RhdGljIGlubGluZSBpbnQgZG9tYWluX3BhdXNlX2J5X3N5c3Rl
bWNvbnRyb2xsZXJfbm9zeW5jKHN0cnVjdCBkb21haW4gKmQpDQo+IC17DQo+IC0gICAgcmV0dXJu
IF9fZG9tYWluX3BhdXNlX2J5X3N5c3RlbWNvbnRyb2xsZXIoZCwgZG9tYWluX3BhdXNlX25vc3lu
Yyk7DQo+IC19DQo+IA0KPiAvKiBkb21haW5fcGF1c2UoKSBidXQgc2FmZSBhZ2FpbnN0IHRyeWlu
ZyB0byBwYXVzZSBjdXJyZW50LiAqLw0KPiBpbnQgX19tdXN0X2NoZWNrIGRvbWFpbl9wYXVzZV9l
eGNlcHRfc2VsZihzdHJ1Y3QgZG9tYWluICpkKTsNCj4gLS0gDQo+IDIuMTEuMA0KPiANCg0K

