Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKzmI1yx12kORggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:02:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A10B3CBB79
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:02:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277473.1562668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApww-0004Xx-FF; Thu, 09 Apr 2026 14:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277473.1562668; Thu, 09 Apr 2026 14:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApww-0004P1-8e; Thu, 09 Apr 2026 14:01:38 +0000
Received: by outflank-mailman (input) for mailman id 1277473;
 Thu, 09 Apr 2026 14:01:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wApwu-0004KK-Ee
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:01:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wApwt-009p7l-Qj
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 16:01:35 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d7b13f-2eae-0a2a0a5409dd-0a2a450ad274-0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:01:35 +0200
Received: from [52.101.66.132]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d7b13e-ee98-0a2a450a0019-34654284bb10-5
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:01:35 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA3PR03MB10964.eurprd03.prod.outlook.com
 (2603:10a6:102:4b2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 14:01:33 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 14:01:33 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4mzQz/OxV9ZzK4qNByiRxA7LFCnSRHxgN/I0V6cV5EkXJ9uBQKvxDXPw9eXBXeAEJmwTahhhjU/aPJVasuafEaY8YEj+QlDQ22pShFFByw36DoP8q8tTcbvJP4ylWgfairMu90qdp+LN0syuay/1wsdkwneVgYifjt8LEdF7O6FcVdWk13mrtZqpLVKN3NTc6M6tW7uaj2+7tzP41o3VqO54s4EDqw1PYF2REQhub5fCYUtAzBffw0itQN/F/OHK4lnaeIhWEitir9rBxrlJnt2cIyjMw9iA5qXPTKbJQJBb7ZMeIGcymHcXayjuQXT6cG6HelQ97956lmppsoEIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPQVTLxWRQ60hfmvN0+wWwI02S8IMGs3j9kDRZXC1Zk=;
 b=FtEIonZBZ+TO/K8h+BPegSrNorlxnkiMO7RVpTLUctEWL5RsxqEGB01hFYLqw0G21maoN0Jxmnj5KKPxgp2W9b9SQnhkQwo2Y/C3vQGPwEsX5vE4/JubfSS88b0U7IakCSP1C84JmJRia2+OLIb6EvhhBkjXUJQ6x2zvmjf3gRVW5WJ4Lo/f8rIxL1tz0gbkbytNZbnosT5CGM68qlgscOmdtBeI22/hxNCgxHfCxdRxwFfGl+okKcNntcEagqrS1vPrumg6ekqxISc9pL4P+Kk7Tgy6YeHDdXdpIWT/ImJG3U/S8k4WImzKKlBAuOz+eQo2snzD6bopCHdMN8AlYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPQVTLxWRQ60hfmvN0+wWwI02S8IMGs3j9kDRZXC1Zk=;
 b=V6n0mairp1qgBp982owTpF8ibdcIRKTUhc6TJNjE2mAb9m6tcOkzIpaft3p3OQOcEKQRBXj/ajHnLZnxSNjmeu8YC1rvoqCEJ8QgcIjgytRLeFWgkicc23M+55zoVCUo5q5yqsJyF8xEHNxm/qplcd7ued0ysNY3hX1Zw/CSaQshhCR5aeAlO3sE60EZbLZtlvbHrV3G0OzEA57g4UzrGNz8vsagjZqO/qGSE/b8FS5cJXu0lyTAaN00fgYy/4arCRvzm+5082xxjFH4okFTUesJz7zLKX4z8g1w9GuJeQKE+4UOIiOR39zoWsQMWHCxdhPUIHPl+SxjKdKWu5H+Iw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v3 3/7] vpci: Use pervcpu ranges for BAR mapping
Thread-Topic: [PATCH v3 3/7] vpci: Use pervcpu ranges for BAR mapping
Thread-Index: AQHcyClfMSASW2EWZE+braifNCmgUg==
Date: Thu, 9 Apr 2026 14:01:33 +0000
Message-ID:
 <51223761a1f2b8f1e901062d1e59dad934300f0e.1775742115.git.mykyta_poturai@epam.com>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1775742115.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA3PR03MB10964:EE_
x-ms-office365-filtering-correlation-id: 611f577e-c472-4751-c8e5-08de964081f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 jLMR4m5QTdjyZ7A5jFX7KutZ3xNHlx7KSFZwRfSuOdgsAye266cVXDZ2vyd6YNGg0wM9uUrQM9drY43/o6kKK/4IgdWXO4f7NdgfYLmRjtOCA3PZe7TjkqIj/6PjTj7DUFZbl28KpqA+RkeCWhYdB+hGnU79/iddN8jQfsiM/CHc3Qe7msJ0s0S9OvSUmi+3biQHtlMt6Zwz+XnmJrjomFTYgmO+oFfEggq/zAEeaafLasMWwgTbqO77x9miE5G92ThQ+tdIC5j1bMW64bwRwCfpPE6Upce5mRON/UzOYe632gg8l8NTNzPsPi8uLz3wHueoTyGg2xClkyCxynaZba+d6WmXH7EVerE9A3+D91RIYHV/CV27ydi8cwBatEMrnzILrc9WIFsLkWiQxLDPrsj/GurZYjQjzeSuhVRD8kvvEp6WMmSv2A8QS1cIz+hjvGesQnWO7iTzsFTof7BfODwBm901WM10i26gLZmACGPbyxMHP9yeYBwW0G0Df7rVuIxXcEvTjgLOHb2XDjiodjfw0cP2r9x4UT9iXGMtGwbKODZfS8Uz+lGGv9j2Le7gn9pr4dX+e9PUcVLbukECaSjtiPdqZ+98mADbz7tmKXeZhU/JWMKT17gI38V0Uopdv260U3YhT9Yz90sQ9sl6q2ouErphI/E2XD5fp2vI8cr0f7FnfHFtyFgHMdjoJZiE2r1Lf/PrCX9hJCJ782NhzrEdgWjEsAFbHHOsqzyKcY3HV9ul67oYVdo6uPSMZBz4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3BEZxaFIdID4k2Ca3BTRhz53SQPnMzUqYgM0ZuTvJiitm0/Y0V7RiJlY+S?=
 =?iso-8859-1?Q?DEbe9FCcR1gcliRNlLmvVPO91sKaAByNn65mT5O9t3/CkRMSouixSKGmuQ?=
 =?iso-8859-1?Q?G0uahcmO3RO5585+JWokCgjnAzglWMabSUCLq2DdbXYF3HDG79u4jC1oXt?=
 =?iso-8859-1?Q?XEN00igOvp+G/nSYRJLTogOHxr2WO3pSVBMJVP6VTEz4lblTO2AhnvG+YA?=
 =?iso-8859-1?Q?makkGtEe4d1TNNlrlKh2Bl9tZwZzRZpMFM4i3YEdufulv/1/d1FiEKaz10?=
 =?iso-8859-1?Q?tWAXAB52Fuh5dqKCalrcks2Bk+pApiblYVCEWT5U6MGDXutbRqkkkazZXu?=
 =?iso-8859-1?Q?Rp00JYlhgUEfIYdKF7K6WBDcGFx6FrDo1bagW4ErAz1d4f63hG43FrzjDO?=
 =?iso-8859-1?Q?NvLE3rWfxMqQlFdDyPIunVzWoStl9fHip7pkQMDeN556jNGOlsMETcLOwK?=
 =?iso-8859-1?Q?Soj/NPk4UMLxdK4XcqHUpdYUsFiB2WMH3xHjVlWKZBxKwJ3DUqJ9MVs2+k?=
 =?iso-8859-1?Q?WbrhE3nVGJAkc4fxVFXDq7vY+3dr2NfLMkDPrA9bSi3VkB3genIQu9OYtx?=
 =?iso-8859-1?Q?2UgWQy+B5ttsmI/cZ+8ctN3qL8gf2ZPdvzp8NZ2H9DBn792Hli9KlXk771?=
 =?iso-8859-1?Q?f/w1pIq0JMljdokrP7esyBb7RxLwEDqt2KRWq9Kq0gkJMyp0ParI1r1TPd?=
 =?iso-8859-1?Q?bpIjDMKj+kZzifP1/QF+v+vFL7QvhvZh5PqxxauZWHudj2pphFiCtIV/Uq?=
 =?iso-8859-1?Q?QHNIqWQT0hWsEG+Nh/8KJZKRK/VYVGxh86quyIG61mkZ0h/9qOacxe+2Hs?=
 =?iso-8859-1?Q?FRlJfMnxGU+S6TDUZVkm3gMrkBMHYQ4h8Nd3B3kyrDvvi8iAj+LeXWui5E?=
 =?iso-8859-1?Q?ajO0mRz/KhMHuWRyPNBIaOQyGcno2zXoZVGU0XRA1+GvnO28my3BtNx9PV?=
 =?iso-8859-1?Q?+AwqyFNwiGJc3tSxcsO6zPhzJI3Ysm6CjoR9qLqETTBOq0Ik7dnq3V1cba?=
 =?iso-8859-1?Q?7HmC9yIQSumH0Ar+MuxWwBIOFScTlWrAw4ht4w/hHAqBGsdCvqlEKd2I7a?=
 =?iso-8859-1?Q?vuektW+qBs/nh2Ww93Q/ASnXJueMq1Ofszg0UZAghxLXzDgD59fSfOvfAZ?=
 =?iso-8859-1?Q?aAJdE6+/RUlfOiyS+w0b6VDhdE+n29XsoKTC8xi8RscwHECEIRy2tu10NT?=
 =?iso-8859-1?Q?1g6vva6leKciAWM0TgBvfabzG9OV9bQvLdV/gUHQMNZ4SzDXATHxGC2XiQ?=
 =?iso-8859-1?Q?bmez3a7gnkxHuEvTyRNdk5GCh5ezuUDtNACUKNBSR72+4N4eYIK9afU/hi?=
 =?iso-8859-1?Q?p4SxlbC8jjOjPvdn/9fRRKYLKp1FXW+dgSx7fgB5WHwc68JIPG1MT6Lhxb?=
 =?iso-8859-1?Q?/ibqwOYW1O0uWzX7a7h3ZK3ZNBD9nMgy2DEROtTbv7TyAznr1vw3oooiRu?=
 =?iso-8859-1?Q?7LC+P/o3mJK1I/RTCMmWuoPTv7dmRLXcs6O8FXwdbSX/xZr5iCqVbxUpKK?=
 =?iso-8859-1?Q?PraCJ1t1z2RwENtzwcEJBuPT/yR5DnZ1mbDPGS8t0fwdFKT+tLGZ11wR7v?=
 =?iso-8859-1?Q?rf6rpVThtQ2sWqqshOf3dQUPxzOgiGcSLod1J5o8C5IpJMYe0CzhxnKjVj?=
 =?iso-8859-1?Q?twic3u7YWS1j0k5cUM25ca6GIQZA/JjNOj/Zzna+aMISLfh2ny7S/51P4D?=
 =?iso-8859-1?Q?SDY0UccjBZ5yZYK1PIo7ft9IiaF+3eeMweOs6hK9BvH47mwbNtfQF672QH?=
 =?iso-8859-1?Q?qgFwVZG1Zg0brHYf/jkIzyc/nBWGk5vk1kyiX6IYcsteBOTCOt+sHakhVt?=
 =?iso-8859-1?Q?hXBJimYoPCttYxonejt88GfbPaJoJV8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 611f577e-c472-4751-c8e5-08de964081f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 14:01:33.4406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rGfq3kFHgn8zDDulq8LZ5FpblFsvcYG9XHoaSxoc62tW+8PCNJZ8uzTwLig00532d2XDOKt6hyeWPCGuHzLCOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR03MB10964
X-purgate-ID: tlsNG-4011c0/1775743295-BDB550B1-0B871F89/0/0
X-purgate-type: clean
X-purgate-size: 13892
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchew.org:url,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0A10B3CBB79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykyta Poturai <Mykyta_Poturai@epam.com>

There is no need to store ranges for each PCI device, as they are only
used during the mapping/unmapping process and can be reused for each
device. This also allows to avoid the need to allocate and destroy
rangesets for each device.

Move the rangesets from struct vpci_bar to struct vpci_vcpu and perform
(de-)allocation with vcpu (de-)allocation. Introduce RANGESET_DESTROY()
macro to free a rangeset and set the pointer to NULL.

Amends: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v2->v3:
* synced with BAR write with memory decoding enabled series[1]
* add Amends tag
* remove unused variable i due to rebasing over 998060dd9101 ("vPCI:
  move vpci_init_capabilities() to a separate file")
* enclose entire struct vpci_vcpu inside #ifdef __XEN__
* s/bar_mem/mem/
* use ARRAY_SIZE
* put init/destroy in functions
* only allocate for domains with vPCI and idle domain
* replace 'if ( !mem ) continue;' with ASSERT

v1->v2
* new patch

[1]: https://patchew.org/Xen/20260406191203.97662-1-stewart.hildebrand@amd.=
com/
---
 xen/common/domain.c        |  5 +++
 xen/drivers/vpci/header.c  | 67 ++++++++++++++------------------------
 xen/drivers/vpci/vpci.c    | 34 ++++++++++++++++---
 xen/include/xen/rangeset.h |  7 ++++
 xen/include/xen/vpci.h     | 10 ++++--
 5 files changed, 73 insertions(+), 50 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index bb9e210c28..5ef7db8f09 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -455,6 +455,8 @@ static int vcpu_teardown(struct vcpu *v)
  */
 static void vcpu_destroy(struct vcpu *v)
 {
+    vpci_vcpu_destroy(v);
+
     free_vcpu_struct(v);
 }
=20
@@ -512,6 +514,9 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int=
 vcpu_id)
     if ( arch_vcpu_create(v) !=3D 0 )
         goto fail_sched;
=20
+    if ( vpci_vcpu_init(v) )
+        goto fail_sched;
+
     d->vcpu[vcpu_id] =3D v;
     if ( vcpu_id !=3D 0 )
     {
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 5d5ba5c016..5bfb541b6a 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -196,6 +196,7 @@ bool vpci_process_pending(struct vcpu *v)
     for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar =3D &header->bars[i];
+        struct rangeset *mem =3D v->vpci.mem[i];
         struct map_data data =3D {
             .d =3D v->domain,
             .map =3D v->vpci.cmd & PCI_COMMAND_MEMORY,
@@ -203,10 +204,10 @@ bool vpci_process_pending(struct vcpu *v)
         };
         int rc;
=20
-        if ( rangeset_is_empty(bar->mem) )
+        if ( rangeset_is_empty(mem) )
             continue;
=20
-        rc =3D rangeset_consume_ranges(bar->mem, map_range, &data);
+        rc =3D rangeset_consume_ranges(mem, map_range, &data);
=20
         if ( rc =3D=3D -ERESTART )
         {
@@ -224,8 +225,8 @@ bool vpci_process_pending(struct vcpu *v)
=20
             /* Clean all the rangesets */
             for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
-                if ( !rangeset_is_empty(header->bars[i].mem) )
-                     rangeset_purge(header->bars[i].mem);
+                if ( !rangeset_is_empty(v->vpci.mem[i]) )
+                     rangeset_purge(v->vpci.mem[i]);
=20
             v->vpci.pdev =3D NULL;
=20
@@ -260,13 +261,14 @@ static int __init apply_map(struct domain *d, const s=
truct pci_dev *pdev,
     for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar =3D &header->bars[i];
+        struct rangeset *mem =3D current->vpci.mem[i];
         struct map_data data =3D { .d =3D d, .map =3D true, .bar =3D bar }=
;
=20
-        if ( rangeset_is_empty(bar->mem) )
+        if ( rangeset_is_empty(mem) )
             continue;
=20
-        while ( (rc =3D rangeset_consume_ranges(bar->mem, map_range,
-                                              &data)) =3D=3D -ERESTART )
+        while ( (rc =3D rangeset_consume_ranges(mem, map_range, &data)) =
=3D=3D
+                -ERESTART )
         {
             /*
              * It's safe to drop and reacquire the lock in this context
@@ -331,13 +333,13 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
     for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar =3D &header->bars[i];
+        struct rangeset *mem =3D current->vpci.mem[i];
         unsigned long start =3D PFN_DOWN(bar->addr);
         unsigned long end =3D PFN_DOWN(bar->addr + bar->size - 1);
         unsigned long start_guest =3D PFN_DOWN(bar->guest_addr);
         unsigned long end_guest =3D PFN_DOWN(bar->guest_addr + bar->size -=
 1);
=20
-        if ( !bar->mem )
-            continue;
+        ASSERT(mem);
=20
         if ( !MAPPABLE_BAR(bar) ||
              (rom_only ? bar->type !=3D VPCI_BAR_ROM
@@ -354,7 +356,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16=
_t cmd, bool rom_only)
             continue;
         }
=20
-        ASSERT(rangeset_is_empty(bar->mem));
+        ASSERT(rangeset_is_empty(mem));
=20
         /*
          * Make sure that the guest set address has the same page offset
@@ -369,7 +371,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16=
_t cmd, bool rom_only)
             return -EINVAL;
         }
=20
-        rc =3D rangeset_add_range(bar->mem, start_guest, end_guest);
+        rc =3D rangeset_add_range(mem, start_guest, end_guest);
         if ( rc )
         {
             printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
@@ -380,12 +382,12 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
         /* Check for overlap with the already setup BAR ranges. */
         for ( j =3D 0; j < i; j++ )
         {
-            struct vpci_bar *prev_bar =3D &header->bars[j];
+            struct rangeset *prev_mem =3D current->vpci.mem[j];
=20
-            if ( rangeset_is_empty(prev_bar->mem) )
+            if ( rangeset_is_empty(prev_mem) )
                 continue;
=20
-            rc =3D rangeset_remove_range(prev_bar->mem, start_guest, end_g=
uest);
+            rc =3D rangeset_remove_range(prev_mem, start_guest, end_guest)=
;
             if ( rc )
             {
                 gprintk(XENLOG_WARNING,
@@ -395,7 +397,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16=
_t cmd, bool rom_only)
             }
         }
=20
-        rc =3D pci_sanitize_bar_memory(bar->mem);
+        rc =3D pci_sanitize_bar_memory(mem);
         if ( rc )
         {
             gprintk(XENLOG_WARNING,
@@ -412,14 +414,14 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
         unsigned long end =3D PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
                                      vmsix_table_size(pdev->vpci, i) - 1);
=20
-        for ( j =3D 0; j < ARRAY_SIZE(header->bars); j++ )
+        for ( j =3D 0; j < ARRAY_SIZE(current->vpci.mem); j++ )
         {
-            const struct vpci_bar *bar =3D &header->bars[j];
+            struct rangeset *mem =3D current->vpci.mem[j];
=20
-            if ( rangeset_is_empty(bar->mem) )
+            if ( rangeset_is_empty(mem) )
                 continue;
=20
-            rc =3D rangeset_remove_range(bar->mem, start, end);
+            rc =3D rangeset_remove_range(mem, start, end);
             if ( rc )
             {
                 gprintk(XENLOG_WARNING,
@@ -469,8 +471,9 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16=
_t cmd, bool rom_only)
                 for ( j =3D 0; j < ARRAY_SIZE(header->bars); j++)
                 {
                     const struct vpci_bar *bar =3D &header->bars[j];
+                    struct rangeset *mem =3D current->vpci.mem[j];
=20
-                    if ( !rangeset_overlaps_range(bar->mem, start, end) ||
+                    if ( !rangeset_overlaps_range(mem, start, end) ||
                          /*
                           * If only the ROM enable bit is toggled check ag=
ainst
                           * other BARs in the same device for overlaps, bu=
t not
@@ -481,7 +484,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16=
_t cmd, bool rom_only)
                           bar->type =3D=3D VPCI_BAR_ROM) )
                         continue;
=20
-                    rc =3D rangeset_remove_range(bar->mem, start, end);
+                    rc =3D rangeset_remove_range(mem, start, end);
                     if ( rc )
                     {
                         gprintk(XENLOG_WARNING,
@@ -734,18 +737,6 @@ static void cf_check rom_write(
     }
 }
=20
-static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *b=
ar,
-                            unsigned int i)
-{
-    char str[32];
-
-    snprintf(str, sizeof(str), "%pp:BAR%u", &pdev->sbdf, i);
-
-    bar->mem =3D rangeset_new(pdev->domain, str, RANGESETF_no_print);
-
-    return !bar->mem ? -ENOMEM : 0;
-}
-
 int vpci_init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -856,10 +847,6 @@ int vpci_init_header(struct pci_dev *pdev)
         else
             bars[i].type =3D VPCI_BAR_MEM32;
=20
-        rc =3D bar_add_rangeset(pdev, &bars[i], i);
-        if ( rc )
-            goto fail;
-
         rc =3D pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
                               (i =3D=3D num_bars - 1) ? PCI_BAR_LAST : 0);
         if ( rc < 0 )
@@ -913,12 +900,6 @@ int vpci_init_header(struct pci_dev *pdev)
                                4, rom);
         if ( rc )
             rom->type =3D VPCI_BAR_EMPTY;
-        else
-        {
-            rc =3D bar_add_rangeset(pdev, rom, num_bars);
-            if ( rc )
-                goto fail;
-        }
     }
     else if ( !is_hwdom )
     {
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 0ac9ec8b04..d069ca6d9c 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -24,6 +24,35 @@
=20
 #ifdef __XEN__
=20
+void vpci_vcpu_destroy(struct vcpu *v)
+{
+    if ( !has_vpci(v->domain) && !is_idle_domain(v->domain) )
+        return;
+
+    for ( unsigned int i =3D 0; i < ARRAY_SIZE(v->vpci.mem); i++ )
+        RANGESET_DESTROY(v->vpci.mem[i]);
+}
+
+int vpci_vcpu_init(struct vcpu *v)
+{
+    unsigned int i;
+
+    if ( !has_vpci(v->domain) && !is_idle_domain(v->domain) )
+        return 0;
+
+    for ( i =3D 0; i < ARRAY_SIZE(v->vpci.mem); i++ )
+    {
+        char str[32];
+
+        snprintf(str, sizeof(str), "%pv:BAR%u", v, i);
+        v->vpci.mem[i] =3D rangeset_new(v->domain, str, RANGESETF_no_print=
);
+        if ( !v->vpci.mem[i] )
+            return -ENOMEM;
+    }
+
+    return 0;
+}
+
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
 static int assign_virtual_sbdf(struct pci_dev *pdev)
 {
@@ -89,8 +118,6 @@ struct vpci_register *vpci_get_register(const struct vpc=
i *vpci,
=20
 void vpci_deassign_device(struct pci_dev *pdev)
 {
-    unsigned int i;
-
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
=20
     if ( !has_vpci(pdev->domain) || !pdev->vpci )
@@ -116,9 +143,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
     }
     spin_unlock(&pdev->vpci->lock);
=20
-    for ( i =3D 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
-        rangeset_destroy(pdev->vpci->header.bars[i].mem);
-
     xfree(pdev->vpci);
     pdev->vpci =3D NULL;
 }
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 817505badf..f01e00ec92 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -40,6 +40,13 @@ struct rangeset *rangeset_new(
 void rangeset_destroy(
     struct rangeset *r);
=20
+/* Destroy a rangeset, and zero the pointer to it. */
+#define RANGESET_DESTROY(r)  \
+    ({                       \
+        rangeset_destroy(r); \
+        (r) =3D NULL;          \
+    })
+
 /*
  * Set a limit on the number of ranges that may exist in set @r.
  * NOTE: This must be called while @r is empty.
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 877aa391d1..b55bacbe6e 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -19,6 +19,9 @@
  */
 #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
=20
+void vpci_vcpu_destroy(struct vcpu *v);
+int vpci_vcpu_init(struct vcpu *v);
+
 /* Assign vPCI to device by adding handlers. */
 int __must_check vpci_assign_device(struct pci_dev *pdev);
=20
@@ -54,7 +57,6 @@ struct vpci {
             uint64_t guest_addr;
             uint64_t size;
             uint64_t resizable_sizes;
-            struct rangeset *mem;
             enum {
                 VPCI_BAR_EMPTY,
                 VPCI_BAR_IO,
@@ -152,14 +154,15 @@ struct vpci {
 #endif
 };
=20
+#ifdef __XEN__
 struct vpci_vcpu {
     /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
     const struct pci_dev *pdev;
+    struct rangeset *mem[ARRAY_SIZE(((struct vpci_header *)NULL)->bars)];
     uint16_t cmd;
     bool rom_only : 1;
 };
=20
-#ifdef __XEN__
 void vpci_dump_msi(void);
=20
 /* Arch-specific vPCI MSI helpers. */
@@ -204,6 +207,9 @@ bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, =
unsigned int len,
 #else /* !CONFIG_HAS_VPCI */
 struct vpci_vcpu {};
=20
+static inline void vpci_vcpu_destroy(struct vcpu *v) { }
+static inline int vpci_vcpu_init(struct vcpu *v) { return 0; }
+
 static inline int vpci_reinit_ext_capabilities(struct pci_dev *pdev)
 {
     return 0;
--=20
2.51.2

