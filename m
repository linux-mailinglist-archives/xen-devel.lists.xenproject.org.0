Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3B4A1D0DC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 07:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877431.1287572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcISk-0001TI-UT; Mon, 27 Jan 2025 06:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877431.1287572; Mon, 27 Jan 2025 06:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcISk-0001R5-Rm; Mon, 27 Jan 2025 06:19:10 +0000
Received: by outflank-mailman (input) for mailman id 877431;
 Mon, 27 Jan 2025 06:19:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50Ot=UT=eviden.com=clement.mathieu--drif@srs-se1.protection.inumbo.net>)
 id 1tcISj-0001Qv-PJ
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 06:19:09 +0000
Received: from smarthost2.eviden.com (smarthost2.eviden.com [80.78.11.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dfe28a9-dc76-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 07:19:08 +0100 (CET)
Received: from mail-norwayeastazlp17013076.outbound.protection.outlook.com
 (HELO OSPPR02CU001.outbound.protection.outlook.com) ([40.93.81.76])
 by smarthost2.eviden.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 27 Jan 2025 07:19:07 +0100
Received: from AM8PR07MB7602.eurprd07.prod.outlook.com (2603:10a6:20b:24b::7)
 by PA4PR07MB8792.eurprd07.prod.outlook.com (2603:10a6:102:266::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 06:19:05 +0000
Received: from AM8PR07MB7602.eurprd07.prod.outlook.com
 ([fe80::fbd7:ca71:b636:6f9d]) by AM8PR07MB7602.eurprd07.prod.outlook.com
 ([fe80::fbd7:ca71:b636:6f9d%7]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 06:19:05 +0000
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
X-Inumbo-ID: 9dfe28a9-dc76-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=eviden.com; i=@eviden.com; q=dns/txt; s=mail;
  t=1737958749; x=1769494749;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dMoMtMlz3GxWv3/X28rMpuYtMbtTb6eezMZZCUrs0IM=;
  b=vnyADmJkDMlhZy5/4KphcDvh1YucSIHGRPus1rqOq8MKfAGSSswPqWec
   JhQ9W/e85LzKd99gaXQaC79luPf8DMdfssRTL0Rv5L8sJKhC65dDXRKMI
   TuZcJJBuOaE4MLpBlUd+/FgRGOO8CXAe4p9GOKhYGsZ/1ku1uzBog4bAL
   E/i4FWT+ukYDObNpV/1K3JDRaraLnl5a2yP4nbijRLNrvu9zOaXWASq4r
   vZDN/JTv3Bqd5QhRT4m5t3dXXuSLfN0Gz0iS0DREaapKIMLLB9q3zo3Er
   wHO1cUB62nPMAVre7V4G26RTluObKgzuhHtuO8wA/84S7AKBUSJqC2XS1
   A==;
X-CSE-ConnectionGUID: 1j7MsqVgSjySF9o4kFr5oA==
X-CSE-MsgGUID: tLZX6sjSTl2ri1xvGei7bA==
X-IronPort-AV: E=Sophos;i="6.13,237,1732575600"; 
   d="scan'208";a="29555075"
X-MGA-submission: =?us-ascii?q?MDFyddhe/Na/XSsvQcRUD5Q7znYihlPYdc3azK?=
 =?us-ascii?q?68+m0BIfMTf/RZg1WkjDvXPzBGKfmw08EqHxgtLIpPsoVeOa9FR0C8J2?=
 =?us-ascii?q?0ofgSdArny2acC7YtGdJfj7aHCJ1NVYzSBdB6H3HZUMbA+K0r1SQz3fy?=
 =?us-ascii?q?2VgE10wRYoxiGyYy9zgRbhYQ=3D=3D?=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFqBLTAaoNuQLjtOy2HvByo+5bu24OrNWdvapImWsKpOtJA2U++J7lEVgZwItDch/3X0iZfiegYO0P6mCP6Qq8FjAJBrHLJjdE8GOd9UspW/m2AOreqns1ndsOvaO667g53yqGS/J0/i5k2Uyxg6V/ATOFQmL+XTjuMYMVA7EVZXy3dRs86nct/RX1EO8hSP7VVxQtt/uAKulEVFnG+WfOJdswGCmIHAVSfu1QQsHCbADeWJIEt2XFtXdOznGOViK6sPiGt2pTvDqdy4SUWdLj3Y/tD5OiQJXIfRRtbbCFpxQ0wxbCenxfPTbjUxduElW64yxEP0qJUvIOMPerkXxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMoMtMlz3GxWv3/X28rMpuYtMbtTb6eezMZZCUrs0IM=;
 b=q3rlys+4ZLaMkIVPMdUi4HjE4tPadM2c5y4amqGRJzo5hk1xsAF4LMQBIQiHKMs3zJefeqfe8fejAt+RrOGIvt0aU2ZcgniQZpCYOhTaE7HX+jShLuLYTdPLBJnN9HETb1fMYBHb9OnZ6y+20KnTOEJPwgm4qIGSmcx2YTnbWrW/MglPaHj3uZ+Z2af/5xmrAAaWalroXHGI7LjfJjKdzFnoWwiLBzxvZ7Ql0zi9fkNOxLiCH5eWA8rbIMX+rq0dNL9FZLvemGrl9hLvk3W8OB21MOe1wPTmI2+hiUk4LBVSLe6s86WufzbD2wKNPBC3I+1VJADAa0jh2PqZ3hLLjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eviden.com; dmarc=pass action=none header.from=eviden.com;
 dkim=pass header.d=eviden.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Eviden.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMoMtMlz3GxWv3/X28rMpuYtMbtTb6eezMZZCUrs0IM=;
 b=rzRZP3tbMUspWp6jePS6J4juK45MVVnT2oXQ97HwIt2URmfCv3BHron2tdXI2YHz/g0YSW1zGEKpVvIFK85QPN9dgJFT9b4+Ucmwg6UNCRNq0pqfj2BCnCvytp8LGwhnYxFrP7TjXpB1DHs0gCEke1UJPggWjd6N/RVvaOZ1kLWQ8i6CcxqPS/n79FlxbW3W6HolRLWJ4uhVABuHORejxVGZmWomDL8QWU3nbteyakCkU2eK8oP/N6mwccCw34IzQN6voWrJvbe+A+3oebTL3uT8dBsWMZCPnmP90ZMk/39PfSnRkE+2ntCYNBlwyw6MKpaUeIzA7kFUM+OZGZmiqQ==
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
Subject: Re: [PATCH 3/9] hw/sysbus: Introduce TYPE_DYNAMIC_SYS_BUS_DEVICE
Thread-Topic: [PATCH 3/9] hw/sysbus: Introduce TYPE_DYNAMIC_SYS_BUS_DEVICE
Thread-Index: AQHbb1TqeocQ1Uio5UusvHnGsHg3IrMqJ/wA
Date: Mon, 27 Jan 2025 06:19:05 +0000
Message-ID: <51ae5676-cd6a-4524-a958-0840f6daca06@eviden.com>
References: <20250125181343.59151-1-philmd@linaro.org>
 <20250125181343.59151-4-philmd@linaro.org>
In-Reply-To: <20250125181343.59151-4-philmd@linaro.org>
Accept-Language: en-GB, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eviden.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR07MB7602:EE_|PA4PR07MB8792:EE_
x-ms-office365-filtering-correlation-id: 55069c99-6789-4479-003c-08dd3e9a806f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RWVjVG5vVTU5dUYzTGpmbUlsYlphdnFTL3RlRjhjTVloRWZPdWR3N2d6c3Ni?=
 =?utf-8?B?ZWVBaGY4QXNnTTAvNVF0VmN3VFA1ZFkyTmpRbDFScmRVaVNWQXpUbTRKNnBX?=
 =?utf-8?B?aGQzOGFQZXJ3RzBpUDc2WjNvMDZhTUsvQ0cvbmFRUjNJbEQ3Y1ovejBMM2x5?=
 =?utf-8?B?OTZRK3Z0RXVsTTRURkg2RC9IYzZiZGc0d3J2WU96YVV2b2lJTnNIVncyYzNr?=
 =?utf-8?B?RjRCMWt2alpFRDNaMGFZdlVBMXBZTXZJb0VmTU5tcGdJR3VQcWxqdkFzTjJI?=
 =?utf-8?B?NXNiTFFZbXJiUEE4eUp4MGVJVXJWbUh6NWU2RjROZ1d6UFM1b1BHaHdMSXZQ?=
 =?utf-8?B?UW1PckNycmsyMTVOckZoOHJPVWtIMXMzY25FSWtTa05tMGs0eVJyWVlNVkJi?=
 =?utf-8?B?cWg0TmdVUUZybXUyQ01uMC9EWC9NZ1AvWFplL0tmMVNMbHlFNkFyVGcwUHRa?=
 =?utf-8?B?czN5Uml0R2ZMYmk0YVVoRi9KdnMvSER3M2o3bWFjTE42V3cxTzZHSVJvNUMz?=
 =?utf-8?B?ODVoSmFOZlpOZVNWK0lVNENjTEs0dFFGRElxWWhvcFBEYmRBU0RLeWlHN2Vj?=
 =?utf-8?B?Uk93Y2djYnl0akdnRWhQUTFtRFFmRDZyUFhHMjBMWUIzQWV5L0pSRjlRL0xS?=
 =?utf-8?B?bTExUVAwU2pwZEJUYUlkRkFEejNpWFpJdmluMTdUR1VYTHVpRE5vNlQ4V0wx?=
 =?utf-8?B?Z0ZZMVdCWm5GYkVVTURCenVpUzRaS1NaNXRpSWEvT2d6NUJGcTFnU2xFbHJS?=
 =?utf-8?B?QXdTQXI3NWNKM203bUhUYjdHSmczRWZvR0U4cnA3VUNPc2hydzRhYWFkUXEv?=
 =?utf-8?B?R2JUTWo0aWFQMnAyaVQycHN3Q0l3a0NUTDh1OVo5cFBDSzltWVNDNm01bklR?=
 =?utf-8?B?dTl2K0ZJMTY0UE1GU0Q3SUNxSDBlL1VCNkEzM1I1ODdkRC84akV0WjM5ZzAy?=
 =?utf-8?B?T29CemtRWUpyOHpUWVIxWXd6MG1RQnhCTzFUVDlVUHF3aUYzMERBaDZaRzd0?=
 =?utf-8?B?b0QreEkyOXFuVDYxUkVWVVdycWx0MTNjamViWmtoV0NzTXBvZHJpSzh0MWRw?=
 =?utf-8?B?Qm1icFFKZk9SaEFVNS9ZclZRa1lybEs4b01hMkRIV3gzeWprYkJrYUI4UlZt?=
 =?utf-8?B?VHBsdTdPRGJtSXI0SUtYVkNBclpXZTdmQ3dOV2M4SGkvcTE1cVNyaWhTU2Z0?=
 =?utf-8?B?bWZIcWdyY2g1Nk9xT2lOd3liVndITHUvOExDWklrcy81dlBPMUdCMGs1SFp6?=
 =?utf-8?B?WEN3MGVhTTBhcWpnMTRJMGlIbHZkUmNlUThEdEs0eFlQRUEvWTRJU2VWTmE5?=
 =?utf-8?B?dzRlZ2U4NzN5VWlYbDVPMXFtTUFHK0pEclY4VFJBa2h5M0RSdXA5TUlqalFJ?=
 =?utf-8?B?MkFxWFZhVDBMZ3ZIc00rMUltRkJVR0twRzUySC84TVhWZzZaNW1zVFhxU1du?=
 =?utf-8?B?b2cyR2Z1UEdSbzNYeU1td2hWbFZmSzNCc3hEQjZ1eGVhQ2FScjcrN05PVmoz?=
 =?utf-8?B?MWJtVWFBUGdZRW15S09GOG5ZVWpGMkxjbGhoYTM1VlR0ZGhkemtIaEFZZDlx?=
 =?utf-8?B?WUV0UVJ2TGxCK0F2T1F0bVMzMVlQeDh6WHoyU3Y0L1RKNFhCbVFFcXFXTGlo?=
 =?utf-8?B?Myt6RDFhbXNSVms2VTBTSGdGbW10NFZNVERYdmRxcEVBekNWK00rTjlsVnVz?=
 =?utf-8?B?SUgyR21LdHJpalNxWXRaUlRubjZLTVk2NWFCa1BHN24xdXBBSDZuc1FrU29K?=
 =?utf-8?B?MXprNE1NLzlZOFA3SlpQdXVNTm5xSG44eHh5S3gxQ0NVd2V3eUlFTWYrbWRz?=
 =?utf-8?B?cUJzSkFtMnlIdFoweW9ucVpxV2x1aFg4VDk3cGVtSWlBQVJ0ZUh2a0VWMzlz?=
 =?utf-8?B?M05sZnF5TVRXR3JNcHRmTEVpcWlGN1lEblNidVIwVERqdlBPcU1sWU53SFB5?=
 =?utf-8?Q?LKisISsNUR2FESkxyEnKbj1tf17P0jgu?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR07MB7602.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N1EzZDhHcXhZMTZuN2xBVGFsbWFJUWs4S3laVlc5NU85NXFjU0VkV0t2eGpy?=
 =?utf-8?B?SXgvYnA4blJUejkwYndSL25VS0FDbnowZWNxc1M0T2pKSG1mNnM0Z1RNSFpJ?=
 =?utf-8?B?WmdqLzZhVGhxbmNMTWJWOG5kQVdEa2RBRDB0N1lkRlIrSnc1ZlM1V0g2NERX?=
 =?utf-8?B?clBTS3M0REFnMTQwM2YyNXZtVzlUYWFML2NIUlZXcndud3VtSktnT1EzTkxq?=
 =?utf-8?B?YzlJcFlvVzNkUkpMbjZ4cy9zcWl4UHk2cS9ybDFIRkdBdGViN1h2cVpWSXRv?=
 =?utf-8?B?N2V2ZjZvZzVOS2RLeHAyZ09wNWd3UTVIcTRqbzg5Zjd4WjlKNWhnZ1l3bXlK?=
 =?utf-8?B?Zm1CTGQyV0VaTG1nZVNXVzN3dkp5VWJvbXdodGdEcUpzOUFEbVBvT3p0eEhK?=
 =?utf-8?B?MUR3bWNrdE45RUdnYTNTZ0JreC8ybm11VkZ6K3B0Y1FCY2M2RDZDSzYxTlFm?=
 =?utf-8?B?U29pQktyeSswNXNiZkFQM1RVTkwrYVczK2FSRWtZNTQycjNmYkQwdUsyeTJ1?=
 =?utf-8?B?NDNLWTZzUDREckJZclVwY0pqR3JTY290eUJMZXZmcmUzSnUvNmpGWHB3aWs1?=
 =?utf-8?B?V25IVlJTemVURERUUkh5RGVTVTZrZ0N5RFQ0eXpiNE5rRTR4cGRWa0NRL2xC?=
 =?utf-8?B?WlF2bm1oMlpzRGhZQU8wdE5ZS0M0RmVyTjVlR1BBaXNtbXRqc3A4VGZabHNn?=
 =?utf-8?B?YnNtVmx5MjdobjZublhDWGYydy82aUF6a3JOV3YybEFmbnVOL3IrSGNnUEF4?=
 =?utf-8?B?aHJCd2kwK1RXL1JLTkx5YTZLTVBMWEdIZDNPdC91Ri9wUTNuWDBVR08wQjZx?=
 =?utf-8?B?MmtNMnA1OTFCSld1UlZwbEtBWTdlcFJLNlR2UFNOaGcrV25sUnBiNFFxSUhK?=
 =?utf-8?B?RlVaUG1wOWpxZVBTSURrTU5zWWpoZWNHWUtrMnUzWWQxZ21aaW1kVEVOWXZZ?=
 =?utf-8?B?L0QyYThMV0h6dkZNU2FRbHVwWGxoWVJVZEFjVnFKQUROMmlydklPSFNjaE5G?=
 =?utf-8?B?SC83UHBpSkdtZ1d5R0NGdjNwMGI3MVRBUDJwSkZHUWl5Rnhyd1lxc0cxSWpz?=
 =?utf-8?B?d0hTMS94ZDYwa1A0elIxeEdJV1NnT1A5Yk01RkVyVmQ0b0greW1tc2hCM0dN?=
 =?utf-8?B?aDlMSDJJbVZCSktkOTdFTjhzWFBPKy9IZEVCejBIQUlDTENYMUVjTHc1Qk9R?=
 =?utf-8?B?TmVNN3gyQjM1U1h0TGxSb0JEdVl6UUZYUUVFY2l1U243a3hoT2pIVjR5a25C?=
 =?utf-8?B?SXF3WFVsWUxYWHNBYTlVMy84MjZqQ2FIU0l3L09LMVE1VnV5YUNzaFNpY29L?=
 =?utf-8?B?aU1KNU0xcjIvYmJOUzk1THNmN0NLSGErVWNDNGhVcWVYLzZrdHhScFpEYy9x?=
 =?utf-8?B?dGxJTkFkRzBRdS9JSVJkU052OWJrRjF3bm1Jcnkrd0EyTGRzMVpGS2lrZlJY?=
 =?utf-8?B?djkzaG1yMHErUzRjYmZIV29EMFpuQ1dhSFVPc0M5M01sY040K0RnOExtZkVu?=
 =?utf-8?B?d0RDQ2JzU25tdnMyLzNhdU1SdGNrd0pNWVRlcFdXbUJkRHhBTm1COFBGWW9m?=
 =?utf-8?B?NStsVktHU3ZNU1pMUmFDaUlXNVdMRGwwTFNxUzlyemFnOWVuc3JsVEc1SStT?=
 =?utf-8?B?eGZLRHE0UTRsZTFaQU1QRjR6c1RvTHhiMmUrT1MwTGh5blBHOXNhS2ZJdnVm?=
 =?utf-8?B?bHNUSDBHUlZJWEtYSjdDRk90MWJFLzJpd1h5U3k5TEJETmFkbDUwOWorMXpR?=
 =?utf-8?B?aGg3Y3lVV0lZQzVDcUQydzRaUHRCTzlmaTFTOFBmSm9aUVNnK1JRUUJwcjkr?=
 =?utf-8?B?SGw4aktwRUdkNkJRZHpWVkN1ZnlOL0oyZDJKOHdsWWNmSWJUWFo5eDJ1ZTNr?=
 =?utf-8?B?c2F4YldiS2RVdzVyRndPMVR4bFMzRUxPSnQzKzV2NWl2VTRKV0RDdXVFU3dq?=
 =?utf-8?B?dGhDK1Fydm9SZ3VPdk92YnJFV2lRYVFwYzZvUEozWEJ4L09EZEhiL1UxVk9k?=
 =?utf-8?B?NFZXTE9LNjhLdEtGVzYrSjJZSDRzdHcvd3hnUEx3WkRZV3oxY2RPRnFqVzlU?=
 =?utf-8?B?a1V3eDllOUVxZ3c2aXoxVnovZVQ5WGhyRWxveXpodE5aN285Zy9VdHhHTHd4?=
 =?utf-8?B?b0xTR0loNGpiOUwwZHRoMlZoWHFVZzJCekFHZ1R2eDN0RVRxTVUvZUhNMnBh?=
 =?utf-8?Q?TPMQ2UF5S1b/30LxTenZnnU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1727EF0379D2344D9454C2E7B5BFB77F@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eviden.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR07MB7602.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55069c99-6789-4479-003c-08dd3e9a806f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 06:19:05.7076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7d1c7785-2d8a-437d-b842-1ed5d8fbe00a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pngV+PB33VPp0FHdM8ru/fOTF3ykY1HbDTcpyVFj5vZSsWqDI6B7STT9g5sfFM487EJX2T2kfqmoZg27/dw6PRAiuf+H9MTvpiN/r5nG2EDLHHnOZ0AzxKHAf6jKJCF8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB8792

UmV2aWV3ZWQtYnk6IENsw6ltZW50IE1hdGhpZXUtLURyaWY8Y2xlbWVudC5tYXRoaWV1LS1kcmlm
QGV2aWRlbi5jb20+DQoNCg0KDQoNCk9uIDI1LzAxLzIwMjUgMTk6MTMsIFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIHdyb3RlOg0KPiBDYXV0aW9uOiBFeHRlcm5hbCBlbWFpbC4gRG8gbm90IG9wZW4g
YXR0YWNobWVudHMgb3IgY2xpY2sgbGlua3MsIHVubGVzcyB0aGlzIGVtYWlsIGNvbWVzIGZyb20g
YSBrbm93biBzZW5kZXIgYW5kIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+DQo+DQo+
IFNvbWUgVFlQRV9TWVNfQlVTX0RFVklDRXMgY2FuIGJlIG9wdGlvbmFsbHkgZHluYW1pY2FsbHkN
Cj4gcGx1Z2dlZCBvbiB0aGUgVFlQRV9QTEFURk9STV9CVVNfREVWSUNFLg0KPiBSYXRoZXIgdGhh
biBzb21ldGltZXMgbm90aW5nIHRoYXQgd2l0aCBjb21tZW50IGFyb3VuZA0KPiB0aGUgJ3VzZXJf
Y3JlYXRhYmxlID0gdHJ1ZScgbGluZSBpbiBlYWNoIERldmljZVJlYWxpemUNCj4gaGFuZGxlciwg
aW50cm9kdWNlIGFuIGFic3RyYWN0IFRZUEVfRFlOQU1JQ19TWVNfQlVTX0RFVklDRQ0KPiBjbGFz
cy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBs
aW5hcm8ub3JnPg0KPiAtLS0NCj4gICBpbmNsdWRlL2h3L3N5c2J1cy5oIHwgIDIgKysNCj4gICBo
dy9jb3JlL3N5c2J1cy5jICAgIHwgMTQgKysrKysrKysrKysrKysNCj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDE2IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvc3lzYnVz
LmggYi9pbmNsdWRlL2h3L3N5c2J1cy5oDQo+IGluZGV4IGM5YjFlMGU5MGUzLi44MWJiZGExMGQz
NyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9ody9zeXNidXMuaA0KPiArKysgYi9pbmNsdWRlL2h3
L3N5c2J1cy5oDQo+IEBAIC0xOSw2ICsxOSw4IEBAIERFQ0xBUkVfSU5TVEFOQ0VfQ0hFQ0tFUihC
dXNTdGF0ZSwgU1lTVEVNX0JVUywNCj4gICBPQkpFQ1RfREVDTEFSRV9UWVBFKFN5c0J1c0Rldmlj
ZSwgU3lzQnVzRGV2aWNlQ2xhc3MsDQo+ICAgICAgICAgICAgICAgICAgICAgICBTWVNfQlVTX0RF
VklDRSkNCj4NCj4gKyNkZWZpbmUgVFlQRV9EWU5BTUlDX1NZU19CVVNfREVWSUNFICJkeW5hbWlj
LXN5c2J1cy1kZXZpY2UiDQo+ICsNCj4gICAvKioNCj4gICAgKiBTeXNCdXNEZXZpY2VDbGFzczoN
Cj4gICAgKg0KPiBkaWZmIC0tZ2l0IGEvaHcvY29yZS9zeXNidXMuYyBiL2h3L2NvcmUvc3lzYnVz
LmMNCj4gaW5kZXggMzA2Zjk4NDA2YzAuLmU4ZDAzZmQyOGQ5IDEwMDY0NA0KPiAtLS0gYS9ody9j
b3JlL3N5c2J1cy5jDQo+ICsrKyBiL2h3L2NvcmUvc3lzYnVzLmMNCj4gQEAgLTMyMSw2ICszMjEs
MTQgQEAgQnVzU3RhdGUgKnN5c2J1c19nZXRfZGVmYXVsdCh2b2lkKQ0KPiAgICAgICByZXR1cm4g
bWFpbl9zeXN0ZW1fYnVzOw0KPiAgIH0NCj4NCj4gK3N0YXRpYyB2b2lkIGR5bmFtaWNfc3lzYnVz
X2RldmljZV9jbGFzc19pbml0KE9iamVjdENsYXNzICprbGFzcywgdm9pZCAqZGF0YSkNCj4gK3sN
Cj4gKyAgICBEZXZpY2VDbGFzcyAqayA9IERFVklDRV9DTEFTUyhrbGFzcyk7DQo+ICsNCj4gKyAg
ICBrLT51c2VyX2NyZWF0YWJsZSA9IHRydWU7DQo+ICsgICAgay0+aG90cGx1Z2dhYmxlID0gZmFs
c2U7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgY29uc3QgVHlwZUluZm8gc3lzYnVzX3R5cGVzW10g
PSB7DQo+ICAgICAgIHsNCj4gICAgICAgICAgIC5uYW1lICAgICAgICAgICA9IFRZUEVfU1lTVEVN
X0JVUywNCj4gQEAgLTMzNiw2ICszNDQsMTIgQEAgc3RhdGljIGNvbnN0IFR5cGVJbmZvIHN5c2J1
c190eXBlc1tdID0gew0KPiAgICAgICAgICAgLmNsYXNzX3NpemUgICAgID0gc2l6ZW9mKFN5c0J1
c0RldmljZUNsYXNzKSwNCj4gICAgICAgICAgIC5jbGFzc19pbml0ICAgICA9IHN5c2J1c19kZXZp
Y2VfY2xhc3NfaW5pdCwNCj4gICAgICAgfSwNCj4gKyAgICB7DQo+ICsgICAgICAgIC5uYW1lICAg
ICAgICAgICA9IFRZUEVfRFlOQU1JQ19TWVNfQlVTX0RFVklDRSwNCj4gKyAgICAgICAgLnBhcmVu
dCAgICAgICAgID0gVFlQRV9TWVNfQlVTX0RFVklDRSwNCj4gKyAgICAgICAgLmNsYXNzX2luaXQg
ICAgID0gZHluYW1pY19zeXNidXNfZGV2aWNlX2NsYXNzX2luaXQsDQo+ICsgICAgICAgIC5hYnN0
cmFjdCAgICAgICA9IHRydWUsDQo+ICsgICAgfQ0KPiAgIH07DQo+DQo+ICAgREVGSU5FX1RZUEVT
KHN5c2J1c190eXBlcykNCj4gLS0NCj4gMi40Ny4xDQo+DQo=

