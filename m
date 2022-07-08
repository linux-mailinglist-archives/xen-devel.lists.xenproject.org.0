Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF7A56B914
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 14:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363371.593857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9mgG-0007bz-66; Fri, 08 Jul 2022 12:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363371.593857; Fri, 08 Jul 2022 12:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9mgG-0007ZA-29; Fri, 08 Jul 2022 12:01:56 +0000
Received: by outflank-mailman (input) for mailman id 363371;
 Fri, 08 Jul 2022 12:01:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LzHR=XN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1o9mgE-0007Z1-Ao
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 12:01:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2074.outbound.protection.outlook.com [40.107.22.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0d87c9f-feb5-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 14:01:52 +0200 (CEST)
Received: from AM6P194CA0070.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::47)
 by AM9PR08MB7053.eurprd08.prod.outlook.com (2603:10a6:20b:410::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Fri, 8 Jul
 2022 12:01:50 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::1b) by AM6P194CA0070.outlook.office365.com
 (2603:10a6:209:84::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Fri, 8 Jul 2022 12:01:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 12:01:49 +0000
Received: ("Tessian outbound 8e3d5168572a:v122");
 Fri, 08 Jul 2022 12:01:48 +0000
Received: from 7c40c9839e34.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7AB4A79F-1E43-452A-A5F8-F33FF1E42DA5.1; 
 Fri, 08 Jul 2022 12:01:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7c40c9839e34.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jul 2022 12:01:37 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM6PR08MB4149.eurprd08.prod.outlook.com (2603:10a6:20b:b0::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Fri, 8 Jul
 2022 12:01:35 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5417.018; Fri, 8 Jul 2022
 12:01:34 +0000
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
X-Inumbo-ID: c0d87c9f-feb5-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ndo2QfRnjdB/iZ8XhzfqDppdClJRXADr7pZcvHoBLcp0bKwtGs0CaR09iql2FUU87NT9/+uhV5KDlAK70TxAi925WaAnm/ymR9udHl4ANNznyRMqtSuDNGVI0nn5DDEYMPRHd5l97JRzRr8AjUKPzQ+Bh2+kpFTwWAzhrXUVbod1bIkXK/KFAhFWe1WUKWZdz/fmr9dICLoYAeovQMDApBM/z4Ym3saxJ3ErDxsduKOJeivoQa7V9AMmdz3oUYGj+0xb0yqcZjm9bftZk6wlnPQOw4pBs9ctyQwfB3sgqwxjTf+CWyZHz6ERRxYVHbNpr4oxi5pR/spJnoXXkaBm/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fn1NLoRlIR8hwkspj78Ki0E2vJo8CIe6tZj3P9lPuWM=;
 b=Uq6vGfvihvCjn4pkSxRAlFlJTuYsL2PLqnaww+iYQUQe1eZ9/U63lytfxGmrKYKBHXhu/zSLQBXcOs3AlbMXzQo2asBVEYjgMOWz5JxzxzA2gFk2o5YDwTx2fnRB/MTfxfcbNtIUk8lqNY3pEg9pKlGzNU8UQXuRkDnAAdgg2Uiq8zBHlaeE/OiP2AcltpdJb8YPT2VCTlAqkglDPgsIGCL2rQTroM4etRlpFtSkA0PRx+VfJdDhjLkMz7+O0B0e0qNKHKZ8ceStN525fa8wqyRy05jJZ0zVixbWSRoO+DlUpQxt7RzJQkwJrBmCsilFNs3WzxP/C5lGGmb9a5yx4Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fn1NLoRlIR8hwkspj78Ki0E2vJo8CIe6tZj3P9lPuWM=;
 b=0HmLYZiEvJdQJO/BboFp7Gk3KSlpgcIMrKHEAEWFl9XxQu73fNgH73G7quINvEfSBIvqae9YG+/EbHm035nxtNSdUlfYPeXT0h40jB8mNjW+wkfG5nW4haRLpMlsbkri/nFivEXYNvSkQdoA7sGVErSshpDIrTstbPVa6RK2D6w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bc0093dee5883305
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hP+m38EMyapIKpOhCnYJzTkmwHQapKvevJHlAUTsZh7JGDHIrFjTYgmzqTR05gBIhvq7WJPoo9hbwM5q7btooOA9ZicnAvRADlFkGnZ60rCwsNUX7irDOc3XXKysxa4sZrywb0paIDQedPgwOZBIlGNeowd5Op8e1MFgGvhRxxu9vkN3ppYO9Q7Ctrg+m3Ra1Rh2ycpj7IKLcUrcUUPXC4HxvzGa4WAbrXT5C8U5B1H6/rx9yeqxAFjDzA1eugEF48FlsSFqTAvDdZrE4GC7unvePy+VDtZ+YQa0rNjKO3d2QJejUoOHtUwmLAg57hSSQLpt6tD1OtnGsvf52Z2OrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fn1NLoRlIR8hwkspj78Ki0E2vJo8CIe6tZj3P9lPuWM=;
 b=mLZHlkb8SpiC1aUDhvNC7hX5qtHNpMWVjcNa0E77Xc1fIsQOtlEl0Ht0/SdJyJXFTxrdTjBqdPFHJYy1Nz+koSVjIP5p/al9qhXygCOTVqLqm4Vw+Sh7btQ0Ezdxe+3ZCjg1xTaU1BhePGOzoUb2dE+HxIL/2TextNEBugze5Qc5GT3bNMhbXh6aa/lCvanOP26vdS+pTGkmuFXPQ6tTlVd7dzsfYkn4trC++/BmPbj/uNkBLHK+vyAdkVzbkT0rPxulOaNxB9nDOhW1fbRqm9Np6qWG6YtG/9rR2Jqgb6aPr+GzMWLBj1wr4zwprHApWLHHexNu9NU0+vY3z3nIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fn1NLoRlIR8hwkspj78Ki0E2vJo8CIe6tZj3P9lPuWM=;
 b=0HmLYZiEvJdQJO/BboFp7Gk3KSlpgcIMrKHEAEWFl9XxQu73fNgH73G7quINvEfSBIvqae9YG+/EbHm035nxtNSdUlfYPeXT0h40jB8mNjW+wkfG5nW4haRLpMlsbkri/nFivEXYNvSkQdoA7sGVErSshpDIrTstbPVa6RK2D6w=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v4 1/2] xen/arm: smccc: add support for SMCCCv1.2 extended
 input/output registers
Thread-Topic: [PATCH v4 1/2] xen/arm: smccc: add support for SMCCCv1.2
 extended input/output registers
Thread-Index: AQHYkrtluLmsjith/0ae41gwW1Q+gq10X3eA
Date: Fri, 8 Jul 2022 12:01:34 +0000
Message-ID: <C8575668-5771-4E77-B77C-15E6E740E540@arm.com>
References: <20220622134219.1596613-1-jens.wiklander@linaro.org>
 <20220622134219.1596613-2-jens.wiklander@linaro.org>
In-Reply-To: <20220622134219.1596613-2-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4b5db3bc-7fb4-45d9-5b2c-08da60d9a392
x-ms-traffictypediagnostic:
	AM6PR08MB4149:EE_|VE1EUR03FT048:EE_|AM9PR08MB7053:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 94LorKCj5SuKKgLo5YbwhTIXe6lnUX+ie7hMVSLOrcXJfv8zV5lZb+cWZXgVfi924wVz4WzGkHyCFBS9ZS6yd52rxzH3dkv/6MM/rpmwkn98FzmV97n7YGDQhjt7zl5HseK8AiYHaZS42zr77gVbO+uaogDaq4wJt1mJrns38PZuRH8GWnPTrF3zFLIdhPckeXgBbvCIuGVKSeI9RLjFokLT4foNdlWtEdsc3k80458hgnRW2tKJCilNjhqYOXQW0C2Nh0PNZkqSvA325VcCdAuVuuu+TW+RfQwtMKuwbmeeeGHppUa3WR2nNdDiRqRPNG9CE5nuKL1WiAUR90k4gQclHeyWMAE20BZriIXD65G87onFQ8PKhmjFv5VGSwdiGMdIMX0fgIGOfDRBnB/QJ+e0LvzLKHp6w948mRhnH4tdkaBVnAB00Q8AWfsmp4DhgbZZqlcNCXT7Ft6iqdD0MehID6wf8XCQZwZYQfcrXwOyN2ZkC8FuRKWZ3EWlW4RMRsqWIZZRravjWeXnrBHj2A+znytmfNkEbMLIerFtYVc3SJ4fsKV1nUCqMU8Zl315+XM49Dr/hjwKIJ1u92wqVxrOPnyFPwps3cP4TjrMHV9cZrUuHcoBbcU7JQnuQtnvzE2Sck7EpCNkt+Em7OBclu7JINd6n3L6KsmGDSWX/ooAcTrH4XRY8q2OmFbAU9KQMnV/YMsLnkMKTBkqyLHuLQoEglYjVfysA6/LGCSVEvL5vpObNXY2kJOGegONn0uaMxpkfWHbXC1EC1ypQ0nRmfSgx2tu6PLlpp5A80GijKeuh6xaC6yx5ltA5krOLjF8ceIQrJu0MQOIbO3DzL3GmJIzJEMeBT1rk/IcbJ67Opja8YDqyPVnViIB+dc+qOas
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(53546011)(966005)(33656002)(86362001)(6486002)(6506007)(478600001)(41300700001)(6512007)(26005)(5660300002)(8936002)(2906002)(38070700005)(316002)(2616005)(83380400001)(54906003)(66556008)(64756008)(186003)(66446008)(66476007)(76116006)(38100700002)(66946007)(4326008)(36756003)(122000001)(91956017)(6916009)(8676002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2A76FFF24DF59409884E0DED528551E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4149
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	950f0981-a69c-4eeb-ee85-08da60d99ab4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2z0OCnwUAYDcEIBcgzj5fLio9dACw3SD6/j/11j7HGHA+dhW7BH9oD/SWjBh2betgBUEln+2XK0M9WgzFKFYM7UEyHDhfmj37s649gICMeB+l6v6RCqM82gMGdB2XbysEUFn6YQCFGfltMtGMUlruEAx9KqxMN2wiIa666+b1bHIrRdJUIb53xNSSE+YM8kJ4N+5sewhaI8tf+rzdCGFR8brSbeMDJy7uU3BqfcqTjXcJCYrR1m6VfopUxQDwDYP3jbRJLI3F/tSdtnTn7gDjlrKs9FkGKTTSaFk8ZVz2wdDRFaNdItbuEKO9jnNoLws8UW6IbtrOlIYPlab2NncKBixj/SoKzAJLdEIfXdtBYV+S5ongdO8ywZ2ZqQijz703zNnK0S8rMYzez+Dcwel3MtkKcuZND88Hv3ZN6I+O/iz+jWhem8he2v6rUbfawQj1DaAfu09muOAKCEBveqUbppe4Dcd+AHBp2XdBx7ulO0psmNXE98Jbyx+2kA47/xDw60jaQWI0IxjQO0uxpCvUt9fnY80ENMMDLfz5UjQ9pmfnBAo2s/GwQatMI+TzyQbw0VvYk0XFHxf8WrXgn7daR42L7t28zoh66V/6wWeeB+aGClOCy6I1lL9DT/MisXehVSNzNUOBZPx2IyEzRop0T2EQqqEhClj1zLyzMQmCPRhB1UgpmtoITmni+NBWOYUJq1sMy7S+94Yd3Exw8z024RsTmyFwCzG7uW2FdQXyOiceuzVvf0zAlarE+UX7oxR6KD6iE95vRzue6MxJNcydOOjZrpuG5hTAFlJYnKArlfO2/Lrk2nbEO3kKmoxaBNMJZsP7+2O7lrSRcEawex8oBS7VBwrnapiF9zlY2CSN2I=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(39860400002)(36840700001)(40470700004)(46966006)(54906003)(8936002)(4326008)(36860700001)(966005)(8676002)(6862004)(70206006)(478600001)(36756003)(2616005)(70586007)(6486002)(316002)(40460700003)(86362001)(5660300002)(81166007)(53546011)(2906002)(6512007)(82740400003)(6506007)(82310400005)(356005)(41300700001)(26005)(47076005)(336012)(40480700001)(33656002)(186003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 12:01:49.3700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5db3bc-7fb4-45d9-5b2c-08da60d9a392
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7053

SGkgSmVucywNCg0KPiBPbiAyMiBKdW4gMjAyMiwgYXQgMTQ6NDIsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IFNNQ0NDIHYxLjIgQUFyY2g2
NCBhbGxvd3MgeDAteDE3IHRvIGJlIHVzZWQgYXMgYm90aCBwYXJhbWV0ZXIgcmVnaXN0ZXJzDQo+
IGFuZCByZXN1bHQgcmVnaXN0ZXJzIGZvciB0aGUgU01DIGFuZCBIVkMgaW5zdHJ1Y3Rpb25zLg0K
PiANCj4gQXJtIEZpcm13YXJlIEZyYW1ld29yayBmb3IgQXJtdjgtQSBzcGVjaWZpY2F0aW9uIG1h
a2VzIHVzZSBvZiB4MC14NyBhcw0KPiBwYXJhbWV0ZXIgYW5kIHJlc3VsdCByZWdpc3RlcnMuDQo+
IA0KPiBMZXQgdXMgYWRkIG5ldyBpbnRlcmZhY2UgdG8gc3VwcG9ydCB0aGlzIGV4dGVuZGVkIHNl
dCBvZiBpbnB1dC9vdXRwdXQNCj4gcmVnaXN0ZXJzLg0KPiANCj4gVGhpcyBpcyBiYXNlZCBvbiAz
ZmRjMGNiNTlkOTcgKCJhcm02NDogc21jY2M6IEFkZCBzdXBwb3J0IGZvciBTTUNDQ3YxLjINCj4g
ZXh0ZW5kZWQgaW5wdXQvb3V0cHV0IHJlZ2lzdGVycyIpIGJ5IFN1ZGVlcCBIb2xsYSBmcm9tIHRo
ZSBMaW51eCBrZXJuZWwNCj4gDQo+IFRoZSBTTUNDQyB2ZXJzaW9uIHJlcG9ydGVkIHRvIHRoZSBW
TSBpcyBidW1wZWQgdG8gMS4yIGluIG9yZGVyIHRvIHN1cHBvcnQNCj4gaGFuZGxpbmcgRkYtQSBt
ZXNzYWdlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEplbnMgV2lrbGFuZGVyIDxqZW5zLndpa2xh
bmRlckBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gDQoNCkkgdGhpbmsgeW91IG5lZWQgdG8gdXBkYXRl
IHRoZSBjb3B5cmlnaHQgaW5mb3JtYXRpb24gb2YgdGhlIHNtY2NjLmggaGVhZGVyIChtYWludGFp
bmVycyBjYW4gY29uZmlybSBpZiBpdOKAmXMgbmVlZGVkKSwNCmFsc28gaXQgc2VlbXMgdGhhdCB5
b3UgYWdyZWVkIHdpdGggSnVsaWVuIHRvIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2Ugd2l0aCBh
IHJlZmVyZW5jZSB0byB0aGUgc3BlYyBidXQgbWF5YmUgeW91DQpmb3Jnb3QgYWJvdXQgdGhhdDoN
Cmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY29tbWVudC8yNDg5NzQxMy8NCg0KV2l0aCB0
aGVzZSBhZGRyZXNzZWQ6DQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNl
bGx1QGFybS5jb20+DQoNCg0KDQoNCg==

