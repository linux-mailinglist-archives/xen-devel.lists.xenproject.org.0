Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 188A8A1D0DE
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 07:21:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877441.1287582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcIUe-0003DK-AG; Mon, 27 Jan 2025 06:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877441.1287582; Mon, 27 Jan 2025 06:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcIUe-0003BH-6r; Mon, 27 Jan 2025 06:21:08 +0000
Received: by outflank-mailman (input) for mailman id 877441;
 Mon, 27 Jan 2025 06:21:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50Ot=UT=eviden.com=clement.mathieu--drif@srs-se1.protection.inumbo.net>)
 id 1tcIUc-0003B9-Nj
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 06:21:06 +0000
Received: from smarthost4.eviden.com (smarthost4.eviden.com [80.78.11.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2fe6632-dc76-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 07:21:04 +0100 (CET)
Received: from mail-db8eur05lp2111.outbound.protection.outlook.com (HELO
 EUR05-DB8-obe.outbound.protection.outlook.com) ([104.47.17.111])
 by smarthost4.eviden.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 27 Jan 2025 07:21:02 +0100
Received: from AM8PR07MB7602.eurprd07.prod.outlook.com (2603:10a6:20b:24b::7)
 by AS1PR07MB8406.eurprd07.prod.outlook.com (2603:10a6:20b:4c6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 06:21:00 +0000
Received: from AM8PR07MB7602.eurprd07.prod.outlook.com
 ([fe80::fbd7:ca71:b636:6f9d]) by AM8PR07MB7602.eurprd07.prod.outlook.com
 ([fe80::fbd7:ca71:b636:6f9d%7]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 06:21:00 +0000
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
X-Inumbo-ID: e2fe6632-dc76-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=eviden.com; i=@eviden.com; q=dns/txt; s=mail;
  t=1737958865; x=1769494865;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BBWPPFO0UvFY6u15cvi/CxrwzvN6Ekt0rsISfzh5XrA=;
  b=Xh4Vy0inRTTplAjb2bsXIH3kX3HB8yHSj6RJ1apU4DJDgrveaGk3rMUh
   rJdGJT4eSf5JcrZ+e7UXFw50dJdyGspMHGcneTzHuYcNxElDuabt+qaFv
   uN28umni52jlPlf9JZ1UtQHWmcenK5dYdijgs+Q58+rOy/f0sLiYhkZV4
   P40NN/U4JGDb9MZHXGWKpZWmE33NHPMA7jCFOw8e+M3eUHqSs8JSqSAv3
   lyST4e5ZOT9jljbQ3ff49r5nWW9bCKoPkfCZN6pCp52DhrQOQ5D0jZpc8
   EBFdoRRz5qAqZwOu6A6/CCIO7sWKjcsW+pCXZB2FfLS3PU1Ma6bLukDYg
   g==;
X-CSE-ConnectionGUID: MQcg4tsmRdasLg+8NmCZrA==
X-CSE-MsgGUID: a4yGjDZ0TJ2KukVwJOV1eA==
X-IronPort-AV: E=Sophos;i="6.13,237,1732575600"; 
   d="scan'208";a="30780747"
X-MGA-submission: =?us-ascii?q?MDF9INvXSJtcvfFYDGOg35CcitGa7LyRuAUv3r?=
 =?us-ascii?q?8/h2UcxOEQDEwHmv6KfQFwkEHsp9+yc0nx6bcmhhomMVQWeQEGzRGP/x?=
 =?us-ascii?q?ODjDPMXSC9m/e7YxqJhL44oL4Ix40Qh0sGRZjnRwmU9Xp29/Sm67/Ogr?=
 =?us-ascii?q?UU/b9ru5Y2M4/i+cAfxNiLgQ=3D=3D?=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENdvjzBmNm4Ugt3b81/uw8p6HCYIRQcAS8J75S10n+1b1UntpGSn3FksIlROpSuKzca5pRuGmXZsk7RG8BzewUKsJHDOz+fCunnEp9DRGBI+gwK0ifT4763EGlLk7BZfq1GwnMza8TO1kSoNZjg/ZLb5fisDfSkq6I9oRzXFAQpquuycdSVi4dYnwD4ZuVykySUtYq8H6OgQM5Kz+A4JCztVOVnBX5NQ4mw8yPGAPQCTW8IwXnfqBZf81C9HJwalvZ7CYw1jRAXNY/9DVkGnYdHjfThaRt2wH1Qrr+Xh77ea/EyoNpmkiSfJTbAsBdOo80pcnikSKauwsa/82xaY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBWPPFO0UvFY6u15cvi/CxrwzvN6Ekt0rsISfzh5XrA=;
 b=UOvy8QeJSTuJr5zpPvRIzNjb8SbnH3WyHefoKbn9HqQ2kl70OHbQr9uQREKWpkAg6WcNrkzA1g6v65rfHkhcoBw0gs+G8eqsBkPtc53QSGjq3VZ3BRzSndOnHo3OhFmYvHuHzqTXuwfccvhEML27wW0w8hBI3j93ZhjKoLUvG3ELo9wgzeIyRlpqAmc3+AetX9dZxXizRM5LNTneoIgSIk6+G/qDc5GADUYIj3tN+cozHgN/AE0flGqMXL1kyh5wNM+Q7FOlzfpRNrqoGrZLbbKJBj1XOY+poU7EjWodNfK7Lqd4TsscSvy1Icgw+oF2SgjjmU6czMjVGMIddCyd5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eviden.com; dmarc=pass action=none header.from=eviden.com;
 dkim=pass header.d=eviden.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Eviden.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBWPPFO0UvFY6u15cvi/CxrwzvN6Ekt0rsISfzh5XrA=;
 b=N2YbzI1KT9FQBO243bnWY/3hHObgwqtFvQB1lYbeMZUKJlLXOwyLFwuZkLbWqKrIrlxwSe1b1bCv48E9r768IHumLaa6uc7C0RNMqqUriiQarLb3MyO/4RrAQRTRCSAgMYjoa1bYaokUCNn7fXHOvkFApVKhCnyvB5XU8nxjP1goWz/uFOOkQSI41brF6aFYygDkYd8PR8V5RsryIUix/keS9V2g0y73yW28dZ+OgVT5mSgYDntVd0zAqKIhMUzUHkXMNOKuLnfAYFK6mq7R9gXt6jxaTSMOul297ezrtjq4oL9KpaI4xXMtHJI2zM2DR1zUoJNd/N8eIz/HO/w4Fw==
From: CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Yi Liu <yi.l.liu@intel.com>, Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>, Anthony PERARD
	<anthony@xenproject.org>, Gustavo Romero <gustavo.romero@linaro.org>, Jason
 Wang <jasowang@redhat.com>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <graf@amazon.com>, Richard Henderson
	<richard.henderson@linaro.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Bernhard Beschow <shentey@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
	=?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, Alex Williamson <alex.williamson@redhat.com>,
	Paul Durrant <paul@xen.org>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?=
	<clg@redhat.com>
Subject: Re: [PATCH 1/9] hw/sysbus: Use sizeof(BusState) in
 main_system_bus_create()
Thread-Topic: [PATCH 1/9] hw/sysbus: Use sizeof(BusState) in
 main_system_bus_create()
Thread-Index: AQHbb1TlTWpZ6ZKzUUKEk8GitOblK7MqKIQA
Date: Mon, 27 Jan 2025 06:21:00 +0000
Message-ID: <60e3f83b-86b4-46ed-83e0-aeece041320d@eviden.com>
References: <20250125181343.59151-1-philmd@linaro.org>
 <20250125181343.59151-2-philmd@linaro.org>
In-Reply-To: <20250125181343.59151-2-philmd@linaro.org>
Accept-Language: en-GB, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eviden.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR07MB7602:EE_|AS1PR07MB8406:EE_
x-ms-office365-filtering-correlation-id: 92b26b1f-7e4a-404f-510c-08dd3e9ac4ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TEpmUnZBaFU4dHJOcFByRkw1bldwcjh1UEZ5R3NPMWVQZXo0WURBR3JBSlVt?=
 =?utf-8?B?SDdGMWhZcXBnS1pQTWpKV2FVMmNxdlVhdHRjZDhucys2RW41T2d4a3B5R3Ex?=
 =?utf-8?B?L1VpdmhsNloyRzgvb1FnbldMbU1hUzNabU8yT1pwMXFIcks4cWJPY0pQcFdO?=
 =?utf-8?B?Si95N25oRm9OdzJYbklQZlVIaG4zR3BFWGxYTXRKMWVBeDlzKzBBTENpZERM?=
 =?utf-8?B?cUlmeWdPSWNTb2R0MmU2SUJZVGlHeVRHalhBajdrS05IcnByWjNYZWZxSVlZ?=
 =?utf-8?B?QVhyM00xcjhTVFdEdUtNZ0UrVTdqUXhkN3M1a3FrYWxicmtBeFBBeHE2YlZM?=
 =?utf-8?B?cVdwTXRDRCt5cVJDU3BPeC8zYXRvd05vL3VHQVl3UVB6eTVOQnhBSHJtaENV?=
 =?utf-8?B?L2k0ZjUvbGR2V3NUR0NVQUNwMXo2M0hKQnBZSzBaT2NNNnBuMWE4aGRLamc4?=
 =?utf-8?B?MzF4VGdXV0pGMXF0bndQOUx2VEpZWXQrejdZSTl2S0ZGa29lSEQwcUNYVWdi?=
 =?utf-8?B?M3pDeEo0R0dVeFF3OTdWUkd0OTg3bG1nR2dWMFFhdTFBYlhaTGJTQzdPSUhp?=
 =?utf-8?B?THRWRE9hM09VNWNGNEF5akZJdDFMaWY3WFliZ296UEt3RUR5dERBaVNxMFFk?=
 =?utf-8?B?ZERiQXRJVEt6Zm5aUTFoQytsQ1NmYWNUQTFrRWNHWURrTy9KT2VUdWF1bDJU?=
 =?utf-8?B?anNSV3BjMlZDRWYyQU05ODZPZitKZGw1a0l4R044MXY2UVNVN3JEQTFKTGtt?=
 =?utf-8?B?M1g3OTlCbEMxNzluaHZhdTBLeUlYWmNucEFLL3NXaHlpT2pFMDJsMi9hVHlU?=
 =?utf-8?B?Uy9FaElnL0IyQy9MSVErOWdMeWNuWHBoaFBSUWtGMSs1ZmwxQ0lsMnlsV1hZ?=
 =?utf-8?B?RzZLYmFqVmZaVlJ0ZnN6SHorN3VEZTNhVUl2cVo1Sy9kcEdETWpMSjMrOFVE?=
 =?utf-8?B?bTJtdG5BSFNKRWJCR0RyOUtUQUlldFZrNmJPTGgvVmhldEMvbk0xOGlSaXVt?=
 =?utf-8?B?czk5N09yLzZ1a1plRnJ1NWRqM3RtQ1VubHJ0VGRFZzRnTFRYUnlacmx0blAv?=
 =?utf-8?B?c0hQZGVMNnpVYTZsQi91NU1oU3B1SWZBMGdIVCtZL1ZkaWl4QVltU3VMZFFp?=
 =?utf-8?B?ekZWeU4vayt2by80QStvaFhRYlJEQ1pWNzFVUjA5V2VQeXlGSUtLY2tHNVRj?=
 =?utf-8?B?MEYwdTFqVGh2QURkUmFQWllDUjF3TmdiVFJhNUxOZ3RKand2UlZobjFvY3Br?=
 =?utf-8?B?eS9meG5yZmZnWEtJUzhGWTFhNkFQZlJETzBqKzlvY2ZuaWJmZ3RUM2NWUzho?=
 =?utf-8?B?WkRxbTM0WlV6YkNpVGU2c0NSVDlGcUpseS94c2NPb2EvK0dmZlY1cWpkSTJW?=
 =?utf-8?B?Mi9xc2Z4YUl4OUhONWtRUzd5NDNRQmZoSTJQQnNSSWVHamtSRUJOeUtMRXFp?=
 =?utf-8?B?UUxlM3J4MXQ2RmhPR09PQzJuZWtlMDlUQ3ZJdmVJRWR0RzFtL1Y0UVo5R3JJ?=
 =?utf-8?B?bnJJbzcyZVFvZlNPNnI2K05Vai8yY2JkQ21YZW5iM2p4NnE3aTNxd2tBYUJ5?=
 =?utf-8?B?VC9LeU5KRThSajR0cjVKdHk2NGN2TVVpNnBycGhRbXhObjN4LzhSclVob2sw?=
 =?utf-8?B?L1c5azBqTkVkOEZHZnBwYm5Cbkl0dEFXUXZNQUhuQVdMaGFsaHR6UmRGMm9Q?=
 =?utf-8?B?QkJXcXZZTlZOdHdsUDNvMlIvK2wvbUcydktYYXQrc1Mwc1JiTmRlR0RHckxk?=
 =?utf-8?B?eEtMa2FSWGxYeXJmd2gvL0FnN0QrSEJhUnVoaXhUdTkrdUdFL3gyQk54aUhT?=
 =?utf-8?B?VGsxVjN5RXNmY3JaY3FWeW5kdkIwWGJOOXlaMnQ4aW90QXlpUDZ6UGpEcjNy?=
 =?utf-8?B?UlJWMEFPMVJnWGJMb1BFbGJ4TUpmT2pTTmZxQWlMUUcyZGFpVTJ5cWxrS01C?=
 =?utf-8?Q?FqpeKG/L8E4ilct7KxFmkESpkpqAx85I?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR07MB7602.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dUtuT2QvUnUxS3FRWEh0c29sYXAyc1R3azJsZzlHbUs4c0d1Zm1PeFZsWFY2?=
 =?utf-8?B?NDVIK1pUenZUR1pnVTFRNGZJZThFcXdNZGNWb3RIQjJRdmFOVFU1SVEvVzFs?=
 =?utf-8?B?UXFXeGJNRUlwWWViVlNwUWMxZlhPWFlNdVJRZW9FM1ZyU0kzRmVpaWF3NWJH?=
 =?utf-8?B?aGJVYkxudDFhUHE3V0JNcmhpcFFyRjVKQUxaTFZtYi8wS2FyT0ZGYktNN3N4?=
 =?utf-8?B?OUdhY25tbFNMb3RsbENMK1lKZ2hyU2dMTHlZNzkva0hmT2d1dElyT0NST3RR?=
 =?utf-8?B?S1hySWExZHB5NXpiVG9NaTBEOFo1ZUYrNzJhSzhWcDJaRXdWUHJNRVB3alor?=
 =?utf-8?B?Lys3Zm5ScGJ3ZDJNSThyUktmQytlcGZ5QU5SZjB0czluWWlpbnZhOGtNcHND?=
 =?utf-8?B?cVBLeVJyS3VaZFNpemFmd04yYzMyNG9zRDZEZ1pITlRRSGpJUkttcVZYY1Rm?=
 =?utf-8?B?QTB5dE4xWGpLc3BjQzkyY1VQRitrVzdvMmRyeEx5ZWJ5L3BTSzhzQklRTjhk?=
 =?utf-8?B?ako5SEtVaERDNTVkaWZUZ1E1WDd6YVljWmpZSUJjeGMrY2ZOUFZycUU2QmpX?=
 =?utf-8?B?YmdDRTg2Unp4eEZRRHM0T1FPQlgrWGhRdnhOQWJtVTRZUHp0RnIrbkowWlVF?=
 =?utf-8?B?RW43TnkzUytHWWdSY1lkV1UxbC8wemtCY0Y3YTZveE00MHJJUXNnTVlQaXlJ?=
 =?utf-8?B?YjRtVUV4UkNqSTE4TFYzR2JROHVNUnF1YXI0dWIxZCtuMko5Uk0yczloM29j?=
 =?utf-8?B?a2dKZWxvdVJhQm5oOU00TGxkTW9GbDVQUCtaSEdGWjJwcEJ1UUZkR1V2MEhQ?=
 =?utf-8?B?cldmTUp5VmhGRnN4WkIrRTNOZkhKM2IzVXc3Q0l3b1RSdHd6YlVQSXRsTnVM?=
 =?utf-8?B?T2ZwWndCa1FncDdoRmdBbSs2NGJWcnE0RXRlbkdua1lwenhuRTJXYlU0Z1Fh?=
 =?utf-8?B?aGU2WnplVVpCTDVuR29FQmN4STdKaWpRVnBtS1FtOUlyNFNaWUtTazFPMEZS?=
 =?utf-8?B?UlM2QXdtMUR0WkN0MmF6SUxITllSZVRnUUtUVmdpbGVoQTNPRVJ1Tm1QckI2?=
 =?utf-8?B?bGtXRjV0T3FxaXBwazNTa0RrMmlvUWFLbGFsVi9JWmF5RVkrcWhEZjVDaVJG?=
 =?utf-8?B?YkZPcERpL3R3NzR6WE5BTjFLYTlYZllpV0FOZTFOTGhEZW81OFpCSVZvREZx?=
 =?utf-8?B?UDRzcVRQNGpvVTdiRmtlenFNSGpRdXFsakRCbFMrZDZYZjhRSnRBOUgvaW5V?=
 =?utf-8?B?d2REaHY2Y05HdW96Y2JKRFo0blFLVGN4V29NWlpiMmI0OTBzNllXTE5KdDlF?=
 =?utf-8?B?WXFFK1VBZWxaakhZOTZhOEJLd2NDNlZEVUphbmE3Mk1KTEM0QklIT0lCYlBp?=
 =?utf-8?B?bWZaSDRHZzJoN3VESVJ2LzR6VE5LMWdqaXkxRGVuelFmanRiemRPMWNmYkFz?=
 =?utf-8?B?aDZWQldWWFBlYTVxRTMzVGtRbitDZ24rYjZzY04yWlNUazRnRi9Qc2xpRlBI?=
 =?utf-8?B?dy9oOGF6bVgzVUF1Y25VRFY3djFUaVhJY1QwSERyclY4Zm91REU2bElZbncx?=
 =?utf-8?B?OWFKUW9tOE5lSGpYVXN5QVE2WThvSXFiSHdPWVNsRU0wYXhxMEk2bU1lVHlQ?=
 =?utf-8?B?Q28zMEVPOEc3T1NBYzJRZmNyRHJ4T2xmNHJxaFViSkErclZxWXRId0xuRXhK?=
 =?utf-8?B?WW10TENyckxPWUF6TmJGL2ZXS2cxTm1Lb2NjS0N6Wm5WUXFzcHV2YTRPZWtk?=
 =?utf-8?B?b0VLTnBOeGxuRUJmcG45bHJlamdDK1NDM294clJjcXM2bENqdkhWY3dtZzFw?=
 =?utf-8?B?Zk5GbjlwS2hUUmc0SitWbzVHWDhBa3JJTE1XTUczVkJrV2ZZY3RBZjNJYVU2?=
 =?utf-8?B?amc2c3FjNS9WRFd6Q05WNzBqODc0clhGVjRxMytQSU5HZWtWUmJJdHNZR05Y?=
 =?utf-8?B?WU50eU92VWduWDg2Sy9SWm1UOW4zUUV5dHpWUGFkSUJPbllvZTJpSmJGTlZm?=
 =?utf-8?B?cWlOTUVOUkhna0U2Q1VxbEFCY2p5S2ZncDZaT0hFWTY1c3FrSmpqNGppUXlr?=
 =?utf-8?B?ZmJoZTE5MFFBR3VVNVdiaVZsK05SQmd6ZDBUclU0TVRNeHNVVm1Ba3BGMXM0?=
 =?utf-8?B?Y0xpZEpydlU1OHR1NDFZRXdIb0dTTFIzMThQV3E1YlZNeG9sdFVQc2VTb1FG?=
 =?utf-8?Q?zWSnE2rCifM4fd9zmz/CwPQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EAFB3DFC8B738F45815879BF172F61B2@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eviden.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR07MB7602.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b26b1f-7e4a-404f-510c-08dd3e9ac4ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 06:21:00.1535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7d1c7785-2d8a-437d-b842-1ed5d8fbe00a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BJwor35OEtu/AdmwS+e4eVeFIbmoPVo+oGFnQq62aCZhotU9XNniuiOdfjdewesnFRCM3wwJpA7jbTh2hyDxaseIZollK3tsMFoBfZ/TmiscU3bmtyCaS7Adl5Kvz6lO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR07MB8406

UmV2aWV3ZWQtYnk6IENsw6ltZW50IE1hdGhpZXUtLURyaWY8Y2xlbWVudC5tYXRoaWV1LS1kcmlm
QGV2aWRlbi5jb20+DQoNCg0KDQpPbiAyNS8wMS8yMDI1IDE5OjEzLCBQaGlsaXBwZSBNYXRoaWV1
LURhdWTDqSB3cm90ZToNCj4gQ2F1dGlvbjogRXh0ZXJuYWwgZW1haWwuIERvIG5vdCBvcGVuIGF0
dGFjaG1lbnRzIG9yIGNsaWNrIGxpbmtzLCB1bmxlc3MgdGhpcyBlbWFpbCBjb21lcyBmcm9tIGEg
a25vd24gc2VuZGVyIGFuZCB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPg0KPg0KPiBS
YXRoZXIgdGhhbiB1c2luZyB0aGUgb2JzY3VyZSBzeXN0ZW1fYnVzX2luZm8uaW5zdGFuY2Vfc2l6
ZSwNCj4gZGlyZWN0bHkgdXNlIHNpemVvZihCdXNTdGF0ZSkuDQo+DQo+IFNpZ25lZC1vZmYtYnk6
IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICAg
aHcvY29yZS9zeXNidXMuYyB8IDQgKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9ody9jb3JlL3N5c2J1cy5j
IGIvaHcvY29yZS9zeXNidXMuYw0KPiBpbmRleCA5MzU1ODQ5ZmYwYS4uZjcxM2JiZmUwNGYgMTAw
NjQ0DQo+IC0tLSBhL2h3L2NvcmUvc3lzYnVzLmMNCj4gKysrIGIvaHcvY29yZS9zeXNidXMuYw0K
PiBAQCAtMzIzLDggKzMyMyw4IEBAIHN0YXRpYyB2b2lkIG1haW5fc3lzdGVtX2J1c19jcmVhdGUo
dm9pZCkNCj4gICAgICAgICogYXNzaWduIG1haW5fc3lzdGVtX2J1cyBiZWZvcmUgcWJ1c19pbml0
KCkNCj4gICAgICAgICogaW4gb3JkZXIgdG8gbWFrZSAiaWYgKGJ1cyAhPSBzeXNidXNfZ2V0X2Rl
ZmF1bHQoKSkiIHdvcmsNCj4gICAgICAgICovDQo+IC0gICAgbWFpbl9zeXN0ZW1fYnVzID0gZ19t
YWxsb2MwKHN5c3RlbV9idXNfaW5mby5pbnN0YW5jZV9zaXplKTsNCj4gLSAgICBxYnVzX2luaXQo
bWFpbl9zeXN0ZW1fYnVzLCBzeXN0ZW1fYnVzX2luZm8uaW5zdGFuY2Vfc2l6ZSwNCj4gKyAgICBt
YWluX3N5c3RlbV9idXMgPSBnX25ldzAoQnVzU3RhdGUsIDEpOw0KPiArICAgIHFidXNfaW5pdCht
YWluX3N5c3RlbV9idXMsIHNpemVvZihCdXNTdGF0ZSksDQo+ICAgICAgICAgICAgICAgICBUWVBF
X1NZU1RFTV9CVVMsIE5VTEwsICJtYWluLXN5c3RlbS1idXMiKTsNCj4gICAgICAgT0JKRUNUKG1h
aW5fc3lzdGVtX2J1cyktPmZyZWUgPSBnX2ZyZWU7DQo+ICAgfQ0KPiAtLQ0KPiAyLjQ3LjENCj4N
Cg==

