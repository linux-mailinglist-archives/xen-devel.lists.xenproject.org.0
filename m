Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9F73BDA37
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 17:31:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151499.279989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0n2M-00021W-0y; Tue, 06 Jul 2021 15:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151499.279989; Tue, 06 Jul 2021 15:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0n2L-0001zh-U2; Tue, 06 Jul 2021 15:31:01 +0000
Received: by outflank-mailman (input) for mailman id 151499;
 Tue, 06 Jul 2021 15:31:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cLt=L6=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1m0n2K-0001zb-47
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 15:31:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.74]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c75be681-6dc3-4c92-8b74-8e9bddf01f12;
 Tue, 06 Jul 2021 15:30:58 +0000 (UTC)
Received: from AM6P193CA0071.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::48)
 by AM9PR08MB6242.eurprd08.prod.outlook.com (2603:10a6:20b:283::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Tue, 6 Jul
 2021 15:30:56 +0000
Received: from VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::86) by AM6P193CA0071.outlook.office365.com
 (2603:10a6:209:8e::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend
 Transport; Tue, 6 Jul 2021 15:30:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT060.mail.protection.outlook.com (10.152.19.187) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 15:30:55 +0000
Received: ("Tessian outbound 1763b1d84bc3:v97");
 Tue, 06 Jul 2021 15:30:55 +0000
Received: from ce6ba17a229b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 435C160F-3D3B-4CDA-A4C1-DB7B90461077.1; 
 Tue, 06 Jul 2021 15:30:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ce6ba17a229b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Jul 2021 15:30:29 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6703.eurprd08.prod.outlook.com (2603:10a6:102:138::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Tue, 6 Jul
 2021 15:30:27 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%9]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 15:30:27 +0000
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
X-Inumbo-ID: c75be681-6dc3-4c92-8b74-8e9bddf01f12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxALtI/CSDAvLxAy9fB4gi3w/R6VJ/8FTUddzojXXE0=;
 b=It/z1I/cv1y92jKYUd1eTzO3Moc0eMrJz3gscZHZ6c0jzkB8fM134Fwy4B9YtVX8pNCItmqykXWU0NUT5sPsxZEwapYIjqSoLOnqEkuf3MYfsZLCMzcAc6arA/413kcw1/IdJ1xQo74+SPhaQEKxDbRmzSC9eRuhTT90Ex8foMs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 37d9a2da49d00164
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jeho25QUng4YzcFXFrMu1wJSxyBlHEfWKlMiV70H4BDrfDxvqlZIRyHEXYtOV3CuC+paLhv4vcx5ssH59/QNaPYD2tIppSDURQfDmpxxxFTng+SxbVU39BGhzpo4osj4F6NJqKPxYLcfnlYW7ykXWafNCvt0HEiCPTVRgFqbsgij4qaRsPP2hrJv2s/7x0E6XCv3OJcySDf6hcZGLEgUNjLCBkdm6UXgnoDP2RV/7gmk9SsStYv1LSt8HZ3gGVRHMc0JtDBR3jGFBkF48xes2HgevCmgvW0LT+3/sqsHzraSeeapujHR1XGRCegN3QwuATLwF7csNXoabyfWm6uG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxALtI/CSDAvLxAy9fB4gi3w/R6VJ/8FTUddzojXXE0=;
 b=KXQCVfpsS3BnNEu+tQoVhHXx5S0DGTCK2/FBtNoFGYlqCOZJsT0eqT/OByQ5Z3Jgb7BJ29y7IK9FVtbeI4xLmutlVF12vDRaouHPmYGRser4Is1oTjda4wqLQMerI/VbMsh41WBuSe0/60vyS1wux6kqHR12enBgmNQk1MDUfia2Nr3zc2UoM+lnrX/5hq20DtbJGh9qpYadl5SY0xGHuKySLjs2DJxjmpJHabv98AU6m20hs9jAY/Q2I/b72EkuKu3aeeSJ4vR5RDe6v1BK5jZwj64Jqk2U12pktjnV0PMnRnjygglg5UdXGgc5c75mFKORJnWaitMO0CNaxQT9mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxALtI/CSDAvLxAy9fB4gi3w/R6VJ/8FTUddzojXXE0=;
 b=It/z1I/cv1y92jKYUd1eTzO3Moc0eMrJz3gscZHZ6c0jzkB8fM134Fwy4B9YtVX8pNCItmqykXWU0NUT5sPsxZEwapYIjqSoLOnqEkuf3MYfsZLCMzcAc6arA/413kcw1/IdJ1xQo74+SPhaQEKxDbRmzSC9eRuhTT90Ex8foMs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "jgrall@amazon.com"
	<jgrall@amazon.com>, Michal Orzel <Michal.Orzel@arm.com>, "olaf@aepfle.de"
	<olaf@aepfle.de>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] tools: Fix CPSR/SPSR print size
Thread-Topic: [PATCH] tools: Fix CPSR/SPSR print size
Thread-Index: AQHXcnkI0yrA0BW0E067MCMRzZDicKs2DqIAgAACDoCAAADKgIAAAUEA
Date: Tue, 6 Jul 2021 15:30:27 +0000
Message-ID: <44C5D4C6-80B0-4CDE-92CD-E6A5B299A40B@arm.com>
References:
 <f28690afd8c4f36351fcdb1e95704cc5240b193a.1625583993.git.bertrand.marquis@arm.com>
 <d79b4ff3-cc61-a1a7-ed5d-e0ea627bbab8@xen.org>
 <E8C7437D-575A-493F-B45E-570F2F23997A@arm.com>
 <bde10100-e5a8-99ed-6766-9521d026abd9@xen.org>
In-Reply-To: <bde10100-e5a8-99ed-6766-9521d026abd9@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.100.0.2.22)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 81cfee96-1edf-419c-0870-08d940930c38
x-ms-traffictypediagnostic: PAXPR08MB6703:|AM9PR08MB6242:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB624210C5C366098A7DD25D249D1B9@AM9PR08MB6242.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RIoAqL/RfpegcWB+nxSgqpHIo5XQVu0UkYWqbmM1CMHHYQIwUDAX41kWK9NHX9fd7MXIpgPRHVD89Q9C8W52y+J8RASencH8mwCTES3Z8gqmgxkfxf9P3xWP8kGGd6n5+dTs8kqBdDFOLbW8+Q9hxy7mKUm35VYkKqj3FyanNlZHqWWFYpkhfsCJIb+ZRyBrhTAFsWU5fR/NOCBnAfls/EZW4eP+0gY3UnWLXhqpx9DOqOxQe3PIdZVK01rRujqWTvCF9jwdv0JDFsW6SKVGLmp2Cg+TFQ2Y7za/8KuHt1T6YaiUtoB8P/q/mi9CG4TJpymhap7KIGiBusuiTBNrrl43rn0/5TcsOEOkYu25AOg72Nm84kRUhzyr3sVAjlQaVEC2bSe/g2R+CleVeEmmtKv2veN6VaKjwQer8ruJlqfo7NKL8QHoXycjlo8KDk5zjL0HCbH2WRdchzbQQCQzrNWXfQoswVZQPB+KnYcgzGs6HafGBy9qlzs5WHlvSivJ7AZZsBxdgxrDS/4QtLXWF/FgdXfhCakcuhWfpmq8HXyBRBKCDlEvd2kAq20dbvVTZ2I1xSUx84aab0hsUmVAuItmTUPzC+j/cLIHot3XtDnhxNPjXDCSR+HOOK2VIfxup5j4w6OgF6wFt2Z0lqZtWRuMvHArfz+D+UN53pmyQghcWVh9RNnFRqcDIo0URj2zGJZmqYXH/+EPOEMG2J0ujQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(346002)(39850400004)(136003)(66446008)(6486002)(64756008)(478600001)(2616005)(6506007)(4326008)(5660300002)(186003)(316002)(6916009)(2906002)(71200400001)(6512007)(8676002)(86362001)(83380400001)(66556008)(53546011)(76116006)(8936002)(91956017)(33656002)(36756003)(38100700002)(26005)(54906003)(66476007)(122000001)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VTiD90FpZmDQpuVygSsHo65qzqGlovUdQ7YdkOE0Ub1KUYKMjR+ucIGHDYiR?=
 =?us-ascii?Q?EYw56UlsnUCV0PTbgSY0+bFEKg0eWnOBtqy2FagDX7frvLXfOU7azyVxNbKY?=
 =?us-ascii?Q?ZKL0Be+lj3Y/QbTtT/BxBNXJyjQf43EvgSFQPfgSWbDibD3iw7Lyc2C+WtEX?=
 =?us-ascii?Q?2R2Hpu+MDtCt6aaMSy8X29L2VgbLT/tk64SGqnnam4qLPglHJpXkMmok4jNd?=
 =?us-ascii?Q?6+bUfH04Y4VK2s6SUpHGbp0VU50voHF35q5jHXHAkXcMQl8NlW5uWQElXxkM?=
 =?us-ascii?Q?vWo0JJTXYL4A/fmo/0QDDr5PaqJjzVjxuHfkz9P4ooZQrWpFfFp3mVqs3l1s?=
 =?us-ascii?Q?Dko6LSxGAO9tqIZYKFfIJwgBIRwYvtBlUnmdwDMytvgX58tOzkzXh7kjEby3?=
 =?us-ascii?Q?WgjmJMu+ExlIvFjsk6sMQtZmKUTSGt/8BF/iNFc1EImb0lVseZ0vvHet7WZ2?=
 =?us-ascii?Q?inebCdXQ6kwYhjjX3ohzKrif+G60/IslEnOMPt4ttuMwJJo4KkFuWcUAiJTm?=
 =?us-ascii?Q?w6CtUsXDb9Ri8zaVWmeGoIniGO2YIaNZQSKoDPr5+9PgP7ql3P3FtOJ0IXKv?=
 =?us-ascii?Q?pT5X8Qck1RYmC7izfvBq0VbtnQMtBWT5Ck03vCNXuIzpGL+xvAB0aETzmSYM?=
 =?us-ascii?Q?q8u/nURvT7ZNBMdcx/2tCc0ZBOFcxUu7ZFcYvYOSN+OZlhG2rwGKHYsAYELo?=
 =?us-ascii?Q?fOL7HuITlXVrTo95EYndS+pa1gAiuNMu6hjFZKurm97Z57I4Tl9hiCK4djfF?=
 =?us-ascii?Q?kvRx2eie74wNFOD/Wl7dIdWJg2JCGmq9jsZ+KzCABzIKOsfkgKGm/WffNZCJ?=
 =?us-ascii?Q?b15I71gPC8u1z/RoYSTPmESYvGXaJJcSAQKKcNNGtewmKHUf7+j4+sKGHDiM?=
 =?us-ascii?Q?2kuq1zOIgiP9wZKfTfddPBbzGsQqRrV21HEq/z5YgPdz9ywcXhtuZUTaUrAK?=
 =?us-ascii?Q?2HfyPNNgGxygJMnZF2vV9bptsCxi6ZFj4tb6GsgmS1bLof+nt5RmGzuzWGpP?=
 =?us-ascii?Q?ooPHF5p7MMT9oZkRurpxOzMOgUiE0kjpGpdy7yWzWwluOcGAiSvi+0Edypt0?=
 =?us-ascii?Q?Z8EoMAb87+0mnfwJ9KQ4VkRmS+Ksk5k+w+EML+9MTz4KDNNG8Qtre1b5y3PV?=
 =?us-ascii?Q?9OzbshKm0C7MsJyuO/RaRn80hfSpaqpBC31xDoqMcpKt3FCVMx+Bu/qMyF22?=
 =?us-ascii?Q?uzAqpknFFEEj4kHI3TNSq/rqXbaPbmbJNfU8GE7FQDCCo7xHiLNjjZCzK6Fy?=
 =?us-ascii?Q?JlSd8TtbeRrIdWe2ehoL3IYMSNUXw76HuFsyiAPUPbfLT2uKxiopKKRwkJgK?=
 =?us-ascii?Q?oswOcozyH0CWiqCk+GyjKGf7?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E504064A20D70748A0E3012916B2C217@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6703
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c001f596-c62b-40da-eb4c-08d94092fb48
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w6cC3U2miQRc/J5vJzBHFiNtFFPFt7tCvn7tSXGeGFMqaFabEMpZYmdrsiF3n0asmg/486DfOua2+UZjWcgna91NqJGn+XuKzv7/ICTr6KbV92Va1CEz19Ee9E9BT3HV57XH6LocxEHWcBf8dRTVt27flUkj/6xxGT+kNRYvLZ/UoxRbhNd4ZVo6fD2S2UAHuYFRWFpf4LVY2eRNwCLViD+aNBAZx7Yub7P/ljxa8uop8w10TAqJgSgGc9tShxNAEW/BrIGTyr8KNELFRep5F7l6hj3BQq1wyzABUThMRst7l6i98AKwTuldp1NJ3fJiK71+LhSpkcgvxqo5PaoxgoZvU6Y6/UmwxdA9T/MienD771lp2g2eUe9EcluENV8pfhkGVki7v2Y9EOT6DFVvMq57vMdVJdmlHj1qlwryBblEG45QXmjbQQqqi4+n0zlIvtEVGOmiRbKRRglz+w2yOtdCY/gkcFGgT333nrNkuaVJNffVSDqPIpqGHwH0VhY7C59P39+un14RkQGDBwah5+XNCUnLTN+MWZYwP5DsTNZLeCGKidUjpL53IPcsOpd/NcET2DyfQah28+wv0XPb4PY+/6cQGEG4Tp0FQ47YTtde1Z8MBCkvUzVrwTPHphjprfasomuPj7MxSPj9uc/nbMlmORIWeNMYiUYISPKzsVmfGYLutVLJJjZe//3pn14NrQpjM4T6b5PeNSPasG6LMg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(376002)(136003)(36840700001)(46966006)(86362001)(6486002)(4326008)(107886003)(316002)(8936002)(26005)(186003)(8676002)(36860700001)(478600001)(53546011)(47076005)(82740400003)(6862004)(6506007)(336012)(81166007)(5660300002)(6512007)(83380400001)(70206006)(33656002)(70586007)(356005)(54906003)(36756003)(2906002)(82310400003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 15:30:55.7825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81cfee96-1edf-419c-0870-08d940930c38
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6242



> On 6 Jul 2021, at 16:25, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 06/07/2021 16:23, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>>> On 6 Jul 2021, at 16:15, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> Thanks for the fix. I forgot to check the full tools build when sending=
 the first fix :(.
>>>=20
>>> On 06/07/2021 16:09, Bertrand Marquis wrote:
>>>> With the changes of register size introduced in
>>>> 918b8842a852e0e7446286f546724b1c63c56c66, CPSR and SPSR are now stored
>>>> as 64bit values.
>>>> Fix the print size to use 64bit type.
>>>=20
>>> Can you add a fixes tag? This makes easier to find bug fix in the tree.
>>>=20
>>> For this patch it would be:
>>>=20
>>> Fixes: 918b8842a852 ("arm64: Change type of hsr, cpsr, spsr_el1 to uint=
64_t")
>> Sure. Patch incoming in the next minutes.
>=20
> I can fix it on commit.

Up to you, I also just sent a v2 if it is easier :-)

Cheers
Bertrand

>=20
>>>=20
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>=20
>>> Just to confirm, with this patch and mine the tools build successfully =
on 32-bit and 64-bit?
>> Yes I have a full build running with both patches added for arm32, arm64=
 and x86_64.
>=20
> Perfect!
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
>=20
> Cheers,
>=20
> --=20
> Julien Grall


