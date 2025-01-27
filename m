Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFBEA1D0D6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 07:16:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877414.1287552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcIQL-0000JQ-8E; Mon, 27 Jan 2025 06:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877414.1287552; Mon, 27 Jan 2025 06:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcIQL-0000Ha-5L; Mon, 27 Jan 2025 06:16:41 +0000
Received: by outflank-mailman (input) for mailman id 877414;
 Mon, 27 Jan 2025 06:16:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50Ot=UT=eviden.com=clement.mathieu--drif@srs-se1.protection.inumbo.net>)
 id 1tcIQK-0000Fc-8G
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 06:16:40 +0000
Received: from smarthost2.eviden.com (smarthost2.eviden.com [80.78.11.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44e027c7-dc76-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 07:16:39 +0100 (CET)
Received: from mail-norwayeastazlp17013076.outbound.protection.outlook.com
 (HELO OSPPR02CU001.outbound.protection.outlook.com) ([40.93.81.76])
 by smarthost2.eviden.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 27 Jan 2025 07:16:36 +0100
Received: from AM8PR07MB7602.eurprd07.prod.outlook.com (2603:10a6:20b:24b::7)
 by PA4PR07MB8792.eurprd07.prod.outlook.com (2603:10a6:102:266::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 06:16:34 +0000
Received: from AM8PR07MB7602.eurprd07.prod.outlook.com
 ([fe80::fbd7:ca71:b636:6f9d]) by AM8PR07MB7602.eurprd07.prod.outlook.com
 ([fe80::fbd7:ca71:b636:6f9d%7]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 06:16:34 +0000
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
X-Inumbo-ID: 44e027c7-dc76-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=eviden.com; i=@eviden.com; q=dns/txt; s=mail;
  t=1737958599; x=1769494599;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZuB3GVDozJSI7pCxie25kgndB6UvnNq4/Dn3MVNxXx4=;
  b=TzeNtGhNYqTzrVAuo0R55HiVXR/SD9kXlnssGsaivXXZEYZpvJybpmqp
   RDI6NGj/NpBbcpvRb6jwaF61QtMPxzlDkcwj41QOyEKxCLSIiQXT8yPcG
   9yIYXwht34znyCNeGCo5l8NkuLeDUFAreq2/fCmVkrFztdSjwC1ea9+X/
   772E3amKItE1P58Yt1ok4tXQ7rIvlhMsp1WYfEo7TEuR5UDZx4ivx8ZWF
   cLKnqq1e0evSKSwcRCWCgKKpxKR4ImEq716eHQJ5hNSC/xMCILFqotkWI
   hsIBdwxu8aFA01OjEJ9IgawE8bznKhQRBZrGlyp1nozLF9wmrh2zQwPTK
   Q==;
X-CSE-ConnectionGUID: qlCZPluoSIOh56DW9vb5wA==
X-CSE-MsgGUID: xtk2aNF7SDq2L/2PKSDNHA==
X-IronPort-AV: E=Sophos;i="6.13,237,1732575600"; 
   d="scan'208";a="29554823"
X-MGA-submission: =?us-ascii?q?MDFVhE38eoN/gmxjnVP+BLfT6QARUTGmirq1dx?=
 =?us-ascii?q?E7Oh3L5am7ic9U53z1Xw/XmMFZTVfyv5AQYFq4BuU2ja0G6IJZ6FnM9k?=
 =?us-ascii?q?gODZxNm3NRNY/KuWLPDdPsaRGBOromQ+74hQHPOGN5J4kHU7fPJmwaMb?=
 =?us-ascii?q?GATONuA7+U9whRQkkiRV0Ezg=3D=3D?=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MW8CTeX9Vx2l1h1iXak8XxnmrfjXhOj1p2mrSLGWHNpZqMSAKjR/OmPuoAiCDhqOwB2nXbdQ8GCvzwrD6KHvPYdRtCQ+JvTVqV7q1xrWtj0qIpyolvA+EnZwnieAzfWlq0YBXYSTjwFESiyKiZl3loghoVTJsmiMer6KnL4AUEM0gAQG7bxObVEH2m7H6fUExfwXr7eO9i/riRgIuUBouUjtxn7PlqWBgAv++uhGzLulvLVdqVBAoLyh19kFdBR7AUMljlnPecdKkrtDD/dFiZje93g81RszS86e3gjNY9qbzPuiBMu0xL+wa/JnP3gok/OJWYDhgdnxaVWHUmBhFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuB3GVDozJSI7pCxie25kgndB6UvnNq4/Dn3MVNxXx4=;
 b=pZ515OYmfBOFF4KaS+CDv78qS0hBz8etVwK/6ppAfHhAYBqW4ru4t16zpoRIDtHbo55AExm3BPzKaCY6xSdpxhCT/4s764nF54UzpbnxLjwyzJlyczSyq/24WA+hQhCiXYmoyYgd0Ys5Fdd+tzGMmLZh6Q7k+cAFIrupNdoC1G09OgafsbSWYuDp0mkM3wzBaTB8el+jtxdikw8b4Q8SepNayqR50THFzE1CtmvsAX2YFzX9ATapMVJKxuyn73tv3aXl57OtjQvYZql1HDNMoebUB6fq8nzv8LAv48UtCTpVF0PYLTSAI40rxRAo0TCXK1hRdzKtkAkjlXMHGs5LzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eviden.com; dmarc=pass action=none header.from=eviden.com;
 dkim=pass header.d=eviden.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Eviden.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuB3GVDozJSI7pCxie25kgndB6UvnNq4/Dn3MVNxXx4=;
 b=gc2bsSe+8K0O/JUFDnJjVpuxCWmlf+AeCApVhRSIZh4SHzraJECQxUMyEedhjvxArEAKplqYjojmyfsIRTJl2nf09z6ks9NQvyX7i/1kmZfAP5NhroUm7eyx+1+TKqhgr+qjYuehtmTuQhQLTON1CwD1MiWhqSpZQvO3Y33mCHyPs/DRdd9ugWtzJreGLPqssRnP3VVUQN9fsIdl7YQfiBibx1S2NdQoP22FnFrkrTxioWu1A/NFPsCfvln3dU6MEN38i+lLA2uqfY4PWMdMBZn4+biv9ad4RL8G74YFy7FMhvL/lpghzoZcXsLkKlUiuoytXtvUgcmgZBVutmcKjw==
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
Subject: Re: [PATCH 8/9] hw/tpm: Have TPM TIS sysbus device inherit from
 DYNAMIC_SYS_BUS_DEVICE
Thread-Topic: [PATCH 8/9] hw/tpm: Have TPM TIS sysbus device inherit from
 DYNAMIC_SYS_BUS_DEVICE
Thread-Index: AQHbb1T72ko97KtHNUmqqgt4c41qN7MqJ0iA
Date: Mon, 27 Jan 2025 06:16:34 +0000
Message-ID: <993fb62e-c6c6-4137-83fb-bd2a8bc4b992@eviden.com>
References: <20250125181343.59151-1-philmd@linaro.org>
 <20250125181343.59151-9-philmd@linaro.org>
In-Reply-To: <20250125181343.59151-9-philmd@linaro.org>
Accept-Language: en-GB, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eviden.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR07MB7602:EE_|PA4PR07MB8792:EE_
x-ms-office365-filtering-correlation-id: 37f873cf-4453-408d-b4ed-08dd3e9a2686
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UlNnOEpxS0dqQ1pjV3ZYTnROcmxPOTVnK25wM3ZCSVdxNUZWTkpHcW03Q1p5?=
 =?utf-8?B?Yk1DOTEvV0xNYjMwZDNFMnJmdUM2TVNNQk12UTVxWmxTcDZOcXZ0WjVYVVZo?=
 =?utf-8?B?dGtYUDVKOUx1ZXZCa1diTzcwcW1vQ3FrL2Rlbm53U3E1eEgzQmdOMitVcVJE?=
 =?utf-8?B?L1ZBdUNhODRza1Q4NlJ3eEFYZkJXZkZBZ1lJNGxCNzNnK3BwbTFYcXdsNlEy?=
 =?utf-8?B?bjRpTEFZR0lqblBsdzhGMmVLN0xmZ2Q3QkxPRTlienFkYmEvQkNkalJ5enB0?=
 =?utf-8?B?L2NGb1dMK2hvOVc4c293MllYTURiNWlHUmd2aU9nY2lOVUFndy9UUUV0V0lu?=
 =?utf-8?B?RDB1WGllOHlUMkhJUzdPRVZjU3dDWjlpOWl2a1ZRaEw1VTRjV1JSaDRwSGU5?=
 =?utf-8?B?Y3dUVElSZVA1QU52VmRNVThXRTRld29NV0o0NnFWR2FjS2lMWHVtdkt4NllD?=
 =?utf-8?B?Y1Q5aTJCR1RxdTd5Y0xNaTk0R0w2RjU1TFB5US9nQmFoYTRrc05kditSb1Y3?=
 =?utf-8?B?b2t2UEJIdUtKUDN5UkJkeVdFQkJMejhUK04wVGhKUXR2RW9Uek1Pd1VJSUR5?=
 =?utf-8?B?VGQ2b0haUmlEMXV5b2c1ZVJLaG5WRmU1YnlZcGhlaTBBeThXdFQ0S2ZSd2U5?=
 =?utf-8?B?eUhNRjMxWkw0ZTNYam5nM1BtSVo1WmVGR09YTUFud2R0RnA0eVprT0Z1eUhQ?=
 =?utf-8?B?L0J3dEFxejVONVB1L2UwVElvUWIrVU96dDVnY1hwTHNmWWZZdDY0Wm9aS0F1?=
 =?utf-8?B?QithcFVTa0dGTnBjK1F6RUwwZ1dsWUs4MHcxV0h6L2JHcEJtT1U2SlU1YkFi?=
 =?utf-8?B?Nk1QSGowem1YUjdnS04yWlJmOVJkaER2NFF0REpOT1dBbnVFam5WZlFBR3lT?=
 =?utf-8?B?WG5EbUNTK3F1TmVvUFRXS25MQVNodlQyTHpoejhyd0s2ZkZ3N0g1NldhU243?=
 =?utf-8?B?YkRnUGs4bjkyMVVMMjBreGQ2S29ubDJqNTkyZUx6Y0N2MWNHellMeUJ1NG9S?=
 =?utf-8?B?Z0J2aWlwcnIxaUtRZ2pYYklJNEtUUWk5KzJIM1FRcnBTQnpSeThEQlN6N1RZ?=
 =?utf-8?B?SFVrL3NGRVBZb2Z0eWlXNHVZVzkyRkJJYy90TDZQSS8weDVLcGorL2lUVTZK?=
 =?utf-8?B?TEszbUlpMTl5VEdIM3hHMk43djIyM3hIcHgyQVhRb085UkNwd3g4RnBBRFU3?=
 =?utf-8?B?cUVhMVlicWY2eDdLMTl4cGtBS1BRV2hQMGY1aG5ZYjZWbmx5QUpCSlpoMDdz?=
 =?utf-8?B?S1dzMUVNUExjK1pvOTl5Z05HZDNXWWlYMmwrYnltU0RibU5NQW9uYlBWWTRt?=
 =?utf-8?B?SW1rOXljaVQzR05BM0E4Vmcva3NLVWVQZ3BJVEpOL0NkeWVWenFpWlVxVmZ1?=
 =?utf-8?B?ZEVzeGQrU0JVUHBRb0NTVkt1VXoxSTdwK0dmMHl3bTR5VG92MDd5WW8yZkFu?=
 =?utf-8?B?SUJoKzFmb0xqZ3FLcForU0RheVUwUWdxWlpMeXEvQW0xQjdWbWNacTcxMCtL?=
 =?utf-8?B?NGwvN0dlYjJYMVFVWis5ODQ2RWlqZVQvaFhnUXpwSFVHZG1BWktOTWFHc3RN?=
 =?utf-8?B?RW1kckNyV09QRWRNcHV6Z1NGZU1qYkNXY1Y1OUliZFNxNGM3M2JWQlp0amRs?=
 =?utf-8?B?ZEtEbU9GdmVpNFFub2x3bktrR2t5MEpoWk1sNkQwWFR2RmdYZnBoaC93VDJQ?=
 =?utf-8?B?bEsrZllENk1LN2s4VFNMMFplUmpiSHF6M2U3WXk1bkRjejMvTGVJamtyZmRP?=
 =?utf-8?B?REZtQW5DNkdoMFdYZ1lXd2wxY1U3MHhSVFVURFR3T1VrZE5BTUNyOXVvemQx?=
 =?utf-8?B?VUQ0eWZyYUZlRHVRWVZPUUQrMmV4cEpWMWU0RUtTNTEyK3I5Zml2UnQzam4w?=
 =?utf-8?B?L3ZGdE1ZL0JHWVZlQTBlY3BHSGxQZnowM0d5ZEgwd0NBNnRla2dWVm50MGtm?=
 =?utf-8?Q?hArTRr1WoS0ZyT80E2aioHrFupePz3Lz?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR07MB7602.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eVY4MlNneUFTbTkxUDNrYnNWZy93UjR5Yk81ZTNhOGVCTjZFWG5LOTZlMDla?=
 =?utf-8?B?NlJWSDRaTXp3UGRGa3h3WFkrbGlYbHFmcDAwc0xSRDFLSVZvWkprZXRWVEtV?=
 =?utf-8?B?dy81ZVpBaDRtUFQ2eVIvbXZENmRWeUdvcmtlQitmN3YyVG5WTWdNVEJDeHlt?=
 =?utf-8?B?c2VBdGo2SjVGUFVuTHVndGNod0NXYjVDcytxdjVTOUx5SWQrYnlkMTUrc1By?=
 =?utf-8?B?TmdkZE9Kckg2U0JnR0h3aVJoS3BMbWpVZHhNQjNBWlVJYy9VVkgyVXd4S1FD?=
 =?utf-8?B?bDBSM1NaMkNkUHdnTEFsOU1sM3ZVd1dWckt5ZVRPdkpZR25kenZPMW4rOE5q?=
 =?utf-8?B?ZGN3RXZ6ekQ5RFZhUVdXclN6b1haNmVITWdtNkd5OVdDejJMUjFBOTBwb3ls?=
 =?utf-8?B?UjZqeDg0U1Vlc1ZkTXd6aENkckwyOG1Xd0YwemJ0Sjk4MDdZb2pxSkJFVXdB?=
 =?utf-8?B?Z05hTEF6R0lBQWdCWUJ5eTBnMUwzSkdxK2xCYXJiaGI1bFN5VkNNWHRlS3BC?=
 =?utf-8?B?L2Z4SHQ3NHQvamRtcjVTbm01dGpKYm1INytseVEvSGN1MnNEdm5PWEpqV3ZQ?=
 =?utf-8?B?U09nanhTQ3lXeVRBc0VqUDZxZ1Z3NG9Ucmp5QmR0WHVrNU4rR1QwU1BYNTF2?=
 =?utf-8?B?Sms4WXRHNyttRFFqVEdTbnRGQS9QMUZWNWtzNnA0WFZqOS9zclNlUlUveGRO?=
 =?utf-8?B?TDlhY0tXdUQ0anlYaTdsMW5OczV4bDVodis5ZkFzUXliNFJyYlNFeGo4Q01o?=
 =?utf-8?B?VzMxV3Jjc205dzBoODRNU2xMYWVGdy9qVm1DY1M2Ry84dmgwR1dZSk1rNGt4?=
 =?utf-8?B?TVdLbDBQU3lTNTNhUk5uM3BqaWF2eE9uNFRKNG1lY0ZBNUZRSXQ3R3haeUZ1?=
 =?utf-8?B?UVROUERjRVgxRnJTcHBRczFESlBZY1MrS1lvOXBqYTZIWHd3U1NmQXJNMjQ3?=
 =?utf-8?B?ZkgwNzBNTkxzZ1ZMTjZCeERsdWp3UE5UTjI5SkhRc0xpU3k2QVM3eGRFYU9j?=
 =?utf-8?B?bjRrTWhReWlKWFRhNDVRMVNiR3VlMEhGNHpRdDFrcnhmZHFTdFZmNUJpZ0Zv?=
 =?utf-8?B?angxZWtmWmFiMzRXRVM5WWR3anl5N2xrZFl3WktZaWo4V3JxeklLNEdGS2pK?=
 =?utf-8?B?S0laNWh5cG9xTkswSnZxQkFxYWJJc0syczFzMEtieWZpL25GSndtcXhzN0h1?=
 =?utf-8?B?VkgvM1FMRTk0K3hJR3lIazhPRytUVXEwZzdYbWhwR1dsUHJiTm5SK3Bqa0Vi?=
 =?utf-8?B?QzFwY2Z6QzZodGJkQUw3WGZnYWw3YzNuLzBEOGtjcDB1MG15K3lqS0E3V1Jx?=
 =?utf-8?B?T0tQbU1PTE9ZUnR3WVZxMks1VXdZa2Qxc0xRMDBFRkJ2Rk1kdzRvUDZ5MzlL?=
 =?utf-8?B?aU1LVnoyVmdZOFAvcU42N0gzOHRPTEFod1dtOElXS281QUVkMWhzbkxKYm1i?=
 =?utf-8?B?YnZDS21OTUkzOS9JbXdXa2tuaWxqaU01L3hCQjZPeFA3dG1NbDJKVzFQNDNo?=
 =?utf-8?B?MW5TbDlPTVBoYzNUR3lFeU9XUEdueWZIOUpQamJNZWwydXFPQUJ3M3ZXWFg3?=
 =?utf-8?B?Q3pwb0huVlQ5UjRQRDRCNmJoNzRBZytvZm90U295aEE4MFRSaVJpZ2ZtSE5X?=
 =?utf-8?B?Q2hhbWM1amg3bUhSay84RzZheG12b0VOYmRMb1lrVVVpYkgvbEU0UytXaGZ4?=
 =?utf-8?B?NEVIMFNuVlBxM1ZBNVlyT2l3WGVUcXl2VnRQVkZOVytzUlJVT2R5RklUVW1p?=
 =?utf-8?B?RUtIL2l5dndXVHNWd3NjQkdBUFpLaDZnb2NCbmw2K2RnbDFJSEdjZW9uZnlV?=
 =?utf-8?B?bGhaUGpUdjU1VUlkZzRkaG1meDVNRThrb1E1RzQ4N1d0MkFCM29TblVMR2VH?=
 =?utf-8?B?U1NrbTJEYkJzcGRHWTNTZFh5R3Q0dXkxNUY0TTBHT001UVZuUndhclp6S0Fq?=
 =?utf-8?B?NFArcDE5ZCtjVXZLTEhOY2h4bmxQY09VZEpuMDJXWXM4aHdaTVVHRmhFbU9O?=
 =?utf-8?B?RU5mNTF4ZDI4aHRqcnJiMFZhekJ0ZVAwUHVkcThKeHVJMkt4TWNnbGlpWWJG?=
 =?utf-8?B?YjBEbHVoUzNhMjJXMVNETTZjMUFVdlNhOVhMNU50TmY0OVdxRUhOUEhmTVAr?=
 =?utf-8?B?V2dxUXYvQUNLK2xGbk1xcWFjd0VHbXF6cVc0QkczVEdTaXNTdTFZbFJxVGlv?=
 =?utf-8?Q?I/spPN/roPFOvQUuqQpQcYc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5B7B009C5FA044CBEFB94E3C3BFEED5@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eviden.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR07MB7602.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f873cf-4453-408d-b4ed-08dd3e9a2686
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 06:16:34.8220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7d1c7785-2d8a-437d-b842-1ed5d8fbe00a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WedVj/OdeCFjBb9wP2R7xFmtnwfo80qp2S7jsUcYo5YPJZc2IiJWZ0dpf3KojXcB+VqjU7otoEgnvEtw3hwOg1WEEAPJ4hdlg6kO9fooBNPFwDYQkfaNY/sXFWsY3VpD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB8792

UmV2aWV3ZWQtYnk6IENsw6ltZW50IE1hdGhpZXUtLURyaWY8Y2xlbWVudC5tYXRoaWV1LS1kcmlm
QGV2aWRlbi5jb20+DQoNCg0KDQpPbiAyNS8wMS8yMDI1IDE5OjEzLCBQaGlsaXBwZSBNYXRoaWV1
LURhdWTDqSB3cm90ZToNCj4gQ2F1dGlvbjogRXh0ZXJuYWwgZW1haWwuIERvIG5vdCBvcGVuIGF0
dGFjaG1lbnRzIG9yIGNsaWNrIGxpbmtzLCB1bmxlc3MgdGhpcyBlbWFpbCBjb21lcyBmcm9tIGEg
a25vd24gc2VuZGVyIGFuZCB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPg0KPg0KPiBC
ZWNhdXNlIHRoZSBUUE0gVElTIHN5c2J1cyBkZXZpY2UgY2FuIGJlIG9wdGlvbmFsbHkgcGx1Z2dl
ZCBvbiB0aGUNCj4gVFlQRV9QTEFURk9STV9CVVNfREVWSUNFLCBoYXZlIGl0IGluaGVyaXQgVFlQ
RV9EWU5BTUlDX1NZU19CVVNfREVWSUNFLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBN
YXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgIGh3L3RwbS90cG1f
dGlzX3N5c2J1cy5jIHwgMyArLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9ody90cG0vdHBtX3Rpc19zeXNidXMu
YyBiL2h3L3RwbS90cG1fdGlzX3N5c2J1cy5jDQo+IGluZGV4IGVlMGJmZTk1MzhlLi40ZjE4NzY5
MGEyOCAxMDA2NDQNCj4gLS0tIGEvaHcvdHBtL3RwbV90aXNfc3lzYnVzLmMNCj4gKysrIGIvaHcv
dHBtL3RwbV90aXNfc3lzYnVzLmMNCj4gQEAgLTEzMyw3ICsxMzMsNiBAQCBzdGF0aWMgdm9pZCB0
cG1fdGlzX3N5c2J1c19jbGFzc19pbml0KE9iamVjdENsYXNzICprbGFzcywgdm9pZCAqZGF0YSkN
Cj4gICAgICAgZGMtPnZtc2QgID0gJnZtc3RhdGVfdHBtX3Rpc19zeXNidXM7DQo+ICAgICAgIHRj
LT5tb2RlbCA9IFRQTV9NT0RFTF9UUE1fVElTOw0KPiAgICAgICBkYy0+cmVhbGl6ZSA9IHRwbV90
aXNfc3lzYnVzX3JlYWxpemVmbjsNCj4gLSAgICBkYy0+dXNlcl9jcmVhdGFibGUgPSB0cnVlOw0K
PiAgICAgICBkZXZpY2VfY2xhc3Nfc2V0X2xlZ2FjeV9yZXNldChkYywgdHBtX3Rpc19zeXNidXNf
cmVzZXQpOw0KPiAgICAgICB0Yy0+cmVxdWVzdF9jb21wbGV0ZWQgPSB0cG1fdGlzX3N5c2J1c19y
ZXF1ZXN0X2NvbXBsZXRlZDsNCj4gICAgICAgdGMtPmdldF92ZXJzaW9uID0gdHBtX3Rpc19zeXNi
dXNfZ2V0X3RwbV92ZXJzaW9uOw0KPiBAQCAtMTQyLDcgKzE0MSw3IEBAIHN0YXRpYyB2b2lkIHRw
bV90aXNfc3lzYnVzX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKmtsYXNzLCB2b2lkICpkYXRhKQ0K
Pg0KPiAgIHN0YXRpYyBjb25zdCBUeXBlSW5mbyB0cG1fdGlzX3N5c2J1c19pbmZvID0gew0KPiAg
ICAgICAubmFtZSA9IFRZUEVfVFBNX1RJU19TWVNCVVMsDQo+IC0gICAgLnBhcmVudCA9IFRZUEVf
U1lTX0JVU19ERVZJQ0UsDQo+ICsgICAgLnBhcmVudCA9IFRZUEVfRFlOQU1JQ19TWVNfQlVTX0RF
VklDRSwNCj4gICAgICAgLmluc3RhbmNlX3NpemUgPSBzaXplb2YoVFBNU3RhdGVTeXNCdXMpLA0K
PiAgICAgICAuaW5zdGFuY2VfaW5pdCA9IHRwbV90aXNfc3lzYnVzX2luaXRmbiwNCj4gICAgICAg
LmNsYXNzX2luaXQgID0gdHBtX3Rpc19zeXNidXNfY2xhc3NfaW5pdCwNCj4gLS0NCj4gMi40Ny4x
DQo+DQo=

