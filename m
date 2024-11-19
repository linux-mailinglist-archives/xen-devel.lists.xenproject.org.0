Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3499D1FD3
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 06:59:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839655.1255440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDHFg-0004WM-PH; Tue, 19 Nov 2024 05:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839655.1255440; Tue, 19 Nov 2024 05:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDHFg-0004U7-Mf; Tue, 19 Nov 2024 05:58:16 +0000
Received: by outflank-mailman (input) for mailman id 839655;
 Tue, 19 Nov 2024 05:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rCfT=SO=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tDHFe-0004U1-Kp
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 05:58:14 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2408::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4068d4fc-a63b-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 06:58:09 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB7317.namprd12.prod.outlook.com (2603:10b6:806:2ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 05:58:05 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 05:58:04 +0000
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
X-Inumbo-ID: 4068d4fc-a63b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwODo6NjJkIiwiaGVsbyI6Ik5BTTA0LUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjQwNjhkNGZjLWE2M2ItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTk1ODg5LjcyOTE0Nywic2VuZGVyIjoiamlxaWFuLmNoZW5AYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QI+M0ivh2Extk/iwOJpn6oOmJVpYV0bWexDXBo109xfmDZpdOqoOmGtx3nuBMSaV2riA5VLw9ho07loq9kpxqgo2NY8z0DckqluvVXfzdYoMaHdD+D0gugq5B6aNiKG4d3+62iMYTCu/7Xqkkjw+x4F2RQpSep5hcVgGPmyTCM1FyustHDA9VC0pBTnyMUDAmzPOEwNJ9vhl4fApZKx6bwXjNzGMynkDxh84PZPoSQVLOsH54i8CtKeghuFPVTX4w8sKnUTL1ldpi3UbVm5/PTCyG2x08p2BJZWMS88t89hDylfwlJseFtAP45vi14NCV0ynG8zFjst4zcLZC0j3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EE4xt8/SpO4Hem4bo3fJcds07C7oTvDNlwsdi0Xzz5U=;
 b=CjhPRPpDiJkfwN9nonnMB8qci4woGcmASuup1XHJXkCYMZI8Eppawa0cw4tvQP5cpKNrIloPZPtHQBs+zizluz4HbRHj7kTbiZZ/ZTqv5bWPigkzGdalq11vzOklZgSvaW4GBbnYXuV+Ud+lgWtfD0cwEm4EsCegXt6gYLiSqU/bCPCRgFDOiTTz2+lHnLos5CYJNozWdJYQq1huPQbQFjLa8YqxF3jO3jv95SVl98T6o0992L7NEdWjCXZW+NPd+PFSuNX1mckdWYDWolGCIiKeY0XLz7O10Tnk40kC4GL3Y0vNHdG5JNsKKfmM2CYIQb0MC0QB0kiDqvv9+4t6yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EE4xt8/SpO4Hem4bo3fJcds07C7oTvDNlwsdi0Xzz5U=;
 b=xJBHq1jJKugIbSwEIZurnqgiOaLaCG2MUHxfzb327a3mom0d4bHwe0zuqbOpqETmxb79motjTGuZCd2vn2KP5ktASArseub1dEM3RIkf6D8dRPc1l2n+hBuOMMZJ9Ofjq1H4ei3wMn5P3U1U1TR2pUTuxHAY61BdsFAqzFReZLI=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Paul Durrant <paul@xen.org>, "Edgar E . Iglesias"
	<edgar.iglesias@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [QEMU PATCH v10] xen/passthrough: use gsi to map pirq when dom0
 is PVH
Thread-Topic: [QEMU PATCH v10] xen/passthrough: use gsi to map pirq when dom0
 is PVH
Thread-Index: AQHbMBN9zgKXu6QHp0mudGAMtCr+w7K9RysAgAFuGYA=
Date: Tue, 19 Nov 2024 05:58:04 +0000
Message-ID:
 <BL1PR12MB58497864D77C9F6B30E5D806E7202@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241106061418.3655304-1-Jiqian.Chen@amd.com>
 <Zztlvl0m-Oi2XGXq@l14>
In-Reply-To: <Zztlvl0m-Oi2XGXq@l14>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8158.023)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB7317:EE_
x-ms-office365-filtering-correlation-id: 255b6c10-c344-48aa-8046-08dd085f2252
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Mm9YZjBWQVlMc2dIUWcwOUxMQkE2bTYvNUcyZlBhcGJuZWcyREVzeE82Nnox?=
 =?utf-8?B?OWZhY2FWakkxSnJwQ0xjcnRDVEV5NUdmODBFMHJ0ZUJYbUl0allVL3hQT0pt?=
 =?utf-8?B?ejZ0dkRLYi94UkxtZEdEMFlYNkV0Z1JTUnNidytIeGJXZ0hUVDFXWU1laE55?=
 =?utf-8?B?djhENDFzNFlWR0YvSHlYTzQ5bVJ6RStJTjhmQm5oL080cHRiNEg0cUUyRkpE?=
 =?utf-8?B?MU50VFAzVVlWdmpoQ3NpaFEwYTBwY0ViU3B4NGtvZkZHUDhNRkRsVnhod0tS?=
 =?utf-8?B?RUs3Mk9nRGVWbC9KUldvZlU2YnUrZEJjNHdNWVJlVzV1SFlIcEhCNTMwZ0Vm?=
 =?utf-8?B?cGZDMkp3aHRTOUNpWHNiOWtFdm5YQWlETnFSaXhDdXhMZjZESTJOaXNOTUFH?=
 =?utf-8?B?RWtwalFpZVhrekN2Q3pubDBmc0RsdFdzMU9NVmYzT1RVbjRxdTJ2NUYxRU1V?=
 =?utf-8?B?azRvTUV1V3NOT3Zwd3Yra3pRK0NLU0Vab3dBNnJMdk1oL0VMSFZTWVc5UTZ3?=
 =?utf-8?B?VHFCaCt3c1MydG1Bc0c2YkxkaXMzUzBPc3V4NkxsbDQzbVlCaGIyWVJUVlgx?=
 =?utf-8?B?Um4xNTd5eWJQOG5uNk9pb0FhSk5qK1NHRUVXcVJQb1pTT05zNHhGTTBJWHJW?=
 =?utf-8?B?bWZQMjQvbXZnNDhzRnE3ZXkySXlVTVRLRW5VRlpoWGhBT3krSzdwTjhwZFFF?=
 =?utf-8?B?RnZ1WEo5S24rQUtUNGZJNkdWYlN1VWUwQ2hHNXBDZ01RVzJLQWZ4amo0RjIv?=
 =?utf-8?B?YlE4YnpYWFB0YXIzb3JjYWpCZW1lODFQN1ZCTER0TEFhRjMrYmZuUWJhdHp2?=
 =?utf-8?B?dEhLS0JkL0tzNXpFRk9xT3pjaE40bWhhUXh1UUhjQnpQTVdMSjdIRWUxM0Rl?=
 =?utf-8?B?clJMUWVESTE2M2t3NUphNCtzUXc2bmpoRTBJcmc5V3pyd3ZSK0F1WWt0Sk9y?=
 =?utf-8?B?VHJUR1RLZXZYUWl4NkgvZ2lMaTFCL1ZZdFhTMkFNUWVhaXMwdFlZVXBlY3c4?=
 =?utf-8?B?TUU3ZXhCcnV3cmNSK3BQNHVuR1IwdWFUWWJiYWdlZ1QyeGQwM3htdHFoajVF?=
 =?utf-8?B?UlRNRGw4aGYwUlluekY2ZG4zKzYrRXl3aWJXL3RTSWIrVTZGWmZKZllPY3FL?=
 =?utf-8?B?Vkw1bTVkNXZOM21VemMxWkkwL3dZM1B2RU1iWlVvTnpiZ3BWZUZpbCtQdUsr?=
 =?utf-8?B?UkJEbDFIeGFISGNzeFZOWWppWjdaYWx3UEh0M2NIRDRYck9ld3FEcEJ2Njhi?=
 =?utf-8?B?NUEzeHhteVlPVlJad2VUVnpUWU0wcVEwN0Rad1FjQk4vd01ESUgwSVJkV3BO?=
 =?utf-8?B?UUJOMG5ZK0JtUnVsb29nd1k5ZHM5Z1FmVW1PZDY0ZlB3NldEZGRDL3NqdHBE?=
 =?utf-8?B?K0dOcy9qK2lmZk1SeWlFc3Y3Ry9ESW9UY3BGRDQvRXFSYTJubCtjRmlDc1A5?=
 =?utf-8?B?SVk0K1dJb01vSzlmZm5UUTEybFFPeEtiZkhvQ0FpYnNna3lvT3FUTnhQWktT?=
 =?utf-8?B?U2dvVitCSGRlM1hTZVhxOTY1Y01rNG5FRWRjcXdJRldSVkU1NnE1Y1RPOWhC?=
 =?utf-8?B?Q1dPWUJqQjJ1T1NFU2lDQURVTVZrNFZOSzE5YVBPT3phZ081V2VDbDFHUFRK?=
 =?utf-8?B?RERRMW5PckNwdmxMYTkzbnRkdjd5YXRteHoyOEFRaW5CZFIreXcvZ1lVOEQ3?=
 =?utf-8?B?dFhIemNyTXdjUTdQN3dhZDlnTWdqODhEclFOcDZ4WmxFa0U4aVlZd3JodDVQ?=
 =?utf-8?B?cEVla1VHQ20raks5aXRJTVIydlp0c1RkVld5MEQ4TFY5czd6a0J5cVFycVVW?=
 =?utf-8?Q?P9igYiFtetddr+2XqaeM1dn1WZmew1xOWreYo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aVBZeWIvM081dktZWkRwejgrVUE5SFhQUC81cDd6VVpFczByR3o5aWZuNjdG?=
 =?utf-8?B?QWUvaUZ1Z2RWOU9IdFgyamVFRXZRc0p0TU5zMWhJVHpWaGVmSnYzNENTOHNt?=
 =?utf-8?B?UU5RdXNzUWg2TzErSUcvdFkrckRJUjRyVW90MHJnZjNWY3RtOXEzTURSamp4?=
 =?utf-8?B?KzkvMnZudE1WemdCdXZjSHNGNHhXQU5Hei9mZVVaRXMrVCtJVGY0RlVIbWdK?=
 =?utf-8?B?d0VMbERzWTVRTHg5VC9IVnloSzM1aW1jYmRuNytMUTVxVUF2RnBEWUhQQ3hF?=
 =?utf-8?B?UzFFZXVMVnF1bmtnT0hqM0VvSmtKRnN5eXM4Qk96WUsrMWFFYS9sWEpwbHJk?=
 =?utf-8?B?SWdRT0JLTXUxM1FleWNZYldOMFRiemZYcnd6RGFhQk1LZURzdEZvUVFFOHlx?=
 =?utf-8?B?cFpNanU1eFIxN1pxbFZEUmtONmdWeEhiRXhGc05jUytWbVJHZS9MdnNvR3No?=
 =?utf-8?B?ZWR1aGJNOGdVUlQ5MXdlLzBwSWpoZWk5bkpnNUVxenNoNzR3THBNVHp4SHhN?=
 =?utf-8?B?enE1WDlnU0xIa050S0ZTRnZVYzEwbDcvUm5ERnBTZUJRRmk5VXFNOGJDeTFH?=
 =?utf-8?B?S3FTbVNudjRLU1N1dGlBM2w1QnJVR0grbjlVLzBlMnF1Zm9tVlFHNWI5cXFI?=
 =?utf-8?B?VkpTSnk5QVFyYmVzbUlmRGJvdytjalVacG83ZE91Q0NWbUFGRStxeXNPQ0pI?=
 =?utf-8?B?bXFISGQ5S1dxSTBwVU1CZEFBbElvamNDMThHNWpxaStBa0FhWXZyUDJobWdl?=
 =?utf-8?B?YmVDYmxaUmRCSnp6TEppczR6d2xDZnY1SG82KzhuQ0tkVHVMYzlxWGZnck1B?=
 =?utf-8?B?OEsydkZFdXY1WFRxNmR4V2kvTGlvTWZOMk12TUR2Nm1OTmFVYmlVd3Y3V3Z5?=
 =?utf-8?B?WGRFTFgxYi9HTmFHWHlrWUp3bjd0STdLcjNwQklrMTlPaDh1SXEzWDh0ayt3?=
 =?utf-8?B?VEVMcjRjbklvR04yM2dKdWVPQTVpbDhoRldXYWdvTkg1UDZ2TndvVWF4aHpM?=
 =?utf-8?B?ZWwwc0UrU3lLeFJlQm9yWDRrTE5JKzEwbDlWdU80d1hQRGViSlUwNkVmM3JI?=
 =?utf-8?B?MVU2Mk9pWUk1dVpaTjJIcmFMSDJNR0RWbU1tMC9JTmYva0FEWmEvcnEyY3ho?=
 =?utf-8?B?bzB6eUlpbHhzVitTT3BKeUUxdWMyQUVySm1wRWhPMTgreVlWMFRWalNBd1F0?=
 =?utf-8?B?MHRsRW9wemtBNlBpQk51NEx0R3QwSzB1VWJnQWU2NmI0K2trdGhmZHBaUTEx?=
 =?utf-8?B?UGQ3b0ZGck1HR3B0MmhPNkkyUmlMK2cySHVXcktYcEQ1K3JZbzZFTmZhbndj?=
 =?utf-8?B?U1ZaWGVDVnZjb3lQQ0c3MGVtUkxOaWU1T1BVZkcvUVEvdGlZV2dTcnEybGQw?=
 =?utf-8?B?Y3BMT2Jkb2Fab1JmSlpSRHFvQTVEU1lveHYyL2xtN1lnaG1XWmpCMnBzaEFU?=
 =?utf-8?B?Uk9ia1VsYnRMeTdVZi85bzIwUG1OU000MnlTNlBpeGhTOUMwQ085clZjNVpL?=
 =?utf-8?B?RUNqRC81N3RWZUxFTVZJQUo4bWdLQjRQRHc5K1M5Q20zdEE0TFl2UDFKYWVV?=
 =?utf-8?B?N2w1WldGMk9yT0E4S24zUUp1c1RLUnVlNE1OVUFVendOVXdXRjJXYjRBbHZV?=
 =?utf-8?B?cThERk9acE1FVEV2aytJQXRuSzY3YndnMjJMY2hoUGlHT1FzRlNBUG0yZXBm?=
 =?utf-8?B?YTdvN2FNQ0o2UmlHaXR4QmYzWmRtVXZFQ29zYjl1QVlOb0dmOUhOMGdKRk5u?=
 =?utf-8?B?RFc4ckp0UFpJRGRYTWNZaHBsVERJTEJGZHZiVE9qU1lKWi9LNFY3dy9ibWdp?=
 =?utf-8?B?ZEptSjZGcG0zTzNKZ2Y0TVdHN3NrbGZKck9OcFE0OFQ1ZStCY1BEZ1FFd0JL?=
 =?utf-8?B?aVVjVHpxMENDcmxWejdCMWthMlViWFFsbkhLcDZlM0JHSkJNNUdCdHF6bDk1?=
 =?utf-8?B?RXdYdEhFSGRjVzV1QjhPYXRCSldGTmNUSGhBQTdvYTRVRnBWNndwN1oyZEY5?=
 =?utf-8?B?SXR1SzVPSVlUYzIySHBnb0RFNm8vSkx1OHdIZkJmckx2ZS9qNk1yK2h5bXQv?=
 =?utf-8?B?NUhpSlhWSk9pcENRNTd0aDlkenpubEs0Y0JMdy9UWGZrS3V2cUJGMnVudk9h?=
 =?utf-8?Q?LTgE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3221E5689F86A641BC962F5A7995D747@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 255b6c10-c344-48aa-8046-08dd085f2252
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 05:58:04.6763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3DoDjRD8d6RfqT2EEkknHZOWP2MdYsT35076XIDkwwC5VW0/ZCIkZB0TO5MVZH7emfaf9wSEGBhAafIbZlePXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7317

SGkgTVNUIGFuZCBNYXJjZWwsDQoNCk9uIDIwMjQvMTEvMTkgMDA6MDUsIEFudGhvbnkgUEVSQVJE
IHdyb3RlOg0KPiBPbiBXZWQsIE5vdiAwNiwgMjAyNCBhdCAwMjoxNDoxOFBNICswODAwLCBKaXFp
YW4gQ2hlbiB3cm90ZToNCj4+IEluIFBWSCBkb20wLCB3aGVuIHBhc3N0aHJvdWdoIGEgZGV2aWNl
IHRvIGRvbVUsIFFFTVUgY29kZQ0KPj4geGVuX3B0X3JlYWxpemUtPnhjX3BoeXNkZXZfbWFwX3Bp
cnEgd2FudHMgdG8gdXNlIGdzaSwgYnV0IGluIGN1cnJlbnQgY29kZXMNCj4+IHRoZSBnc2kgbnVt
YmVyIGlzIGdvdCBmcm9tIGZpbGUgL3N5cy9idXMvcGNpL2RldmljZXMvPHNiZGY+L2lycSwgdGhh
dCBpcw0KPj4gd3JvbmcsIGJlY2F1c2UgaXJxIGlzIG5vdCBlcXVhbCB3aXRoIGdzaSwgdGhleSBh
cmUgaW4gZGlmZmVyZW50IHNwYWNlcywgc28NCj4+IHBpcnEgbWFwcGluZyBmYWlscy4NCj4+DQo+
PiBUbyBzb2x2ZSBhYm92ZSBwcm9ibGVtLCB1c2UgbmV3IGludGVyZmFjZSBvZiBYZW4sIHhjX3Bj
aWRldl9nZXRfZ3NpIHRvIGdldA0KPj4gZ3NpIGFuZCB1c2UgeGNfcGh5c2Rldl9tYXBfcGlycV9n
c2kgdG8gbWFwIHBpcnEgd2hlbiBkb20wIGlzIFBWSC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBK
aXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEh1YW5n
IFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8
SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50
aG9ueUB4ZW5wcm9qZWN0Lm9yZz4NCj4gDQo+IEJ1dCwgdGhpcyBmb2xsb3dpbmcgY2hhbmdlIHBy
b2JhYmx5IG5lZWRzIGFuIGFjayBmcm9tIFBDSSBtYWludGFuZXJzLA0KPiBDQ2VkLg0KPiANCj4+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3BjaS9wY2kuaCBiL2luY2x1ZGUvaHcvcGNpL3BjaS5o
DQo+PiBpbmRleCBlYjI2Y2FjODEwOTguLjA3ODA1YWE4YTVmMyAxMDA2NDQNCj4+IC0tLSBhL2lu
Y2x1ZGUvaHcvcGNpL3BjaS5oDQo+PiArKysgYi9pbmNsdWRlL2h3L3BjaS9wY2kuaA0KPj4gQEAg
LTIzLDYgKzIzLDEwIEBAIGV4dGVybiBib29sIHBjaV9hdmFpbGFibGU7DQo+PiAgI2RlZmluZSBQ
Q0lfU0xPVF9NQVggICAgICAgICAgICAzMg0KPj4gICNkZWZpbmUgUENJX0ZVTkNfTUFYICAgICAg
ICAgICAgOA0KPj4gIA0KPj4gKyNkZWZpbmUgUENJX1NCREYoc2VnLCBidXMsIGRldiwgZnVuYykg
XA0KPj4gKyAgICAgICAgICAgICgoKCh1aW50MzJfdCkoc2VnKSkgPDwgMTYpIHwgXA0KPj4gKyAg
ICAgICAgICAgIChQQ0lfQlVJTERfQkRGKGJ1cywgUENJX0RFVkZOKGRldiwgZnVuYykpKSkNCj4+
ICsNCj4+ICAvKiBDbGFzcywgVmVuZG9yIGFuZCBEZXZpY2UgSURzIGZyb20gTGludXgncyBwY2lf
aWRzLmggKi8NCj4+ICAjaW5jbHVkZSAiaHcvcGNpL3BjaV9pZHMuaCINCk1heSBJIGdldCB5b3Vy
IEFDSyBhYm91dCB0aGlzIGNoYW5nZT8NCg0KPiANCj4gVGhhbmtzLA0KPiANCg0KLS0gDQpCZXN0
IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

