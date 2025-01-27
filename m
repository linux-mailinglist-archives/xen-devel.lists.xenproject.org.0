Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B462DA1D0E7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 07:27:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877463.1287603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcIaH-0004kf-6q; Mon, 27 Jan 2025 06:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877463.1287603; Mon, 27 Jan 2025 06:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcIaH-0004hl-3n; Mon, 27 Jan 2025 06:26:57 +0000
Received: by outflank-mailman (input) for mailman id 877463;
 Mon, 27 Jan 2025 06:26:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50Ot=UT=eviden.com=clement.mathieu--drif@srs-se1.protection.inumbo.net>)
 id 1tcIaF-0004hd-G3
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 06:26:55 +0000
Received: from smarthost2.eviden.com (smarthost2.eviden.com [80.78.11.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2ec732b-dc77-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 07:26:53 +0100 (CET)
Received: from mail-westeuropeazlp17010003.outbound.protection.outlook.com
 (HELO AM0PR83CU005.outbound.protection.outlook.com) ([40.93.65.3])
 by smarthost2.eviden.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 27 Jan 2025 07:26:52 +0100
Received: from AM8PR07MB7602.eurprd07.prod.outlook.com (2603:10a6:20b:24b::7)
 by VI1PR07MB9531.eurprd07.prod.outlook.com (2603:10a6:800:1c9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 06:26:45 +0000
Received: from AM8PR07MB7602.eurprd07.prod.outlook.com
 ([fe80::fbd7:ca71:b636:6f9d]) by AM8PR07MB7602.eurprd07.prod.outlook.com
 ([fe80::fbd7:ca71:b636:6f9d%7]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 06:26:45 +0000
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
X-Inumbo-ID: b2ec732b-dc77-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=eviden.com; i=@eviden.com; q=dns/txt; s=mail;
  t=1737959213; x=1769495213;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TuFDbrtAziZN9o0EFxR7KDVfNYFwC3Cyvmq9l7FEOXU=;
  b=SZd4wwlEmCC8L4XgVlju9n88FewRxhxOnh/GLTh3hllSd06y0pWylRoj
   lFN83ShXftdkBDsVq1z5PMdUfW6Lw6AjJYExKZyWg0OYC/eZmIRgGgYBF
   oYaAvCqXnLwK09SbDhTsMJl9qvQ0eBs0Cc7bAqSKU+jAm8F4AlAMEHDcy
   5a/HMwQmxgPLqnMiA/Y/1WcH/GCCyzs4VzR6GpXuvzU4K9XYRcbNBARXc
   ipoTUS0YkLzLo5sEXoJIeEA8BfqAiMtLSS7ciPzERUMCSr+fFhYYXkIg0
   0rGnUrRxHdX1iQwJVcj18tVNi3TZB6MbeTRzdM+gYhzZe9ioRZsKMt64T
   g==;
X-CSE-ConnectionGUID: vgeN1/2VRnOyOOkA3YNW1g==
X-CSE-MsgGUID: 86WSesZ6SNuNiCrB+F1OeA==
X-IronPort-AV: E=Sophos;i="6.13,237,1732575600"; 
   d="scan'208";a="29555522"
X-MGA-submission: =?us-ascii?q?MDHbozXGOCnZ11UkrpyYq42roL+9DgQOsdhcXb?=
 =?us-ascii?q?miR8EIYIi/BbYN2uy1AB1RR0V92OiqP4jELfNMHcsEUbwK1PH7U0kdtw?=
 =?us-ascii?q?fl+z29xSAowYSbu2Ha3rdTiaDflet6udjOBylfPZfzngjSTQ13Z8GtzG?=
 =?us-ascii?q?e6SAGIwqFeS6zM1GYMx/26Fg=3D=3D?=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYUv2LCbqNhChqmt0X12HSA2B27Q+S22v6wu+mdLPu2Xe6FV8O04WzUZgyGTVlPwDw7l9II/PTF3e3g9Vr1AbJk/KCoqaqgJBe9nueGKODBfLPisf6ZO+/gEJno0lchvjEFapt6iIaVxOUG3ufN6QuCN6AEXO0rpJUZ9BV0cAl1rbC4jV84OOhHGOTxCWqWYFB3mxIQ+MFTGU4xIDQnNBuNFUOnCtuNg8Um+TpZntMqs4BDeRfUxBT9/zcZNel2n/3XVki/q6o3qX6IEJSR5xDRVhAN6ttwsVD8/ONRFybPtzTac1XmsMtsTHsWBB0xF4wyHI0B9WR9I2OpSdcGRkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuFDbrtAziZN9o0EFxR7KDVfNYFwC3Cyvmq9l7FEOXU=;
 b=c0aIgnbhCOHSPxiL7y2SN54AvWk81m00SfMZnQqg9yc9uy7TRFmtn7ylzRYQLuBPAbnvAV97b7Po0hJ6vZwgf7z/z3gS32ZNDO4OQ+vW0Cik2hSgrwdhvBrTJezGx7XxHcAAhfuh/MKDjfZuOdE5SxsNh1opiSGCuWwvY9/Y6mkb5QvFmq1C0uXT0fOsjL/+uoxVoKbGD6gdJ2TOgRapMqRU4d1J/VCnUSFit7Pvs7dDkqwFVjmo43VRInZF2u5tHv5jvc4KyOq6Qh5XQO0FuMwv/2eUye3N0TFnGiCbdePMRmVeedMkR4Z3DNnYSDh5YmqlYzr13w00pjN6uF+4DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eviden.com; dmarc=pass action=none header.from=eviden.com;
 dkim=pass header.d=eviden.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Eviden.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuFDbrtAziZN9o0EFxR7KDVfNYFwC3Cyvmq9l7FEOXU=;
 b=YbXwtUXvlxrCgGP+5p2/8v6neMQhl+sA/GXX/EVy86ah3ZKT1kE4Td4/NvPgZMyhDf0fTlMNC//U/yb3C5iA6IB/g8jxjFRedpuvzOLsC2rmDm7QZaqJKtY+gzABejg42TRBp01izfkTgL6WG4A8rm7Et7j3ETjejJJktU436KSV258SKATOv3fQyFKvh9vTkGMg9hAXzooKlhibObikfIhSDBHfgqXldpLmseX9KhxRT+r64gDRj/rS7nbdfN28fKn4c0PFxeMHynN1siKDX99AgUiAv4ichmGjLO27hOS4RP4iKHQzV4xHhX9nGrqdRNaDdizIdSMGm+7yGRG7nw==
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
Subject: Re: [PATCH 2/9] hw/sysbus: Declare QOM types using DEFINE_TYPES()
 macro
Thread-Topic: [PATCH 2/9] hw/sysbus: Declare QOM types using DEFINE_TYPES()
 macro
Thread-Index: AQHbb1TnAXNqrKSmEEKYIVzklwv71bMqKiEA
Date: Mon, 27 Jan 2025 06:26:45 +0000
Message-ID: <1a8ceb53-706e-49be-9f44-4b73a29613d0@eviden.com>
References: <20250125181343.59151-1-philmd@linaro.org>
 <20250125181343.59151-3-philmd@linaro.org>
In-Reply-To: <20250125181343.59151-3-philmd@linaro.org>
Accept-Language: en-GB, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eviden.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR07MB7602:EE_|VI1PR07MB9531:EE_
x-ms-office365-filtering-correlation-id: 8adb2fe5-94cf-4d6f-9e81-08dd3e9b927c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aEhpK2ZjTnlxNWlsRVp6bk15OXc2RTNQeE92R08zU0FhZHlzNlNWS3FQaFla?=
 =?utf-8?B?RENUbHhVU05uYUQ0blhhREQzeEdxQjBiNG5jbDNUSzArRWsveW15dE8ydWly?=
 =?utf-8?B?eFdsRDhkMmpSR3Z0aHZzbVNVRytvK1NRejkxOE8xNWQycFp5RDc1L1NxYkpr?=
 =?utf-8?B?NVlzQlNXbXArbmRyOHJVbU9GeWdGK1lCa0xFckpDaVRBTjVCcFh4SnowdW8x?=
 =?utf-8?B?WjJlVHdXSTRQOVZHRFRRWEU3UTdoRjdtUExiakkrN2FzWVNWT200c0NYV0pD?=
 =?utf-8?B?aCtlSy9pYmxpa005V3V1djNQQk1EYUNjYU9YS1d0RU9VaXFZSGdQT25rZGZ5?=
 =?utf-8?B?dTN5RXZ3MmIvZXpacEI5MGc0b0toOUJwWkFhdVpwbU0vdCtjVnNvZGc4RGhU?=
 =?utf-8?B?VU9MdnVOYW01a0diWW5RL24zS05Hcnc4TEtPWEtaTHU0Z0RCcXpjZFdDNjdG?=
 =?utf-8?B?TFFOTTl5aWZ2Z09CRThnS29uYjJDVlZxdlB1bTYxSlIySHozY293dFkyZnUz?=
 =?utf-8?B?N2FCM3AwSkxrYXlvNTdDZEoxRnh5R0FlMDlBRVdWdmhpVVFDNXZDQVp3OW11?=
 =?utf-8?B?ejNsY0ZlZjNrcUhvWDVQam5HRkJiekd0K29XS20wZDhaaUJwMFlaZFQ5T0NZ?=
 =?utf-8?B?aWd1OGJyWEtUZm1ZM2NYWFA1cDdlekZacXR2SFpNK1FVSTdodWlSQ0p5WSs5?=
 =?utf-8?B?eFYzZmZXa2tqUGh1TG5kK2pyc3hWRkhNdUxUU2xwakMwMytEL0VDZDhuRElv?=
 =?utf-8?B?akppUDM2RTE0MExWUFpOeTVTZTduRDhtYlpBcTR0eDM0TGdZOHprQ2NCc2o0?=
 =?utf-8?B?V0RNbHovZzhTZFRYQ0JGWGxrWWhMS3djK2hzSEwxUERrVXRPQzdRbFBvZll1?=
 =?utf-8?B?UHdGQjFZOVo0WmpOcDYzQU56VE5OQ05yN3duRTltRVZSMmp2amxHakc5cjZ3?=
 =?utf-8?B?Z1o3WGgvd0I1V1VMVnQyUnprTEVjOEFpTEdsM0dvMFBaRkhVZlo4NHlMRFp0?=
 =?utf-8?B?TUd2ZldUVDlwbDduVGd1T2JzY214aGhzL2ZFbXR6dmZTVjRVLytobWV3WDY2?=
 =?utf-8?B?VUxvMlN5ZDBJME9NajkvWXlqV3MvY1BGc1VTbGtoT0RpcktwMi9OODdHR0lw?=
 =?utf-8?B?MGhFeVRNc21PSnh2UnZKM1hiL0RGQllWZmhxcjZVZ3JPeVRDbFF3RXVzcXo1?=
 =?utf-8?B?OXJKVEI1elRxOWorZFg0ajBHVVplVlp1ejBJQWdhVlk2ZU1BZTBrZ3NpeUpW?=
 =?utf-8?B?UGJNeTh4SE1UdzdJL0REZkQzd3ZEQ24vbG5LSFprVytqQmhGUHZFb2k0M2hF?=
 =?utf-8?B?MkhuVHV0WHgrK1hyY2cxU09MZ3dFVnBhVVROM0ZXSDUxS0h0L0djYjRXbERR?=
 =?utf-8?B?eGJXaEFFSlVmNk0vOW9NMHg1NFlNbE0yV3NUR2szWklCOTU0a3QySFF1ZTVr?=
 =?utf-8?B?OUhjWnB1dGFxdE5RS0xDRlpKTHRxTFgzcXFCMUZjZUFySzA1ejIreTQzR1lj?=
 =?utf-8?B?QUFXblRMWUVQVzFSM25sb3hKZGI1MzhoMXRuQktmRGFUNDRJYVNBSWRpQ1Rm?=
 =?utf-8?B?R1huazQ4ZVMxZmltT3lHQVZBZElOQk9QR1NoUkh5VHkwaDgrd2trRE13bjI2?=
 =?utf-8?B?MHZEM2tkTHRqZHBXNjdIQjVia0RJT2ROSmpjMWZSZnJLZjZlUmhPUlc5TjJS?=
 =?utf-8?B?ME1yb3NvcTZsNGY0V2Ura2ZtSkpkUWRrZHlwQnc5ajJpNU1RV2pCRVN6blNp?=
 =?utf-8?B?WnFaVHF3aHYzYUJlZHFVSjlmVU9sT2tQa1B0TEFrdndDSXVaZ1BKaG9laXRL?=
 =?utf-8?B?UlQyK1djRWtOYXd2QTdXN1R4NHJnVUVWNnhtQ3o5NlpuTSttc0RKUUxManU2?=
 =?utf-8?B?MXFrclFxdXpkR295cEZ3MmxBVS9iamIwYWxmUnZiWStPZDVsT0FHUWwzdUYv?=
 =?utf-8?Q?m86FAmRd2ar45L2s6sh4xY6m40PRIqfd?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR07MB7602.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUJ4SVc0OEhLUnJNcVNGbTBaNUczVkp3Vk5HN1psYnY4WUsremh6Q2JhWEdD?=
 =?utf-8?B?UmJ6cURGQW85aHFLRm9PL3lwU29IMnREbEY1b0dLdGxLZ2N3c2pmdmpWYTRt?=
 =?utf-8?B?cjUzVmJsQmpNR0Rlek90S2Z4WGZKTS9vSUdyRGF0RlNxaHA0OW9EWjZ5dHh4?=
 =?utf-8?B?NGpRa1grQkVrbkxLeEVnZ3ZuZE1jK2VHeWgyTkZXRGYxYjI5eDVaVzYzVEQx?=
 =?utf-8?B?c0xSeVN4eWhMYUpJdThxbkgvK0V3Y1BiT2Fnb3k4VXR4RFZoNVpkOWdVNUZH?=
 =?utf-8?B?YnhpcURUbUEvUkticU1qbTNBdFlHZlhBN2hCRkpGYVIrOXF1azlydWdYbGNI?=
 =?utf-8?B?QW44WG41MGFieTA2SEJ3QnkySXdreE9uZ2JIa09aTG5UdktYQitpTGl6Mk04?=
 =?utf-8?B?c29wSFVVRWlRV1BxYUlHbzQ3bWFWRFhxdTJ5cjRzN2xKaW5JRUVnaXhZWXFv?=
 =?utf-8?B?dFF6VUpGY2FxeklNUUtmK1Rhb2NvTmYrSzhOOTdJc2RKSHJ5eDlMb1loMWtx?=
 =?utf-8?B?UDV3T3hja3IyL0JaUXNXNngwTk1ERE5uTWxvOUE3aXNNNjJxbC9MS1o4cTRO?=
 =?utf-8?B?aklKOGVKYzhQQzJhbzN2OXRITHhuUkx6a1dHZjNDRWVBbXQvajRiK29ZMS9v?=
 =?utf-8?B?VzdyZmJGRlFzWUxNNWU0NWdyaUFVRUhOY2g0aUsweHI2bHhtWlVWcVljU2ZJ?=
 =?utf-8?B?dlZUZTJ5OGFDYlo1bUxZUnBQcGpmQjZCZWs4MDFQYlhDNnhkQ3RiOFl4VWZ0?=
 =?utf-8?B?S01tT1UrV202YkU1clRvS0pkVDZPMDhIcWhTM2V6RGMxc3Q1bUI5cjNNY2dR?=
 =?utf-8?B?VTI4UkFEelFTdC8wOC84S1FyR1YzK3BoM3FnWGY4bzlmVVFVSTR6YVF0SGd0?=
 =?utf-8?B?MHJGK3ZONzExWndMWVNEMTFNbkZUL0xrNzJKRG80YlFybHJocHpEdVlaTTYz?=
 =?utf-8?B?Wmk4cGhNZGZwenp4bjVibm84NnRNdlBYbWMxNEpKRVgzTVFMc3NxdUdpTHRr?=
 =?utf-8?B?RHdjN0xYUnhLRnVuUGNZYUcxNFdJdUxwbDBmWkFFb0NxcksyMWdaMWZySWhz?=
 =?utf-8?B?T1NwQ09MT3Q3SzI2R0tvbmZ0WlUvWG1QeFV2ZU9MOGRFaUlUbG1zQS81K3hT?=
 =?utf-8?B?ajBxTGkyaU03OUpxZlpnaW5GTk5CaFgvd2t4em43K3pOUlRrdFV0NHdZWk9Y?=
 =?utf-8?B?UDkweEdGamxNaFM1T01GdllmOEUyVENxdTNETUNmWDNYclRwaTVMeHE5VEZO?=
 =?utf-8?B?YUdZdVRKb2FITGVsRnJMWW1rbWt5UHg4MzlOc2RQbFpDaWFaUHN0VWw5Z2E2?=
 =?utf-8?B?aTJCZEo0cDVWQ0pTOVVwOTV5VUt6QWY3QkorSXRxcXJreFVoQTBuYVFsZHV0?=
 =?utf-8?B?dlRsdEM5TVRseFVWcUN1K0M2cGMwQzZ5alVvOFl1TkU4eVFOblBlVjU4dUJk?=
 =?utf-8?B?K3QvWEtJSW1sTGQ5TWhGTjFqOE5WSS81VlJ4eTUzcGNJOFhxM2c2MFdRMmJH?=
 =?utf-8?B?bXQ3ZUMxdWhFMytrOUhPQ0NGUDVGcUJ0SS9RWEhtOUV0UGlDTjk4ZnZtam56?=
 =?utf-8?B?Mk44bEtHaXV5MUlZWlZhQ3V4UjJCNnZheE0xMWdwK3lTUVNQMzQwZE1wdWVV?=
 =?utf-8?B?TXVBbE95bUo3OGxiWTB2SGVRUkJ0L1BLQTJyRklJR01veFhUZkpKQnpFT0lv?=
 =?utf-8?B?c0w4RExzSGR1cWk2VmUrRkE2elRGUGxtZWI3bmhPRStwMm01OUgxT0MvUFIz?=
 =?utf-8?B?ZDFwdkZ2bk5JNWQzVUFERGlkcnc3bVhtcU83MkM4dmlaaXArOTlxTERYQ1d6?=
 =?utf-8?B?TVV6L2lwN0xoTnBJRUJVRjVoRnQwcXl2a0FFK2hYYmxJMFBqdFBjN2tQajdN?=
 =?utf-8?B?Z2hmdkRJdmx5aWpoeUhhd1RIQW8yNlh5QXdQeFFNR0FtNHNYR2VCYzRyOFRv?=
 =?utf-8?B?eEpGcFVPMHFGVWdHelBGTGxaVnlZTWdZZzYvOE93U3pCcy9hOWJwRE5xZldU?=
 =?utf-8?B?U21SWUcxdDRRZDJueFAvbjdUSEsrMS9VNDl3WFpxai9wVC93M1VwVE4wMUZv?=
 =?utf-8?B?NmxmT0dHallrSkcrL0tPbzQwSnoxa2lQY2dNcHAwY2lzUDR6RC81ZVRKZ3Zm?=
 =?utf-8?B?T0lIN1RuSGFuMTB1b1h1a2U1RGxWSnhSU3FjeVRRdTNCU3MzNlRaYTZ2dC9H?=
 =?utf-8?Q?ibW+dBeoVEdjEMrpMYUqZYA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6592038D60443488BDD6AAF2AE9C835@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eviden.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR07MB7602.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8adb2fe5-94cf-4d6f-9e81-08dd3e9b927c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 06:26:45.4354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7d1c7785-2d8a-437d-b842-1ed5d8fbe00a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ERBgtATSJ34ThOTwYaU4lVW/FPgHZLhYUT7ccY1Da7pUR7YHkQqb6pUhQLU7MF7xlI5bfQzqudT8w7MNPVeE7dRQyF1s5qdSlaJ9x2K+MJ49gyGNgB7mJ2PwvSU4IveN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB9531

UmV2aWV3ZWQtYnk6IENsw6ltZW50IE1hdGhpZXUtLURyaWY8Y2xlbWVudC5tYXRoaWV1LS1kcmlm
QGV2aWRlbi5jb20+DQoNCg0KDQpPbiAyNS8wMS8yMDI1IDE5OjEzLCBQaGlsaXBwZSBNYXRoaWV1
LURhdWTDqSB3cm90ZToNCj4gQ2F1dGlvbjogRXh0ZXJuYWwgZW1haWwuIERvIG5vdCBvcGVuIGF0
dGFjaG1lbnRzIG9yIGNsaWNrIGxpbmtzLCB1bmxlc3MgdGhpcyBlbWFpbCBjb21lcyBmcm9tIGEg
a25vd24gc2VuZGVyIGFuZCB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPg0KPg0KPiBX
aGVuIG11bHRpcGxlIFFPTSB0eXBlcyBhcmUgcmVnaXN0ZXJlZCBpbiB0aGUgc2FtZSBmaWxlLA0K
PiBpdCBpcyBzaW1wbGVyIHRvIHVzZSB0aGUgdGhlIERFRklORV9UWVBFUygpIG1hY3JvLiBJbg0K
PiBwYXJ0aWN1bGFyIGJlY2F1c2UgdHlwZSBhcnJheSBkZWNsYXJlZCB3aXRoIHN1Y2ggbWFjcm8N
Cj4gYXJlIGVhc2llciB0byByZXZpZXcuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1h
dGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICAgaHcvY29yZS9zeXNi
dXMuYyB8IDM5ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkNCj4NCj4gZGlm
ZiAtLWdpdCBhL2h3L2NvcmUvc3lzYnVzLmMgYi9ody9jb3JlL3N5c2J1cy5jDQo+IGluZGV4IGY3
MTNiYmZlMDRmLi4zMDZmOTg0MDZjMCAxMDA2NDQNCj4gLS0tIGEvaHcvY29yZS9zeXNidXMuYw0K
PiArKysgYi9ody9jb3JlL3N5c2J1cy5jDQo+IEBAIC04MCwxMyArODAsNiBAQCBzdGF0aWMgdm9p
ZCBzeXN0ZW1fYnVzX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKmtsYXNzLCB2b2lkICpkYXRhKQ0K
PiAgICAgICBrLT5nZXRfZndfZGV2X3BhdGggPSBzeXNidXNfZ2V0X2Z3X2Rldl9wYXRoOw0KPiAg
IH0NCj4NCj4gLXN0YXRpYyBjb25zdCBUeXBlSW5mbyBzeXN0ZW1fYnVzX2luZm8gPSB7DQo+IC0g
ICAgLm5hbWUgPSBUWVBFX1NZU1RFTV9CVVMsDQo+IC0gICAgLnBhcmVudCA9IFRZUEVfQlVTLA0K
PiAtICAgIC5pbnN0YW5jZV9zaXplID0gc2l6ZW9mKEJ1c1N0YXRlKSwNCj4gLSAgICAuY2xhc3Nf
aW5pdCA9IHN5c3RlbV9idXNfY2xhc3NfaW5pdCwNCj4gLX07DQo+IC0NCj4gICAvKiBDaGVjayB3
aGV0aGVyIGFuIElSUSBzb3VyY2UgZXhpc3RzICovDQo+ICAgYm9vbCBzeXNidXNfaGFzX2lycShT
eXNCdXNEZXZpY2UgKmRldiwgaW50IG4pDQo+ICAgew0KPiBAQCAtMzA2LDE1ICsyOTksNiBAQCBz
dGF0aWMgdm9pZCBzeXNidXNfZGV2aWNlX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKmtsYXNzLCB2
b2lkICpkYXRhKQ0KPiAgICAgICBrLT51c2VyX2NyZWF0YWJsZSA9IGZhbHNlOw0KPiAgIH0NCj4N
Cj4gLXN0YXRpYyBjb25zdCBUeXBlSW5mbyBzeXNidXNfZGV2aWNlX3R5cGVfaW5mbyA9IHsNCj4g
LSAgICAubmFtZSA9IFRZUEVfU1lTX0JVU19ERVZJQ0UsDQo+IC0gICAgLnBhcmVudCA9IFRZUEVf
REVWSUNFLA0KPiAtICAgIC5pbnN0YW5jZV9zaXplID0gc2l6ZW9mKFN5c0J1c0RldmljZSksDQo+
IC0gICAgLmFic3RyYWN0ID0gdHJ1ZSwNCj4gLSAgICAuY2xhc3Nfc2l6ZSA9IHNpemVvZihTeXNC
dXNEZXZpY2VDbGFzcyksDQo+IC0gICAgLmNsYXNzX2luaXQgPSBzeXNidXNfZGV2aWNlX2NsYXNz
X2luaXQsDQo+IC19Ow0KPiAtDQo+ICAgc3RhdGljIEJ1c1N0YXRlICptYWluX3N5c3RlbV9idXM7
DQo+DQo+ICAgc3RhdGljIHZvaWQgbWFpbl9zeXN0ZW1fYnVzX2NyZWF0ZSh2b2lkKQ0KPiBAQCAt
MzM3LDEwICszMjEsMjEgQEAgQnVzU3RhdGUgKnN5c2J1c19nZXRfZGVmYXVsdCh2b2lkKQ0KPiAg
ICAgICByZXR1cm4gbWFpbl9zeXN0ZW1fYnVzOw0KPiAgIH0NCj4NCj4gLXN0YXRpYyB2b2lkIHN5
c2J1c19yZWdpc3Rlcl90eXBlcyh2b2lkKQ0KPiAtew0KPiAtICAgIHR5cGVfcmVnaXN0ZXJfc3Rh
dGljKCZzeXN0ZW1fYnVzX2luZm8pOw0KPiAtICAgIHR5cGVfcmVnaXN0ZXJfc3RhdGljKCZzeXNi
dXNfZGV2aWNlX3R5cGVfaW5mbyk7DQo+IC19DQo+ICtzdGF0aWMgY29uc3QgVHlwZUluZm8gc3lz
YnVzX3R5cGVzW10gPSB7DQo+ICsgICAgew0KPiArICAgICAgICAubmFtZSAgICAgICAgICAgPSBU
WVBFX1NZU1RFTV9CVVMsDQo+ICsgICAgICAgIC5wYXJlbnQgICAgICAgICA9IFRZUEVfQlVTLA0K
PiArICAgICAgICAuaW5zdGFuY2Vfc2l6ZSAgPSBzaXplb2YoQnVzU3RhdGUpLA0KPiArICAgICAg
ICAuY2xhc3NfaW5pdCAgICAgPSBzeXN0ZW1fYnVzX2NsYXNzX2luaXQsDQo+ICsgICAgfSwNCj4g
KyAgICB7DQo+ICsgICAgICAgIC5uYW1lICAgICAgICAgICA9IFRZUEVfU1lTX0JVU19ERVZJQ0Us
DQo+ICsgICAgICAgIC5wYXJlbnQgICAgICAgICA9IFRZUEVfREVWSUNFLA0KPiArICAgICAgICAu
aW5zdGFuY2Vfc2l6ZSAgPSBzaXplb2YoU3lzQnVzRGV2aWNlKSwNCj4gKyAgICAgICAgLmFic3Ry
YWN0ICAgICAgID0gdHJ1ZSwNCj4gKyAgICAgICAgLmNsYXNzX3NpemUgICAgID0gc2l6ZW9mKFN5
c0J1c0RldmljZUNsYXNzKSwNCj4gKyAgICAgICAgLmNsYXNzX2luaXQgICAgID0gc3lzYnVzX2Rl
dmljZV9jbGFzc19pbml0LA0KPiArICAgIH0sDQo+ICt9Ow0KPg0KPiAtdHlwZV9pbml0KHN5c2J1
c19yZWdpc3Rlcl90eXBlcykNCj4gK0RFRklORV9UWVBFUyhzeXNidXNfdHlwZXMpDQo+IC0tDQo+
IDIuNDcuMQ0KPg0K

