Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4721685138E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 13:29:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679560.1057027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZVQm-00079R-7e; Mon, 12 Feb 2024 12:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679560.1057027; Mon, 12 Feb 2024 12:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZVQm-00076S-48; Mon, 12 Feb 2024 12:29:04 +0000
Received: by outflank-mailman (input) for mailman id 679560;
 Mon, 12 Feb 2024 12:29:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=guxz=JV=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rZVQl-000763-E5
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 12:29:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bf55653-c9a2-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 13:28:59 +0100 (CET)
Received: from AS4PR10CA0025.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::14)
 by DB9PR08MB9516.eurprd08.prod.outlook.com (2603:10a6:10:451::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.37; Mon, 12 Feb
 2024 12:28:56 +0000
Received: from AM4PEPF00027A5F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::50) by AS4PR10CA0025.outlook.office365.com
 (2603:10a6:20b:5d8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38 via Frontend
 Transport; Mon, 12 Feb 2024 12:28:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A5F.mail.protection.outlook.com (10.167.16.74) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 12:28:55 +0000
Received: ("Tessian outbound 1076c872ecc6:v228");
 Mon, 12 Feb 2024 12:28:55 +0000
Received: from 60c213bfa62b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F504CA10-0E81-48DC-9AD7-3B6178588798.1; 
 Mon, 12 Feb 2024 12:28:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 60c213bfa62b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 12 Feb 2024 12:28:48 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Mon, 12 Feb
 2024 12:28:47 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::2257:5fcb:b449:fff0]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::2257:5fcb:b449:fff0%7]) with mapi id 15.20.7270.033; Mon, 12 Feb 2024
 12:28:46 +0000
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
X-Inumbo-ID: 4bf55653-c9a2-11ee-98f5-efadbce2ee36
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cJJe/6zkuFTvIeq2GsnFKYIPig/Rom4bRRnvU/ZyKci/BpanJtv13mRXMwNMTx1OZxe/XSOY/kelj5bnQa+1UhGyHurI/ma29exA+R32SeDRM4oAz76hPahKBPT+6nrQKjcteHCuWXFSdVUDT+tMKMkGuWLK6PPuMB1u9JaSCZKwWvWfDQRD2TgpWFdOOZyaMQE9dvurC1AtT99LL2882XtYtJuOr0l1VnsKSwIEAztKyKvjrDP5aKWfVlbzW0cANE/08awlx7HYML5+dRmpy0vH5fzuJFMe738CYzvsKLejPbxckMLfx8fjCkD6ccIjDS7v3GBIMSV+7LGWq+z8eA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qugOlm4aia2D+S/VPVQ1la0Qd6ycqcbzWeEv3p8IOE=;
 b=Az3zXPxkBphvgWeDU8MBm07AUs8LHEdVCYqQy13ciCFxNCq3y4fC5CnquTqapmzISwM6gR5HkLcgwD0QO7DioX+eTPBujZfbsyrhWCZeXgQEYA0EgJHaxHy+C19sO0q0I0T6irnD2gwNAxAvZSbAz1D5WmIcjnhME2bFtAupkN/a+IylBjJHQHn9FzXFQ+IrFiZ+ezp6DPxiF7pLkCVMWIeEUVGLj89y3j6wkiQDfhhwcBGJILDNKlOhYWE66KwGJd8KRYsqOa5FsiVRHNQDUeoj+BkhmQAaVdVN2h5l3huw6DMqnapVZVW0QKqxSK3rS7yoKFIDSlw/hkp+4M+F0Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qugOlm4aia2D+S/VPVQ1la0Qd6ycqcbzWeEv3p8IOE=;
 b=KRpRV+pDHaFMDfgjNQf2E2YGte8R3yXYs0Ry9IZGPTz8FiJYBudJSnlrTlpQ5Qqwwwt2ZrCKiREajVRcpTFRW8o3p+2t1izc4Rc/oVviqw+kUZqvWAfj6GtE+kvMu+pgQ2k0IvLZ+4EkiFqH8Qn0dFENfm7v3osKGx/ZUJQDwZs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 85e76e124748d97e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdRI8OO/K+n7yfm3UaWYOJ11L3iu6P7Woez5UQ+5MkW2GMM/hQS5U5oFFsMSAK5NSgmxSpvVZ59ypqQazSTclRLIFFWV0RHW/i9nEpvPJq6F8wxy/iyX9SjYvvTFvvw+iUZCvXhkDXHNIKJq+C8krV3J2K1tv8c//MUECSsl8NmFdg0KCjvilp/Ygss0Il26wIw5+SNjlbna/jKn3HHpDa2OZZOeV+ebK10q57Q/kP5HTj5fMUFxq57N6ZtDJYr92DxrcjtKlLSRTJZoWOrXJuZj94/lXL/2gpjEAodN/QiXacAzVtiZvD/3bQaK3hXBmmZdH5TO5dkmMSOWwMif1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qugOlm4aia2D+S/VPVQ1la0Qd6ycqcbzWeEv3p8IOE=;
 b=c7z6u1HqxxiAyPx7vZDH7nfNGeK6OKHLZa64nltQF1jL7ZbHmFgWIVIvfd23WUTbuwwIUf1OdBB56nUgMdWbeASarA+j41kmABi/S9CPj3O4nH4EMcxqKLXkKesIiphZdpmDeYuHZTX8tU7iO/cXUMme+eGLuYphVAF4DDqlggZ6H/eSc28aPo5JQWWKD/rVsA9Th3K4vLWxUI5LXGsDyMZDnZMxaG5MmqG1+pzMGEPnhkD122lRWFcr4v3DptGBk6PDa1nMm/ulWcJwH+dSXP8pfhxiZpycHv1qDFSYiROpuUnO24CHTLdJwjw6Do63o/kNOWmLfFdL8D8sffTfzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qugOlm4aia2D+S/VPVQ1la0Qd6ycqcbzWeEv3p8IOE=;
 b=KRpRV+pDHaFMDfgjNQf2E2YGte8R3yXYs0Ry9IZGPTz8FiJYBudJSnlrTlpQ5Qqwwwt2ZrCKiREajVRcpTFRW8o3p+2t1izc4Rc/oVviqw+kUZqvWAfj6GtE+kvMu+pgQ2k0IvLZ+4EkiFqH8Qn0dFENfm7v3osKGx/ZUJQDwZs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v4] xen/arm: ffa: reclaim shared memory on guest
 destroy
Thread-Topic: [XEN PATCH v4] xen/arm: ffa: reclaim shared memory on guest
 destroy
Thread-Index: AQHaWErq04RDxa7M60+0c7FHpMlvF7EGrWkA
Date: Mon, 12 Feb 2024 12:28:46 +0000
Message-ID: <CA6D5F9E-9FA6-440D-BD0B-7005E3F7A08E@arm.com>
References: <20240205154909.2392231-1-jens.wiklander@linaro.org>
In-Reply-To: <20240205154909.2392231-1-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB6376:EE_|AM4PEPF00027A5F:EE_|DB9PR08MB9516:EE_
X-MS-Office365-Filtering-Correlation-Id: a0987e13-92a7-40f8-8195-08dc2bc62e23
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gDhSj2gnGtuWV/SDWLDfAl7vrWWNOIxR9PATdnRQyekMzuau65OXaDoE7afyOwBcEKqrtvsThlEwdJ//sNO2CMzxG4LHIAqVsAqzKgmvw57E8ACeUs580vwBekQ8pdTZQWAroMbglS1cApch3Eev/WDIWol9CZSZLSGOxYPi0SibLrmrbRpjEClV8TnsiJHQhk6UuyaN7OTEgSFf9QJhOUT+mxwSkANNWgbTTG4kGHTmqUJkDPV6Ll54Gq3UzZjcVzXhC14ijNcaR/IhCur0XpaguXe2vq1Jn/Pfa1Mhz22e4RpnsqOUt/zVtka0fUAJTW9Tax13E9HqizAkCOUEtIElAmbD0Hls8o7Uzych/4m/elBO/DIy7yWSW01fzx9IPOZ3crYa4/zy4YELNwK5GY9GExrToeVqIs60kbM8glH6TEwnAPy5rExoGPSHTAiIpyejglO87c2bFiZkstQoPDEy7DHWZIzF8L6rQMoicLDjwYAVmwftHWYRpz6iZpj4Rr+gu7nFPZERNbZLaklBCCM3Hg7C9uhnDWhdLVEUVIClJAisKIKH9Bw8CUaEpzIdefXSFJyIJkoMtsxJcIto9OIGvbCVf7cpVEgw77oLODW8chU8otjuBgAXpzBIb6wo
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(39860400002)(366004)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(5660300002)(8676002)(71200400001)(41300700001)(2616005)(66899024)(30864003)(64756008)(2906002)(4326008)(66946007)(66476007)(66556008)(8936002)(66446008)(76116006)(6916009)(478600001)(83380400001)(38070700009)(53546011)(6486002)(6512007)(54906003)(6506007)(316002)(86362001)(38100700002)(122000001)(33656002)(36756003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BD33D6EFC95A97448CA4DC6FCBDD8792@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b786eb9b-2d4c-43cc-3405-08dc2bc628df
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nFjG9NHRSh9oOAr/NIILRsgmehZHisBcT9DJpQSbbwwKCcFKxYw5l9YZVOcxaxLbFIxcEFJsMilIx3/gTNUqm4pGT73VCkqpf17VBT0MMEx+AemXlThnJQmLLCyDLrtaDlWSias6hIs4iasDXp379SHOvFEjAZur2ZMxL5KGvvgh07dt0e+yuhPbQSEoIweAfXz2bFBbpRoKb3DcmmFuXQBWzH2F9fBQMM2HqXYLa42RdasxaDf08QCuG173UtNVfE15EJ08GOlA4l17f0ynPoofCYISLAiEOLrhLnYiWDbK4vjUpc6ppPXRRwn6K5LGtt7oGgRjYaFqdDX5Pr0ioh741Tue4BeoNXX4mrQw/WYI8e+TOCec9VR3lf1TjgEG0HwEQg/KZ0rzn9vTS9ChRDc0lXtmAS/DOmCQ4rCq8QPK3vIT/XHkUjRyWHIGGKyr0GRVW6EJVMCG8fmHPyzrNlD/R066EbSUbRspPNekPCIKPxgDAYLRxs0tBhiZQFDNSiEg/5CBBuEB7x6AuB18/QhXVDTWGSZ4EMmpOsWJYgxeql6d6UmAoZisdEwJDiBRgoP7Z4Slo0Tx4DjSvz4FBz4QWU61MO9f96XaqTWK9pE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(82310400011)(186009)(36840700001)(46966006)(40470700004)(41300700001)(66899024)(356005)(5660300002)(82740400003)(33656002)(30864003)(2906002)(36756003)(336012)(70586007)(316002)(8936002)(70206006)(478600001)(6486002)(8676002)(6862004)(54906003)(83380400001)(4326008)(2616005)(107886003)(81166007)(86362001)(6506007)(26005)(6512007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 12:28:55.6584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0987e13-92a7-40f8-8195-08dc2bc62e23
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9516

Hi Jens,

> On 5 Feb 2024, at 16:49, Jens Wiklander <jens.wiklander@linaro.org> wrote=
:
>=20
> When an FF-A enabled guest is destroyed it may leave behind memory
> shared with SPs. This memory must be reclaimed before it's reused or an
> SP may make changes to memory used by a new unrelated guest. So when the
> domain is teared down add FF-A requests to reclaim all remaining shared
> memory.
>=20
> SPs in the secure world are notified using VM_DESTROYED that a guest has
> been destroyed. An SP is supposed to relinquish all shared memory to allo=
w
> reclaiming the memory. The relinquish operation may need to be delayed if
> the shared memory is for instance part of a DMA operation.
>=20
> The domain reference counter is increased when the first FF-A shared
> memory is registered and the counter is decreased again when the last
> shared memory is reclaimed. If FF-A shared memory registrations remain
> at the end of of ffa_domain_teardown() a timer is set to try to reclaim
> the shared memory every second until the memory is reclaimed.
>=20
> A few minor style fixes with a removed empty line here and an added new
> line there.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

From my point of view all looks good now so with the changes requested
by Andrew handled, feel free to add my R-b in the v5:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
>=20
> v4:
> - Retry FFA_MSG_SEND_VM_DESTROYED on the returned errors
>  FFA_RET_INTERRUPTED and FFA_RET_RETRY even after all shared memory
>  handles has been reclaimed.
> - Retry ffa_mem_reclaim() only on temporary returned errors, permanent
>  errors like FFA_RET_INVALID_PARAMETERS is dealt with in recovery mode
>  instead since the SPMC isn't expected to use that error under normal
>  circumstances.
>=20
> v3:
> - Mentioning in the commit message that there are some style fixes
> - Addressing review comments
> - Refactor the ffa_domain_teardown() path to let
>  ffa_domain_teardown_continue() do most of the work.
>=20
> v2:
> - Update commit message to match the new implementation
> - Using a per domain bitfield to keep track of which SPs has been notifie=
d
>  with VM_DESTROYED
> - Holding a domain reference counter to keep the domain as a zombie domai=
n
>  while there still is shared memory registrations remaining to be reclaim=
ed
> - Using a timer to retry reclaiming remaining shared memory registrations
> ---
> xen/arch/arm/tee/ffa.c | 285 ++++++++++++++++++++++++++++++++++-------
> 1 file changed, 236 insertions(+), 49 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 0793c1c7585d..bbb6b819ee2b 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -54,6 +54,7 @@
> #include <xen/mm.h>
> #include <xen/sched.h>
> #include <xen/sizes.h>
> +#include <xen/timer.h>
> #include <xen/types.h>
>=20
> #include <asm/event.h>
> @@ -144,6 +145,12 @@
>  */
> #define FFA_MAX_SHM_COUNT               32
>=20
> +/*
> + * The time we wait until trying to tear down a domain again if it was
> + * blocked initially.
> + */
> +#define FFA_CTX_TEARDOWN_DELAY          SECONDS(1)
> +
> /* FF-A-1.1-REL0 section 10.9.2 Memory region handle, page 167 */
> #define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
> #define FFA_HANDLE_INVALID              0xffffffffffffffffULL
> @@ -384,11 +391,6 @@ struct ffa_ctx {
>     unsigned int page_count;
>     /* FF-A version used by the guest */
>     uint32_t guest_vers;
> -    /*
> -     * Number of SPs that we have sent a VM created signal to, used in
> -     * ffa_domain_teardown() to know which SPs need to be signalled.
> -     */
> -    uint16_t create_signal_count;
>     bool rx_is_free;
>     /* Used shared memory objects, struct ffa_shm_mem */
>     struct list_head shm_list;
> @@ -402,6 +404,15 @@ struct ffa_ctx {
>     spinlock_t tx_lock;
>     spinlock_t rx_lock;
>     spinlock_t lock;
> +    /* Used if domain can't be torn down immediately */
> +    struct domain *teardown_d;
> +    struct list_head teardown_list;
> +    s_time_t teardown_expire;
> +    /*
> +     * Used for ffa_domain_teardown() to keep track of which SPs should =
be
> +     * notified that this guest is being destroyed.
> +     */
> +    unsigned long vm_destroy_bitmap[];
> };
>=20
> struct ffa_shm_mem {
> @@ -436,6 +447,12 @@ static void *ffa_tx __read_mostly;
> static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
> static DEFINE_SPINLOCK(ffa_tx_buffer_lock);
>=20
> +
> +/* Used to track domains that could not be torn down immediately. */
> +static struct timer ffa_teardown_timer;
> +static struct list_head ffa_teardown_head;
> +static DEFINE_SPINLOCK(ffa_teardown_lock);
> +
> static bool ffa_get_version(uint32_t *vers)
> {
>     const struct arm_smccc_1_2_regs arg =3D {
> @@ -853,7 +870,6 @@ static int32_t handle_partition_info_get(uint32_t w1,=
 uint32_t w2, uint32_t w3,
>             goto out_rx_release;
>         }
>=20
> -
>         memcpy(ctx->rx, ffa_rx, sz);
>     }
>     ctx->rx_is_free =3D false;
> @@ -992,53 +1008,75 @@ static void put_shm_pages(struct ffa_shm_mem *shm)
>     }
> }
>=20
> -static bool inc_ctx_shm_count(struct ffa_ctx *ctx)
> +static bool inc_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
> {
>     bool ret =3D true;
>=20
>     spin_lock(&ctx->lock);
> +
> +    /*
> +     * If this is the first shm added, increase the domain reference
> +     * counter as we need to keep domain around a bit longer to reclaim =
the
> +     * shared memory in the teardown path.
> +     */
> +    if ( !ctx->shm_count )
> +        get_knownalive_domain(d);
> +
>     if (ctx->shm_count >=3D FFA_MAX_SHM_COUNT)
>         ret =3D false;
>     else
>         ctx->shm_count++;
> +
>     spin_unlock(&ctx->lock);
>=20
>     return ret;
> }
>=20
> -static void dec_ctx_shm_count(struct ffa_ctx *ctx)
> +static void dec_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
> {
>     spin_lock(&ctx->lock);
> +
>     ASSERT(ctx->shm_count > 0);
>     ctx->shm_count--;
> +
> +    /*
> +     * If this was the last shm removed, let go of the domain reference =
we
> +     * took in inc_ctx_shm_count() above.
> +     */
> +    if ( !ctx->shm_count )
> +        put_domain(d);
> +
>     spin_unlock(&ctx->lock);
> }
>=20
> -static struct ffa_shm_mem *alloc_ffa_shm_mem(struct ffa_ctx *ctx,
> +static struct ffa_shm_mem *alloc_ffa_shm_mem(struct domain *d,
>                                              unsigned int page_count)
> {
> +    struct ffa_ctx *ctx =3D d->arch.tee;
>     struct ffa_shm_mem *shm;
>=20
>     if ( page_count >=3D FFA_MAX_SHM_PAGE_COUNT )
>         return NULL;
> -    if ( !inc_ctx_shm_count(ctx) )
> +    if ( !inc_ctx_shm_count(d, ctx) )
>         return NULL;
>=20
>     shm =3D xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count);
>     if ( shm )
>         shm->page_count =3D page_count;
>     else
> -        dec_ctx_shm_count(ctx);
> +        dec_ctx_shm_count(d, ctx);
>=20
>     return shm;
> }
>=20
> -static void free_ffa_shm_mem(struct ffa_ctx *ctx, struct ffa_shm_mem *sh=
m)
> +static void free_ffa_shm_mem(struct domain *d, struct ffa_shm_mem *shm)
> {
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
>     if ( !shm )
>         return;
>=20
> -    dec_ctx_shm_count(ctx);
> +    dec_ctx_shm_count(d, ctx);
>     put_shm_pages(shm);
>     xfree(shm);
> }
> @@ -1306,7 +1344,7 @@ static void handle_mem_share(struct cpu_user_regs *=
regs)
>         goto out_unlock;
>     }
>=20
> -    shm =3D alloc_ffa_shm_mem(ctx, page_count);
> +    shm =3D alloc_ffa_shm_mem(d, page_count);
>     if ( !shm )
>     {
>         ret =3D FFA_RET_NO_MEMORY;
> @@ -1350,7 +1388,7 @@ static void handle_mem_share(struct cpu_user_regs *=
regs)
>=20
> out:
>     if ( ret )
> -        free_ffa_shm_mem(ctx, shm);
> +        free_ffa_shm_mem(d, shm);
> out_unlock:
>     spin_unlock(&ctx->tx_lock);
>=20
> @@ -1401,7 +1439,7 @@ static int handle_mem_reclaim(uint64_t handle, uint=
32_t flags)
>     }
>     else
>     {
> -        free_ffa_shm_mem(ctx, shm);
> +        free_ffa_shm_mem(d, shm);
>     }
>=20
>     return ret;
> @@ -1486,6 +1524,41 @@ static bool ffa_handle_call(struct cpu_user_regs *=
regs)
>     }
> }
>=20
> +static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
> +                              uint16_t end, uint16_t sp_id)
> +{
> +    unsigned int n;
> +
> +    for ( n =3D start; n < end; n++ )
> +    {
> +        if ( subscr[n] =3D=3D sp_id )
> +            return true;
> +    }
> +
> +    return false;
> +}
> +
> +static void vm_destroy_bitmap_init(struct ffa_ctx *ctx,
> +                                   unsigned int create_signal_count)
> +{
> +    unsigned int n;
> +
> +    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> +    {
> +        /*
> +         * Skip SPs subscribed to the VM created event that never was
> +         * notified of the VM creation due to an error during
> +         * ffa_domain_init().
> +         */
> +        if ( is_in_subscr_list(subscr_vm_created, create_signal_count,
> +                               subscr_vm_created_count,
> +                               subscr_vm_destroyed[n]) )
> +            continue;
> +
> +        set_bit(n, ctx->vm_destroy_bitmap);
> +    }
> +}
> +
> static int ffa_domain_init(struct domain *d)
> {
>     struct ffa_ctx *ctx;
> @@ -1501,11 +1574,14 @@ static int ffa_domain_init(struct domain *d)
>     if ( d->domain_id >=3D UINT16_MAX)
>         return -ERANGE;
>=20
> -    ctx =3D xzalloc(struct ffa_ctx);
> +    ctx =3D xzalloc_flex_struct(struct ffa_ctx, vm_destroy_bitmap,
> +                              BITS_TO_LONGS(subscr_vm_destroyed_count));
>     if ( !ctx )
>         return -ENOMEM;
>=20
>     d->arch.tee =3D ctx;
> +    ctx->teardown_d =3D d;
> +    INIT_LIST_HEAD(&ctx->shm_list);
>=20
>     for ( n =3D 0; n < subscr_vm_created_count; n++ )
>     {
> @@ -1515,65 +1591,173 @@ static int ffa_domain_init(struct domain *d)
>         {
>             printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %u=
 to  %u: res %d\n",
>                    get_vm_id(d), subscr_vm_created[n], res);
> -            ctx->create_signal_count =3D n;
> -            return -EIO;
> +            break;
>         }
>     }
> -    ctx->create_signal_count =3D subscr_vm_created_count;
> -
> -    INIT_LIST_HEAD(&ctx->shm_list);
> +    vm_destroy_bitmap_init(ctx, n);
> +    if ( n !=3D subscr_vm_created_count )
> +        return -EIO;
>=20
>     return 0;
> }
>=20
> -static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
> -                              uint16_t end, uint16_t sp_id)
> +static void send_vm_destroyed(struct domain *d)
> {
> +    struct ffa_ctx *ctx =3D d->arch.tee;
>     unsigned int n;
> +    int32_t res;
>=20
> -    for ( n =3D start; n < end; n++ )
> +    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
>     {
> -        if ( subscr[n] =3D=3D sp_id )
> -            return true;
> -    }
> +        if ( !test_bit(n, ctx->vm_destroy_bitmap) )
> +            continue;
>=20
> -    return false;
> +        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id=
(d),
> +                                     FFA_MSG_SEND_VM_DESTROYED);
> +
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "%pd: ffa: Failed to report destruction of=
 vm_id %u to %u: res %d\n",
> +                   d, get_vm_id(d), subscr_vm_destroyed[n], res);
> +        }
> +
> +        /*
> +         * For these two error codes the hypervisor is expected to resen=
d
> +         * the destruction message. For the rest it is expected that the
> +         * error is permanent and that is doesn't help to resend the
> +         * destruction message.
> +         */
> +        if ( res !=3D FFA_RET_INTERRUPTED && res !=3D FFA_RET_RETRY )
> +            clear_bit(n, ctx->vm_destroy_bitmap);
> +    }
> }
>=20
> -/* This function is supposed to undo what ffa_domain_init() has done */
> -static int ffa_domain_teardown(struct domain *d)
> +static void reclaim_shms(struct domain *d)
> {
>     struct ffa_ctx *ctx =3D d->arch.tee;
> -    unsigned int n;
> +    struct ffa_shm_mem *shm, *tmp;
>     int32_t res;
>=20
> -    if ( !ctx )
> -        return 0;
> +    list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
> +    {
> +        register_t handle_hi;
> +        register_t handle_lo;
> +
> +        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> +        res =3D ffa_mem_reclaim(handle_lo, handle_hi, 0);
> +        switch ( res ) {
> +        case FFA_RET_OK:
> +            printk(XENLOG_G_DEBUG "%pd: ffa: Reclaimed handle %#lx\n",
> +                   d, shm->handle);
> +            list_del(&shm->list);
> +            free_ffa_shm_mem(d, shm);
> +            break;
> +        case FFA_RET_DENIED:
> +            /*
> +             * A temporary error that may get resolved a bit later, it's
> +             * worth retrying.
> +             */
> +            printk(XENLOG_G_INFO "%pd: ffa: Failed to reclaim handle %#l=
x : %d\n",
> +                   d, shm->handle, res);
> +            break; /* We will retry later */
> +        default:
> +            /*
> +             * The rest of the error codes are not expected and are assu=
med
> +             * to be of a permanent nature. It not in our control to han=
dle
> +             * the error properly so the object in this case is to try t=
o
> +             * minimize the damage.
> +             *
> +             * FFA_RET_NO_MEMORY might be a temporary error as it it cou=
ld
> +             * succeed if retried later, but treat it as permanent for n=
ow.
> +             */
> +            printk(XENLOG_G_INFO "%pd: ffa: Permanent failure to reclaim=
 handle %#lx : %d\n",
> +                   d, shm->handle, res);
>=20
> -    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> +            /*
> +             * Remove the shm from the list and free it, but don't drop
> +             * references. This results in having the shared physical pa=
ges
> +             * permanently allocate and also keeps the domain as a zombi=
e
> +             * domain.
> +             */
> +            list_del(&shm->list);
> +            xfree(shm);
> +            break;
> +        }
> +    }
> +}
> +
> +static void ffa_domain_teardown_continue(struct ffa_ctx *ctx, bool first=
_time)
> +{
> +    struct ffa_ctx *next_ctx =3D NULL;
> +
> +    send_vm_destroyed(ctx->teardown_d);
> +    reclaim_shms(ctx->teardown_d);
> +
> +    if ( ctx->shm_count ||
> +         !bitmap_empty(ctx->vm_destroy_bitmap, subscr_vm_destroyed_count=
) )
> +    {
> +        printk(XENLOG_G_INFO "%pd: ffa: Remaining cleanup, retrying\n", =
ctx->teardown_d);
> +
> +        ctx->teardown_expire =3D NOW() + FFA_CTX_TEARDOWN_DELAY;
> +
> +        spin_lock(&ffa_teardown_lock);
> +        list_add_tail(&ctx->teardown_list, &ffa_teardown_head);
> +        /* Need to set a new timer for the next ctx in line */
> +        next_ctx =3D list_first_entry(&ffa_teardown_head, struct ffa_ctx=
,
> +                                    teardown_list);
> +        spin_unlock(&ffa_teardown_lock);
> +    }
> +    else
>     {
>         /*
> -         * Skip SPs subscribed to the VM created event that never was
> -         * notified of the VM creation due to an error during
> -         * ffa_domain_init().
> +         * domain_destroy() might have been called (via put_domain() in
> +         * reclaim_shms()), so we can't touch the domain structure anymo=
re.
>          */
> -        if ( is_in_subscr_list(subscr_vm_created, ctx->create_signal_cou=
nt,
> -                               subscr_vm_created_count,
> -                               subscr_vm_destroyed[n]) )
> -            continue;
> +        xfree(ctx);
>=20
> -        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id=
(d),
> -                                     FFA_MSG_SEND_VM_DESTROYED);
> -
> -        if ( res )
> -            printk(XENLOG_ERR "ffa: Failed to report destruction of vm_i=
d %u to  %u: res %d\n",
> -                   get_vm_id(d), subscr_vm_destroyed[n], res);
> +        /* Only check if there has been a change to the teardown queue *=
/
> +        if ( !first_time )
> +        {
> +            spin_lock(&ffa_teardown_lock);
> +            next_ctx =3D list_first_entry_or_null(&ffa_teardown_head,
> +                                                struct ffa_ctx, teardown=
_list);
> +            spin_unlock(&ffa_teardown_lock);
> +        }
>     }
>=20
> +    if ( next_ctx )
> +        set_timer(&ffa_teardown_timer, next_ctx->teardown_expire);
> +}
> +
> +static void ffa_teardown_timer_callback(void *arg)
> +{
> +    struct ffa_ctx *ctx;
> +
> +    spin_lock(&ffa_teardown_lock);
> +    ctx =3D list_first_entry_or_null(&ffa_teardown_head, struct ffa_ctx,
> +                                   teardown_list);
> +    if ( ctx )
> +        list_del(&ctx->teardown_list);
> +    spin_unlock(&ffa_teardown_lock);
> +
> +    if ( ctx )
> +        ffa_domain_teardown_continue(ctx, false /* !first_time */);
> +    else
> +        printk(XENLOG_G_ERR "%s: teardown list is empty\n", __func__);
> +}
> +
> +/* This function is supposed to undo what ffa_domain_init() has done */
> +static int ffa_domain_teardown(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( !ctx )
> +        return 0;
> +
>     if ( ctx->rx )
>         rxtx_unmap(ctx);
>=20
> -    XFREE(d->arch.tee);
> +    ffa_domain_teardown_continue(ctx, true /* first_time */);
>=20
>     return 0;
> }
> @@ -1739,6 +1923,9 @@ static bool ffa_probe(void)
>     if ( !init_sps() )
>         goto err_free_ffa_tx;
>=20
> +    INIT_LIST_HEAD(&ffa_teardown_head);
> +    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0=
);
> +
>     return true;
>=20
> err_free_ffa_tx:
> --=20
> 2.34.1
>=20


