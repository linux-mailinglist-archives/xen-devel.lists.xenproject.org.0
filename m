Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIt1EdF6d2n7ggEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 15:31:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7879389817
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 15:31:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213752.1524218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkNcm-0003GU-Bk; Mon, 26 Jan 2026 14:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213752.1524218; Mon, 26 Jan 2026 14:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkNcm-0003Dj-7n; Mon, 26 Jan 2026 14:31:28 +0000
Received: by outflank-mailman (input) for mailman id 1213752;
 Mon, 26 Jan 2026 14:31:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dxSt=77=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vkNcl-0003Dc-3Y
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 14:31:27 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0e67d97-fac3-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 15:31:24 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AM7PR03MB6452.eurprd03.prod.outlook.com (2603:10a6:20b:1c2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 14:31:02 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 14:31:02 +0000
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
X-Inumbo-ID: b0e67d97-fac3-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oc9xzUZvDl+O3xQhyYCCWMGqUt/VRMthQmWlM7NzsIkrbrEj+9kr4DNjwJoSq5s/VaF4nNK1aIEe46qPkJJAh03UG6qwvKAgc8uKvoyVBHscGlbk6wJT6vJ2XIhewfa6ZZl8LSszUef/uYj6HRjqy7fyq6H3DcKacsdAnp6b34RdZVzF+BiIVGlphy7CesHXTOsOTaRVrHHKXIPMDcb/20h8tGM1mCBkD2FNTYmxqKG9n4aG490BrcuG92EILeziAhEiXRFQ2oxihDgcx27tYeoZX6HfVNBYK6YTJ9xk5u+Z7szYD5CPVM7LxYfRNooch33vVckgyfuc4tzgL5LXRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zneMmoVMj1X1i3l98nRNSZVy0dfs74YhMs6wew+SDrc=;
 b=FU0qACP68eJVTLxjREhh6dK/tZPQNVdrGi/xfPVCfot1F0lx6DDtlvbD2BUsJxwk49PmoO1v0pU5AirXCdChhmfeRZc5m8RZI3czh4BbiZpIYgDBUVmDULX761+qgTVc1YGhTVwuiIvnksi4i//Ic9yOhgztLJaP4LmIbyl94bVF9dBcfnpE9g4xMv4Dp4medDC2e03SBIggEvSqJpa1niqWD564zOcUC/+2ThxWpKGT5MfJSYd5InxYlchUlqM5/mtT/kF4GT6GnlJyCcpQsBHg4qMEP2+bMcbPKXXD0C9KMufV/1RIaC2ht1FjBok30cKf/EVvAjqsYMDChgfNoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zneMmoVMj1X1i3l98nRNSZVy0dfs74YhMs6wew+SDrc=;
 b=LGj31zjY2DRpTkJOTGXMpQ8dxTPhVH/5HCNU5RYmIDehTU6qMnHS9UrmPSRRcEf54zG93kftqRcgfhUg1KT4kIyPHyRcnlXqXLPDy1fZx+WL6OiqwWRvYUnXFZ4NVKMOIjATAyxDEw2fGgYc/uvsIz7WXPNi0d+UjfxhSToJJyFqwEpaNPqmYqjVj/mpJJ7ncz1K6s/809/XqoRMckJc9RBSUsbZ7mJZgBRhYEz2S9wSQK1ruZcmaoFG12leiLundaPvKRPO9bz9NzpjCPVcWmVWVIEMgF+mje1G2pA96W/+3/4t3Uws+3lqiBHXk6Fbkubp6oNV9NB1BQWZi50Mqg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v8 1/5] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
Thread-Topic: [PATCH v8 1/5] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
Thread-Index: AQHciwXk/uoXY0zPp0qUEySvGl6zVLVd0bMAgAZ1k4CAAAIlgIAAQWcA
Date: Mon, 26 Jan 2026 14:31:01 +0000
Message-ID: <f1b86fdc-5663-497f-b07a-f1a506c0b009@epam.com>
References: <cover.1769020872.git.oleksii_moisieiev@epam.com>
 <8482f823e945060d1a36469f14f94aa6251e3f71.1769020872.git.oleksii_moisieiev@epam.com>
 <114d2326-112b-41ea-8c32-12b785f8e7a0@suse.com>
 <0df180b2-1e9b-4dfd-b2a9-cbe9b805d114@epam.com>
 <eacace14-4834-474c-83b1-17d91ff37fbb@suse.com>
In-Reply-To: <eacace14-4834-474c-83b1-17d91ff37fbb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AM7PR03MB6452:EE_
x-ms-office365-filtering-correlation-id: e10fc720-2553-4f97-877f-08de5ce787d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZGV5US9YMitjQmxobWFzQ0lEQTVRcVFYMFJqNnJNWXhOZmFlditJYWJRT0lH?=
 =?utf-8?B?UnRlSU0rTGFNUWx4MldDU3NUMXl5VDZlNDJaSWFUZk4yYlkycU1vd3l2Rmlm?=
 =?utf-8?B?ZVRodk85SzN0UzNuR0NqK29GeWV4dVJKdnhWUTkwNFBVclJ2SjArbVBmWWhP?=
 =?utf-8?B?MTBycHliRVQ3OE5OK09pcmZIWDdCcVVwRlpJeUpXZzdGcUJQaUpQbGpyTFVq?=
 =?utf-8?B?Y3NqUHQ4c2xFdjJnWkRaZGRZWmN4QllrdjR1K2dseXhybXpqekFWZThIQVYx?=
 =?utf-8?B?aVErOXRYVnBTOUVBMEtJUGxsT01Kd1BBTnZWc2tUMDF2SU9DWklVSTRyc2ZO?=
 =?utf-8?B?WGlna1FIM0RndllDOXk5K0hQR05NaGpra3ByMS9EM2JnOThqOTRpcFdoejQx?=
 =?utf-8?B?cTdZNmpycTFtd25MemVsNHhVWWxvZ01ZRzRIMnJ3d2pCNll3ZTZPQndPYzVG?=
 =?utf-8?B?STVSRlNsZFplNW83TWNYZnJXTFJ1Qy83MjI3TThzVUpCYkoxK3lKcWtrRWJa?=
 =?utf-8?B?QkJ3OWFXSHQ2MEF6cFRIeFJMV3krV25ybHkvVlp2ZmJ1YWtwVjJIeThtMHNw?=
 =?utf-8?B?S3JNbXNHbWpickw5NTErNDhUSi9INkdWYjBBM29vWU8rRnJtSFdMTUlNZjFm?=
 =?utf-8?B?Z3o5TWlaaHVjNEJOdzBZVEw2a0E2ZU9odmNUS2ZFeEFabythdUZMSnpWU0oy?=
 =?utf-8?B?OGgxSytGMW9pTjBiVXk0UUt3RllQaGwzcm9qTURBamorZ3NHZWxZL3JaZ3hM?=
 =?utf-8?B?TndlUlM1aitwTWgzMDAvNjdGTlM1UU9Qb1dweG4wVU9BS0hQcXVVcEdXaUZT?=
 =?utf-8?B?d1RSMmx4SGVDWHRCMFhCcnNZTWlkeTFoK1ViWnplNWhUN0VvNlJvcmNFWTd5?=
 =?utf-8?B?ZTByLzdBeU9FRUgzbmZtMSs1OUx1QVZidjUwN095Qld4Z20zTlhBVGJXY2R3?=
 =?utf-8?B?TzdjdmpyMCtoVW5jdDd4STE3V2pQNmZ3U25nWWp5Kzc3UFA4a1lYUElvRWJz?=
 =?utf-8?B?UDRUQ2VKWkYrYTRyT3luekMzT2ZmdDBLSUtvNGtob25rdFRCdE1KL2M3UUJa?=
 =?utf-8?B?T2NDUkx2T3ZOL3pSblE0dlltc2NtOHl5RVBXeGljMnl0anpNNXlKYk54ajZw?=
 =?utf-8?B?UTc2U0ptcHl5Zk4yaWFZdm5pQ3hvVEZVeUZvazNlSll5REREVmdlbnZrVy9U?=
 =?utf-8?B?ZEVvTy94aVdVNHVjdFc0WDl4K0cxT1B2VEg3VmdJb2tqbzZ2Mm5xamVaWEJ0?=
 =?utf-8?B?SGRtRHNkOWFGOUZjTTY2WnFQU0ltQ2VpTEFNYmNqMTBDclFLWVFQZm50SUZi?=
 =?utf-8?B?TjJJYnZVTkFHQVVod3lQR2xmaG5kczF5RDJQaTFxczg5bEhrelRyWXNnM2hj?=
 =?utf-8?B?NXdiZGY1VXpTcjg0SFFSQXY4UW5NdXBoaGhVSHhSWkpFRlpSQkJHSVVvK3pt?=
 =?utf-8?B?dm9CRGJnR3hBN1NlbWhJaGhsbzdxeHdqNkUvZEZkN1V4anJyV1JDY1UrTFZs?=
 =?utf-8?B?NFVRUjNSUjNHdHNmSjRUb0pxbXB4Tzk3MkQrS0crNjR5VU5VTURNY0dvbEVj?=
 =?utf-8?B?aTJrWXVibkVGQnpoak1NOFdTZTQ3amxBV0twYmZ3cW1kL2ZmMDkwdXZEZjhK?=
 =?utf-8?B?RW51WjlKN2xlYzlOSEJUdTRXdE8vSlB0WFNwalRKNU1EOVZZMU5mZDl3a0Fu?=
 =?utf-8?B?SGxJUklyd2NRUklua3BJS3JQMllJWXZhcEdYNEtNNktKaCt5MHZlbzgzK29N?=
 =?utf-8?B?VlVEWGR4MTVzRGQ4OFVIejNJK2dyMGNJMTlDRWhFc3hndmlKZ0pNdXBXTEdW?=
 =?utf-8?B?OHBXTVljQkUyUjMxVUkxQ1NHcFhheklJayt1UXBkZ0s3Y2o5RXFyN1FFd2NN?=
 =?utf-8?B?QkdRWEpQdnZjMWNaSmcwajV4aVROaWw1Vm9tUXJEbERPSmxyYzJ3VklRdjND?=
 =?utf-8?B?STZnMXhNTnZLbHFTK1VudmJwbE1jaEI0Y01FbGlmUy80UGFIOFQ5NTA1YURk?=
 =?utf-8?B?VVR0aHlSczcrbDUvRmo1OXRvazlNc2hMWFQ0cGlKWitOSHQ2MWZyUmg4bVZt?=
 =?utf-8?B?NFRXOUVZbWxtN0RRUEE3V3JSZzYzc3hkdkFwZU4yVEFyOXR4VnR4Q2p5cURj?=
 =?utf-8?B?UFJnSmNtb0ZPUHdZclcwOHlvNmpEeTk3VHlXTnZnWGR3T3FPczhOZDBMQnNs?=
 =?utf-8?Q?8JSy/FGlsTbqdf29mBfZ75U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dzZsNWhyaVh3UTJUWXBpSEtFeGdRLzYybE8yaWZRN3ZndkRDUnlJcGJHMmhD?=
 =?utf-8?B?WjhET3pkZmJaVU9ZM3FYVnI1Z2VLYzFuQkNVVURWTW5PQUlvbjEvSGJReEdq?=
 =?utf-8?B?ZmcwL01nK2cyc3A1a1Z3WkhTLzZMWkJhZUNna3Y4SVhGbWVkRzUrcFhxemU5?=
 =?utf-8?B?YVhxdURJanBtVEs1Q1k3Yzdna01SWUVxYnhvaDRydGZMZjNwTWt1QlJyNDlU?=
 =?utf-8?B?Y0w1VTllc3F2d2N1QVlqWkRUME5UamdUeGJ6cVI1dGE5Qm1HOXhRMWo3SDFo?=
 =?utf-8?B?QWduSmZ2RDN6ZUFLWHh1eXdld2Fxb1A1NzZzSDl6bnNKU2NnVGtha0tOTFFa?=
 =?utf-8?B?TVArRmlmUHZRTVZMdExTQkZJdktxMVN1N09CTlljK3NvUkpaNTJTbk9jcmNJ?=
 =?utf-8?B?Z0MxSHNxbnhvSUErekVWY25mSmxGenVjWGEyM09SYWxkMUg5T2N5MkVtaDlp?=
 =?utf-8?B?KzRPenJVZFBBc2QrdTRNeXVNeUNwU0hyNTVNNGZtYVFjenVwUWR4QXp1NFMr?=
 =?utf-8?B?R1pjL2ZGTGFYdm81N3ZhYkxHOXlTWUVPTmVRTGMybnNCelA4YXpWTjQ1SnlG?=
 =?utf-8?B?WXpndDU2dnNCZUpkUzg3MzdmcmlRSnBseU1EeldDemUwemdjQ1FFd1lmT21s?=
 =?utf-8?B?UW1uZmZ0cEtsdTcyQ3hoS3RqZ1hINXhUK3NvaEJ3NlFlSXYwYk5aK1ZXaWky?=
 =?utf-8?B?ZXlIdGU3VEpKY1puK2ZOZ3VXbFEwZ04zRVcrWXVoRHVGNnBndHhaanZiYXJj?=
 =?utf-8?B?WVg3bFVuaWNtMk02YzZ2cUR5R0lzUHhFL09LdlJETkV6UHZXMTFSK29Damhh?=
 =?utf-8?B?eUFYWkkzcmtVYUl3cnBNNTJOUFR4UEZ6N2tEcGdsUFZpTTlLejEraHh1RHRQ?=
 =?utf-8?B?WWpIK2JONjhHcDQ2eTBWdVhHNzloeHp5eW01Qy9sQ0E5d1hsbSt5c3hRNmRU?=
 =?utf-8?B?TkpML3BRUzZyWlZwS3k4TWcrblBnRER0eHphazlUa1ozL2N5SncwVENoUGFF?=
 =?utf-8?B?aGs3Q0tDNVF4cHNPUmZva2h4TEtOcVFIUFNyaWwvK1U1Rzd1SlNnRHBxZ1h1?=
 =?utf-8?B?UU9FSVU1K1RIalROb2Q2blYxbE9VU2lCSG1LT1hXZUo1cm9GMUJtQjhPZzZD?=
 =?utf-8?B?VzREc2htczE0M3UwUkdSNWtKRlBTOUF2MjRFemtuUUZYY0FTSHlhTTc5Vjlm?=
 =?utf-8?B?RVV5WHQ4VE41dVJvOXpiR0wvak5aSTlzRS9rS3JwdFNwcSs1S0JZcUJRbVA4?=
 =?utf-8?B?M3ZUcTgyUC9PY01NZEM1TkZIZUJCTDU1b05wNGZ4KzQwTEFiUml0eWFkOWlI?=
 =?utf-8?B?QlVzVjBRM3VSNGYrcHlhU3NuZ3BqR21qdGJoQ0JMWCtVUjhudzFQYkxESndy?=
 =?utf-8?B?a08rNVp3NVo4TjBCMnJHRjg3ODdaeDlzamkyU3NyTlVac3RMOVBxNXFuTjND?=
 =?utf-8?B?STN1QmpxdDhRajkvM3VEeWVZNzVsemIwTW9PbFFlOHVtckpUVmdWR29paFRs?=
 =?utf-8?B?NTQ2UjgxbWM1M1Y2MlI4d29tS25SMnFWQi9FaDgzMUpMb0ZUTzFYVEZFSDhk?=
 =?utf-8?B?UXlYa1oyZ0t1VnNrVCtvVmZuamxucmdxaFZYZXJRd1RSWGIrR0tEZnRYQ3BO?=
 =?utf-8?B?OGhCL2RUSkdaeW9XeVBOS3dNTEpuVW1wMlFVQ3ArLzlOTXhubko1UkU5bEJD?=
 =?utf-8?B?T29TNkl3eS9YOUZpaCtoVDZ0MzRNZzl0WmFnTVZKbUJUclUzWXR6WlU5dWlC?=
 =?utf-8?B?cm9RN2k4S1ViNFdTUll3ZllGQjVVQ1FyTGE5dXl6VWZtT01hMXQ2enoxbndu?=
 =?utf-8?B?cEk2dVlXSytJZUNwSGxUSGcvL0FiR2V1cEsyREtraU53NEFrZi9Sd3N0SVlu?=
 =?utf-8?B?TlZ6amsraTdnM2FNL3RoZ29TR0Q0S1FOdjJIaHlIcUFnK2hEUFdzWjNKeEox?=
 =?utf-8?B?eDBISTU3T3ZFZlFLODJPQTE4c1ZpNE9za3hqMks2QndYaWFIQmpZZXphZ2E5?=
 =?utf-8?B?MzhCMUlIeUdSYkpremxmd1F2NDQ3WUpkbklPZmtkUEl0eTNRSHdaVjZkdUNB?=
 =?utf-8?B?alZZaHhkaGFpck1hQXhiWHg3VUJvbHFFSFpSSVQ5OTY2aG9WZy96NFR1ZGFD?=
 =?utf-8?B?emhiQnBWT2lHSEFOZUdNMXJIM2lXU1k2c01HVW1XZ0VHWDl6UFE2b2hkY0xK?=
 =?utf-8?B?WnIwNWo2R0F3K0V1Q3JaMDkzaE9BYk9VQktwVkpBbFM1cTZocnF0eXgrVG5x?=
 =?utf-8?B?YllXU2FhK0dLTjIyT09mblZJQlIwYm9KY0RmWmREVXlsNzA0MDVScVNvSndr?=
 =?utf-8?B?VTFDNkdJN3dmMzhDU2QvSEZpUFlzTEx0T1ZLZGU1eXlZY3QrK0xycEM2NzFs?=
 =?utf-8?Q?pBza/ncPH2gANfMw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AFB931449D59346BE9909FCE79CCB8C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e10fc720-2553-4f97-877f-08de5ce787d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 14:31:01.8919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jQCvWs0h/mvlE/HHI6STOySLi4wPBbxzZVqiL7ivh6aMAWednhPRXQ8JoAgGxDrGK6Mn6CEdYkWxfJYkcU2s4B1h4t0qRKl3tY/m6+0D0ZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6452
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7879389817
X-Rspamd-Action: no action

DQoNCk9uIDI2LzAxLzIwMjYgMTI6MzcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNi4wMS4y
MDI2IDExOjI5LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+IEhpIEphbiwNCj4+IFRoYW5r
IHlvdSBmb3IgeW91ciBjb21tZW50cy4NCj4+DQo+PiBPbiAyMi8wMS8yMDI2IDA5OjUxLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAyMS4wMS4yMDI2IDE5OjQzLCBPbGVrc2lpIE1vaXNpZWll
diB3cm90ZToNCj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2Zpcm13YXJlL3NjaS5jDQo+Pj4+ICsr
KyBiL3hlbi9hcmNoL2FybS9maXJtd2FyZS9zY2kuYw0KPj4+PiBAQCAtMTI2LDYgKzEyNiw0MSBA
QCBpbnQgc2NpX2Fzc2lnbl9kdF9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGR0X2Rl
dmljZV9ub2RlICpkZXYpDQo+Pj4+ICAgICAgICByZXR1cm4gMDsNCj4+Pj4gICAgfQ0KPj4+PiAg
ICANCj4+Pj4gK2ludCBzY2lfZG9fZG9tY3RsKHN0cnVjdCB4ZW5fZG9tY3RsICpkb21jdGwsIHN0
cnVjdCBkb21haW4gKmQsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICBYRU5fR1VFU1RfSEFORExF
X1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgc3RydWN0
IGR0X2RldmljZV9ub2RlICpkZXY7DQo+Pj4+ICsgICAgaW50IHJldCA9IDA7DQo+Pj4+ICsNCj4+
Pj4gKyAgICBzd2l0Y2ggKCBkb21jdGwtPmNtZCApDQo+Pj4+ICsgICAgew0KPj4+PiArICAgIGNh
c2UgWEVOX0RPTUNUTF9hc3NpZ25fZGV2aWNlOg0KPj4+PiArICAgICAgICByZXQgPSAtRU5YSU87
DQo+Pj4+ICsgICAgICAgIGlmICggZG9tY3RsLT51LmFzc2lnbl9kZXZpY2UuZGV2ICE9IFhFTl9E
T01DVExfREVWX0RUICkNCj4+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+PiArDQo+Pj4+ICsg
ICAgICAgIGlmICggIWN1cl9tZWRpYXRvciApDQo+Pj4+ICsgICAgICAgICAgICBicmVhazsNCj4+
Pj4gKw0KPj4+PiArICAgICAgICBpZiAoICFjdXJfbWVkaWF0b3ItPmFzc2lnbl9kdF9kZXZpY2Ug
KQ0KPj4+PiArICAgICAgICAgICAgYnJlYWs7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgcmV0ID0g
ZHRfZmluZF9ub2RlX2J5X2dwYXRoKGRvbWN0bC0+dS5hc3NpZ25fZGV2aWNlLnUuZHQucGF0aCwN
Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRvbWN0bC0+dS5hc3Np
Z25fZGV2aWNlLnUuZHQuc2l6ZSwgJmRldik7DQo+Pj4+ICsgICAgICAgIGlmICggcmV0ICkNCj4+
Pj4gKyAgICAgICAgICAgIHJldHVybiByZXQ7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgcmV0ID0g
c2NpX2Fzc2lnbl9kdF9kZXZpY2UoZCwgZGV2KTsNCj4+Pj4gKw0KPj4+PiArICAgICAgICBicmVh
azsNCj4+Pj4gKyAgICBkZWZhdWx0Og0KPj4+IE5pdDogQmxhbmsgbGluZSBhYm92ZSBoZXJlIHBs
ZWFzZS4NCj4+Pg0KPj4+PiBAQCAtMjc0LDcgKzI3Nyw3IEBAIHN0YXRpYyBib29sIGlzX3N0YWJs
ZV9kb21jdGwodWludDMyX3QgY21kKQ0KPj4+PiAgICANCj4+Pj4gICAgbG9uZyBkb19kb21jdGwo
WEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKQ0KPj4+PiAgICB7
DQo+Pj4+IC0gICAgbG9uZyByZXQgPSAwOw0KPj4+PiArICAgIGxvbmcgcmV0ID0gMCwgcmV0MSA9
IDA7DQo+Pj4gVGhpcyBpbml0aWFsaXplciBpc24ndCByZWFsbHkgbmVlZGVkLCB3aXRoIC4uLg0K
Pj4+DQo+Pj4+IEBAIC04MzMsNyArODM2LDI4IEBAIGxvbmcgZG9fZG9tY3RsKFhFTl9HVUVTVF9I
QU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCkNCj4+Pj4gICAgICAgIGNhc2UgWEVO
X0RPTUNUTF90ZXN0X2Fzc2lnbl9kZXZpY2U6DQo+Pj4+ICAgICAgICBjYXNlIFhFTl9ET01DVExf
ZGVhc3NpZ25fZGV2aWNlOg0KPj4+PiAgICAgICAgY2FzZSBYRU5fRE9NQ1RMX2dldF9kZXZpY2Vf
Z3JvdXA6DQo+Pj4+ICsgICAgICAgIC8qDQo+Pj4+ICsgICAgICAgICAqIENoYWluIFNDSSBEVCBo
YW5kbGluZyBhaGVhZCBvZiB0aGUgSU9NTVUgcGF0aCBzbyBhbiBTQ0kgbWVkaWF0b3INCj4+Pj4g
KyAgICAgICAgICogY2FuIGF1dGhvcmlzZSBhY2Nlc3MtY29udHJvbGxlZCBEVCBkZXZpY2VzLiBV
bmhhbmRsZWQgY2FzZXMgcmVwb3J0DQo+Pj4+ICsgICAgICAgICAqIC1FTlhJTywgd2hpY2ggaXMg
aWdub3JlZC4NCj4+Pj4gKyAgICAgICAgICovDQo+Pj4+ICsgICAgICAgIHJldDEgPSAtRU5YSU87
DQo+Pj4gLi4uIHRoaXMsIGlzIGl0PyBJbiBmYWN0LCB3aHkgbm90IHVzZSAtRU5YSU8gYXMgaW5p
dGlhbGl6ZXI/DQo+Pj4NCj4+Pj4gKyAgICAjaWYgSVNfRU5BQkxFRChDT05GSUdfQVJNX1NDSSkN
Cj4+Pj4gKyAgICAgICAgcmV0MSA9IHNjaV9kb19kb21jdGwob3AsIGQsIHVfZG9tY3RsKTsNCj4+
Pj4gKyAgICAjZW5kaWYNCj4+PiBXaHkgdGhlIGluZGVudGF0aW9uIG9mIHRoZSBwcmUtcHJvY2Vz
c29yIGRpcmVjdGl2ZXM/IEF0IHRoZSB2ZXJ5IGxlYXN0IHRoZSAjLWVzDQo+Pj4gd2FudCB0byBi
ZSBpbiB0aGUgZmlyc3QgY29sdW1uLCBidXQgSSBzZWUgbm8gcmVhc29uIGZvciB0aGUgaW5kZW50
YXRpb24gYXQgYWxsLg0KPj4+DQo+Pj4+ICAgICAgICAgICAgcmV0ID0gaW9tbXVfZG9fZG9tY3Rs
KG9wLCBkLCB1X2RvbWN0bCk7DQo+Pj4+ICsgICAgICAgIGlmICggcmV0IDwgMCApDQo+Pj4+ICsg
ICAgICAgICAgICByZXR1cm4gcmV0Ow0KPj4+IFlvdSBjYW4ndCBzaW1wbHkgcmV0dXJuIGhlcmUs
IGFzIHdlIG1heSBiZSBob2xkaW5nIGFuIFJDVSBsb2NrIG9uIHRoZSBkb21haW4uDQo+Pj4NCj4+
Pj4gKyAgICAgICAgLyoNCj4+Pj4gKyAgICAgICAgICogSWYgSU9NTVUgcHJvY2Vzc2luZyB3YXMg
c3VjY2Vzc2Z1bCwgY2hlY2sgZm9yIFNDSSBwcm9jZXNzaW5nIHJldHVybg0KPj4+PiArICAgICAg
ICAgKiBjb2RlIGFuZCBpZiBpdCBmYWlsZWQgdGhlbiBvdmVyd3JpdGUgdGhlIHJldHVybiBjb2Rl
IHRvIHByb3BhZ2F0ZQ0KPj4+PiArICAgICAgICAgKiBTQ0kgZmFpbHVyZSBiYWNrIHRvIGNhbGxl
ci4NCj4+Pj4gKyAgICAgICAgICovDQo+Pj4+ICsgICAgICAgIGlmICggcmV0MSAhPSAtRU5YSU8g
JiYgcmV0MSA8IDAgKQ0KPj4+PiArICAgICAgICAgICAgcmV0ID0gcmV0MTsNCj4+PiBTbyBpZiBJ
T01NVSBwcm9jZXNzaW5nIHdhcyBzdWNjZXNzZnVsIGFuZCBiZWNhdXNlIG9mIFNDSSB5b3UgcmV0
dXJuIGFuIGVycm9yDQo+Pj4gaGVyZSwgd2h5IHdvdWxkIHRoZSBJT01NVSBwYXJ0IG5vdCBuZWVk
IHVuZG9pbmc/IE9yIHRvIGFzayBkaWZmZXJlbnRseSwgaWYNCj4+PiBTQ0kgc2FpZCAibm8iLCB3
aHkgZXZlbiB0cnkgdGhlIElPTU1VIG9wZXJhdGlvbj8NCj4+Pg0KPj4+IEphbg0KPj4gTXkgaW50
ZW50aW9uIHdhcyB0byBwcmVzZXJ2ZSB0aGUgb3JpZ2luYWwgYmVoYXZpb3IgYXMgbXVjaCBhcyBw
b3NzaWJsZS4NCj4+IFRoaXMgbWVhbnMgdGhhdCBpZiB0aGUgU0NJIGFzc2lnbiBvcGVyYXRpb24g
cmV0dXJucyBhbiBlcnJvciwgd2Ugc3RpbGwNCj4+IGF0dGVtcHQgdGhlIElPTU1VIGFzc2lnbm1l
bnQsIGJ1dCBmaWx0ZXIgdGhlIHJldHVybiBjb2RlIGFuZCB1bHRpbWF0ZWx5DQo+PiByZXR1cm4g
dGhlIFNDSSBlcnJvciBpZiB0aGUgSU9NTVUgYXNzaWdubWVudCB3YXMgc3VjY2Vzc2Z1bC4NCj4+
IEhvd2V2ZXIsIGluIHRoaXMgc2NlbmFyaW8sIHdlIHdvdWxkIHN0aWxsIHJldHVybiBhbiBlcnJv
ciBmcm9tDQo+PiB0aGUgZG9tY3RsIGNhbGwsIHdoaWNoIGNvdWxkIGxlYWQgdG8gdW5leHBlY3Rl
ZCByZXN1bHRzLg0KPj4NCj4+IEkgYWdyZWUgd2l0aCB5b3VyIHBvaW50Lg0KPj4NCj4+IFdpdGgg
eW91ciBzdWdnZXN0aW9uLCB0aGUgY29kZSBiZWNvbWVzIG11Y2ggY2xlYW5lcjoNCj4+DQo+PiAj
aWYgSVNfRU5BQkxFRChDT05GSUdfQVJNX1NDSSkNCj4+ICAgwqDCoMKgwqDCoMKgwqAgcmV0ID0g
c2NpX2RvX2RvbWN0bChvcCwgZCwgdV9kb21jdGwpOw0KPj4gICDCoMKgwqDCoMKgwqDCoCBpZiAo
IHJldCA8IDAgJiYgcmV0ICE9IC1FTlhJTyApDQo+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YnJlYWs7DQo+PiAjZW5kaWYNCj4+DQo+PiAgIMKgwqDCoMKgwqDCoMKgIHJldCA9IGlvbW11X2Rv
X2RvbWN0bChvcCwgZCwgdV9kb21jdGwpOw0KPj4gICDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+
DQo+PiBXaGF0IGRvIHlvdSB0aGluayBhYm91dCB0aGlzIGFwcHJvYWNoPw0KPiBZZXMuIEp1c3Qg
dG8gZG91YmxlLWNoZWNrIHRob3VnaDogVGhlcmUncyBub3RoaW5nIHRoYXQgbmVlZHMgdW5kb2lu
ZyBhZnRlcg0KPiBhIHN1Y2Nlc3NmdWwgc2NpX2RvX2RvbWN0bCgpIHdoZW4gdGhlIHN1YnNlcXVl
bnQgaW9tbXVfZG9fZG9tY3RsKCkgZmFpbGVkPw0KSnVzdCByZWNoZWNrZWQuIGZvciBtdWx0aWFn
ZW50IChhcGFydCBmcm9tIHBhcmFtZXRlcnMgY2hlY2spIGlzIHNlbmRzIFNDTUkNCnJlcXVlc3Qg
dG8gdGhlIGZpcm13YXJlLiBTbyBJIGRvbid0IHNlZSBhbnl0aGluZyB0aGF0IHNob3VsZCBiZSB1
bmRvbmUgDQppbiBjYXNlDQpvZiBlcnJvci4NCj4gT25lIG90aGVyIHJlbWFyazogTm8gSVNfRU5B
QkxFRCgpIHBsZWFzZSBpbiBwcmUtcHJvY2Vzc29yIGRpcmVjdGl2ZXMuIEl0DQo+IHdhbnRzIHRv
IGJlICNpZmRlZiB0aGVyZS4gSVNfRU5BQkxFRCgpIGlzIGZvciB1c2UgaW4gaWYoKS4NCldpbGwg
Zml4Lg0KPiBKYW4NCg==

