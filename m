Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILmKKGEBjmm0+AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:35:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F416A12F80E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:35:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229571.1535505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZf0-0003en-Gf; Thu, 12 Feb 2026 16:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229571.1535505; Thu, 12 Feb 2026 16:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZf0-0003bu-DB; Thu, 12 Feb 2026 16:35:22 +0000
Received: by outflank-mailman (input) for mailman id 1229571;
 Thu, 12 Feb 2026 16:35:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hp9h=AQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqZez-0003bo-UJ
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 16:35:21 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf511082-0830-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 17:35:16 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB5356.namprd03.prod.outlook.com (2603:10b6:5:22b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 16:35:09 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Thu, 12 Feb 2026
 16:35:09 +0000
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
X-Inumbo-ID: cf511082-0830-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFOu+HqZ7yrkf7amgGWQCYsMe/3IbLOkn8sVoiGxSlH4nqDCfl2aCZoKCSjmbulso7kp0+2BrUItBnA51gxTGesTMTm+njVJgvsp09cRDSJSnC9YRy/F/ou9N+QYg6/hLE0E16cjlrYDyqkdiJiZ8PuxK5a5ZhAw4fHH+gipEhbo0nRW8hDlITaGDtBTgzKtaIpQbmgL21B4BhZ9YazAWELZcm6fwV8bo1Fuc28/oOwv1fz9MQRl6g/Wpy4QPzI21aEguJV03L37hPOSsam0bKTnDBGbEksjHf5bnsTR/JTUmxwPJim+QT7YL1sleLXscdP+k3Dh9Ha4MAj54/NRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCo101kDg7QTbWvKuNiizEsZ79yuIBWy+2mrLikWKIA=;
 b=WGJX6y02yx0sAcQhWEltjMK1QJfvxEvd8+8ClbUT5t3RGNdm9FJ/ikiD2k/9XAhN30GZ5Y6FblbX59Wdu3WpJZzsZLLG94Wn8skadr+A4oEiktpWf8iDPXHvclOU5qBgaL25ggTYqkAwaoNtMSVdhvHbF6y2OjHh5E1xo8yfmV+Xw8xhQlUGRu3/QGihS/1RaZk/cfxfoUoXTwqZ4zAdFAEgfqjacT8sv6TH3GEX3vgTKprzjLP5eOZ58rD13zlS5FbHt3IYPmKCISQax9L8eQ7+p3+jJKuzyRRi9fXPokm1l5nkI8kYKH9yCnsjf9h7q0a/3cnjK+gSIMPz1ESegQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCo101kDg7QTbWvKuNiizEsZ79yuIBWy+2mrLikWKIA=;
 b=RIGLhmljapDUdmPhRGGmaxkwfCd/AHzr5w/M6bVhMTgcjzfgGcDr3OTiVJZtSe9KYxZI4vjTtVFegW+Jq/dwxrbkLwHw0xZorSd4qwTkT0bquxjjL9CnnHUIk4md/uFkX+4YWZ9cIWMQ9E1CzDajJM3ggtUM4wHTFUKYsXOQ9NQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 12 Feb 2026 17:35:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19
Message-ID: <aY4BOQxRatBcNCKD@Mac.lan>
References: <aYtznP_tT6xNPwf-@mail-itl>
 <aY3ttvtxGCPTNgsj@Mac.lan>
 <aY3yqOTn9EQfO4rF@mail-itl>
 <aY387XuhCEZ0JNTN@Mac.lan>
 <aY3-Shto7px4M1RK@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aY3-Shto7px4M1RK@mail-itl>
X-ClientProxiedBy: MR1P264CA0110.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB5356:EE_
X-MS-Office365-Filtering-Correlation-Id: be445fad-fa01-4265-9eb4-08de6a54afd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alpkbGgyNFB0cnBBR25YVWprSHFVQU54Mk9RdExBWkIxSEM0WElmNUgwUzMy?=
 =?utf-8?B?VThCMFRSTFB6amoveXUyVnk2Sy9wVG93QjlRUERjUjFJZU02dXVlekZScDFC?=
 =?utf-8?B?M3duWXJCZXdxajF0Q1M1a1liclZCOXU0OGdZS1l2NDhyRWtRVThUemIrYWdu?=
 =?utf-8?B?bXN0V0hZdGJuVEFzK1BkUmUrNVNuK1pwWEwxWnRvMG1Ld0RBdytMVlBtdEhl?=
 =?utf-8?B?aDNIR29GMGhsSEdsN01WRVkvMU1EWmR6RkxVQlZiVFI1YW5Kbi9pNThmOWVH?=
 =?utf-8?B?ekthQWFydWwzOUk1NWlnYXlZbm5sYXQxVkcxdkJVUjlOVHA4R0VhUmVXL3FH?=
 =?utf-8?B?NEZUT2JNUHI5VUxpUVR3UU8wWUNxcElXS0hpK0RtSm9uTXJlSDAvNk9sODRL?=
 =?utf-8?B?d0UrVnNlNEZJa253K1hZZ0xMVk1ZU1dHdGxRVU1aZldwekdkamltdDlEMXFP?=
 =?utf-8?B?dkp2VEJNRmdZa3dqSG1tTnp5MHlLakFRNVVKYkFsc3VOM2dBQ0tvcVRQZlY1?=
 =?utf-8?B?MTYyMlp6VFB3MHVmM0RDRTVyYWpCQ0xTK3dhV0FXaytYSjdXaXhDL0VZZ3B6?=
 =?utf-8?B?bzc0MG1XVThOZCsyNmQ1VHVEVUUxOHdXeG1laUcrQ2xLcE4rckptNFpONkty?=
 =?utf-8?B?S3M1UzZzaEtVRmdwVlYzS1UreHAwWjZEOGtWNzg3TDNuS2ZPT2V5ZlphSFJK?=
 =?utf-8?B?QUxuRWVDWTRudFhJMUlyU0dFWUpJR2dyM1ArbjZkL0dLeG5tWi90bWVYYlor?=
 =?utf-8?B?Tk03Mk1MaUcyZFhwT1JUb2FiQjVmOEhSank0NzZvRXVPVXpGTW5tRFUzbjVa?=
 =?utf-8?B?Y2RZOU9VdVcrWG0xOXFnUllSR2FpcG9qNC8rSkVOcFVvN0dmTms1NVBHMGpL?=
 =?utf-8?B?REpzcmFkZjUzR2V0d2xlYldxdEg2NTIwdmt0TE8zVlBrbWZ5MnBUMEtvcU8r?=
 =?utf-8?B?a0FxelpQNG95N2tzU3daTURNZm9aSWE3d0c1QXJWR2tqSERZdCs3bUNmUk5K?=
 =?utf-8?B?ZWkvR1lMSmRGVHcxUTJ2ZEVhQ2d6NlBwbHhlRTRhd0UwUll0QkNNSFhMYXFJ?=
 =?utf-8?B?em44UUdoMXpteHN0Y0kyN3pGRms5a3lCTDlWNU1EUDdLbW10RWhhRnVqWFRL?=
 =?utf-8?B?MzFmaVZiWklOd2dqdE5XSEVxSGJLMVlRbUJqTGxZTUhrdUtyejk1dlE1NWZo?=
 =?utf-8?B?L3gxZTkyT0VMY1ZtNzVzQi9STU9hcStVaXNFajlSL2lsYlJzNlNOSzZER0JF?=
 =?utf-8?B?WThNY25XSnZDbU94N292TDZGS016cmsxY2pZcnJwbWlyVjdmTXVVa0hYelBD?=
 =?utf-8?B?NjVVU1VCd2NiaGIwdWo4Qm9UYzJia2FCYWFLTVVtdjZBZFFta3Exb3FtT3li?=
 =?utf-8?B?b2UyYVhsVTFlNGtraGUwOGlGcFVhK0hqOHZOM0tJeXFpYVhRaG5aZy9nMjVz?=
 =?utf-8?B?S1NzcWIwRitWaFNFWU1DZUdWRDNmR2pJc2kxKzdtcnZGaFh5eTlYUExQSCtv?=
 =?utf-8?B?Tmt6WmFIK1JZQ0wvbzVKWFhwTStSbmJMemhzM2ZGQWpvcytvTTBPclpJR3RI?=
 =?utf-8?B?dlJicUxxblhKeWpkVnJJS2wyMlpVUmk0cjd3QXdmWDBmSW93b0xwS2JHcVYz?=
 =?utf-8?B?YkZpYkRDLzZjOGtaajVQUXU5bWZhWFB4R0RsZERLUVpmejJFSWtWOERrdWVE?=
 =?utf-8?B?VVZmUGNaWWxhSEZXZVpWYklFcnMyNlN3ZktabXBqZ1RHSXY0Qy9vdVBjODBo?=
 =?utf-8?B?MjBTQkJTVms4Zms3b0lsQUExelA5NDRuelQ0VE1ETUthZHhZN2lhZUp2bVFu?=
 =?utf-8?B?cUJSZkdEcS9rdXlRT3VCU3pidDd3VkZoTDJHQVoyTTY4aWRsbjEyY1Rsalhw?=
 =?utf-8?B?a2xTbTZIeDhKM2lFWTA0NDNNOERoMHJiODFyV0hDcUtueG1IZjRTSHJBdWY3?=
 =?utf-8?B?cCsza05sYnk0RGlFZ3paSGNrTGFnSm1UcW5LMFFtLzc4U2lDYkNBd1NCYVIr?=
 =?utf-8?B?U3BiNTlxa3AvL254ZHcvYjFVbTd0Nm5jU1FsQllQS1VuUDV6N1BJWXJlazZ3?=
 =?utf-8?B?YTJhZHpMZW1DUnVFSnVYa3JpSmNCcjYyWjl5SG5sVDdYeGN0ZFFNMjZhQmlD?=
 =?utf-8?Q?1KpE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWI0WnVNbW5YTDNIeGJ2UUdmQnlMMVMycjBBWDEwMlVORE92cWRJMXFOWlJN?=
 =?utf-8?B?TVI2RXJYUlI3WDJhU3I2RUNtc01VQXY1NlVBZ2MrK2k0MEY1N0ZxLy9Qd3BV?=
 =?utf-8?B?MGFxK0dQckFqaHZJNTJocTA2cFRFNlNWK2IwTm5EQ0F1UXMybnA5WjM5Nzkr?=
 =?utf-8?B?MEVydkhoZFpIdVNMc1k5VVRSOStwWGUrV2g5a2x2VGpSQXhKOS9MMkxVSDkv?=
 =?utf-8?B?bm90eHN4WUllOWtVQ0FKSUQ2K1VwU1RVVFZHaWk1U3ZldWIvVmczUzBHeEQ0?=
 =?utf-8?B?SzRacWV0Rm96RFkzSmJqMWp6bi9yRnBnbDM2RWRVdEoxYVk3QXArZ0RoWDIw?=
 =?utf-8?B?VmNsZm1hTSsyZzltT2NLcUZZMnRxc0NOZk1BbnZZS05PODVFZnlqYm1XRUhY?=
 =?utf-8?B?d2d3dzNCSk9udlAwQ0UzdVZ6WEZLUjhYOWVacXVYMzd6YzVOZHJmdEY0MWtW?=
 =?utf-8?B?WkVOY25yVjd6VHdOeEJaV1V1N2ZrZG1sZ1c0K2w1eS9JK2taMEM2djhBMHhR?=
 =?utf-8?B?c1pZdEdra09yUnBmb2VQaUs3OUxrbUxzekYwZ2psUFpnY2k3ZFQ5WFVUZGFu?=
 =?utf-8?B?NlhBMG5OcGw2V2tjaXV5QzR5bXk2WTlXbG8reDNWRDJUcTU5cTdIS3NReWNC?=
 =?utf-8?B?bWJrMmR2OFV1eDR2bDhOdG9FSmdIOHA1aVJBRURrNk1jOUJKY21ZY0JrZmpX?=
 =?utf-8?B?bjdTZkJrK1dMNU1obXM1Zm5tSnk5SGJsK2RQZURjZkpodk42cUVQWWNUU3JY?=
 =?utf-8?B?WHZSV2UwNDZFN0JrMHdRcmNiVVJXTnhJeGUrWk5VNys4ZzBkd0RmaGdNclov?=
 =?utf-8?B?SXRpaTJWdmx0U0NYQ3pOaHRnL2NhZy8zQyt0K2c3b3l3cjdyQ2x6STJ1S1VL?=
 =?utf-8?B?anNxN01LQmZMTVpYNDl5dFI1cUpacTN0dlBNbDN5ZzlvR2RBNHRZaUlMWnRq?=
 =?utf-8?B?b1A3ZFNnL2E5MzhXQnZYU0IzdlgvbWt5aEsrSFhrOEUzZDMrd2lKOXhlZFc0?=
 =?utf-8?B?QlhrMUtsRUFpeEhFYjlTeWpxYXZIellaelk4K0xXVFhHYS96YUUvVEJJK3ZO?=
 =?utf-8?B?RDhqa1hCSVFpV2k4amdzc0o2V3YvVUlxK3YveEJYK1RveEUwSHZZS2FvY1VZ?=
 =?utf-8?B?NVR4TnhCK0NnVTJxTTBLOU95b0JmdFMyc0U0WXYreTR3VURBQmFEUHZ5TzVJ?=
 =?utf-8?B?T01wOUo0ZGxEUC9pNkZ1c2FUMlNGczZvSkR0Z3FPZ0g0Nk94cXR5QTRIL3pE?=
 =?utf-8?B?eUhENFJmTlVDdzlJOFBmQklIRnRpQTNsMzNEaFRzZ1libUtCblBqR2NjSkU1?=
 =?utf-8?B?UzZPdDRldWI5VDRyblE4eWN5UEl3MjllWnU3SFQ5ZXA1ZTN1UmVyUStlMmM2?=
 =?utf-8?B?ZXEvZFB3VFlwekNobjcxUFR3ZHAyQm9adjM3YVJ3ckNSMEpSMVExSm5IK3pY?=
 =?utf-8?B?Y20zeXRnN1ZBS1VaRU1kTkRVUEZMa2dGSzNIbjdNUWVUaWpjL1NRZUVaVnhx?=
 =?utf-8?B?ZGkrQ2pnM1UzU2JVNkwxRnhuZTQ1YXIxdFliTCt4ZDhWa2hWMFRORDB6MUEv?=
 =?utf-8?B?SUlkMGFDVlpsbGxyUjlqYzJESTFkSnljcExhTFc2a0wvNi8xZlZCeGdkTTZn?=
 =?utf-8?B?NHRUeEdtY2xJRjBRMVJ2bVJYdWp5aWRnOWp6VjJCZTZBN2ZsMm83clNEMnRX?=
 =?utf-8?B?RXJUT1JkcS9tTU9VdkxMNGttc2hXaWpJQi9IcHU0QjVsU09ZY00xaVBXRFd1?=
 =?utf-8?B?VExFK3d6VVdwRlpoNnRaSXZ2emx6aDh5WnJONENuRE9iZVdZWTBLZW5QUmlR?=
 =?utf-8?B?UG9YbFRpMVR4ZHB2RDVxd2dLb1I4ZlpCcUI4ZmJwUkZNQjgxVWpRYjl4VzQ3?=
 =?utf-8?B?dHZDWW9tT3FvZkVicm1zRmpWbWV1UVNUS09PbVhRa283aEROam93akFNWk51?=
 =?utf-8?B?d0RJTTdzc29OMGRUZEh0aVMxa2ZUNkRMU0h5bDJYSVJ0Q3pkTkVVcG5jVWJn?=
 =?utf-8?B?MlRCd2N6bEM3OTZCaEZXb1J1ZklSeStJNVY1LzBwNmJGU0Jrd1JuWmFjTWtH?=
 =?utf-8?B?c0hwckFkbEkyTzU5WEZmLzFzeW9Da05oUVhxaHVNZ0JLV2JicjRMZkxzTGZr?=
 =?utf-8?B?dllnMWwvUHBPTDhHZ015QlhZWWxBUjh2QXczdUVsVGxzamJxRU1DeXljbnBo?=
 =?utf-8?B?RVJYSnBGblN4ck9zOGNidHdHOWxLOGJzYm5Vd2U3MlQ3ZEhqUStFKzArU2Vu?=
 =?utf-8?B?Q21zR2RNKzJaQ2cxN3ViOTg5NzUxd1piM3ZtWm5NSUp2NFMvTWlUcHJ4UW1h?=
 =?utf-8?B?dGN3dk1QVThFZ29GVEVtc3JzVzVKbXBTY0d3UjNxQ0RFMkN2OEp4Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be445fad-fa01-4265-9eb4-08de6a54afd0
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 16:35:09.5261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SE5S/eoFZcuUK1KaW+bp4CwXCr9v0RLMaVVvRLuTaufnF0WkG//xOYOjxnpBGWN3UPTqgDnUm0B6DfL+wx8Fyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5356
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	SUBJECT_HAS_QUESTION(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F416A12F80E
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 05:22:34PM +0100, Marek Marczykowski-Górecki wrote:
> On Thu, Feb 12, 2026 at 05:16:45PM +0100, Roger Pau Monné wrote:
> > On Thu, Feb 12, 2026 at 04:32:56PM +0100, Marek Marczykowski-Górecki wrote:
> > > On Thu, Feb 12, 2026 at 04:11:50PM +0100, Roger Pau Monné wrote:
> > > > On Tue, Feb 10, 2026 at 07:06:20PM +0100, Marek Marczykowski-Górecki wrote:
> > > > > Hi,
> > > > > 
> > > > > Recently I started testing compatibility with Intel Lunar Lake. This is
> > > > > the first one that uses "xe" instead of "i915" Linux driver for iGPU.
> > > > > I test it with Qubes OS 4.3, which uses Xen 4.19.4 and PV dom0 running
> > > > > Linux 6.17.9 in this test.
> > > > 
> > > > Not sure it's going to help a lot, but does using a PVH dom0 make any
> > > > difference?
> > > 
> > > Yes, it makes a difference. I end up with black screen as soon as dom0
> > > starts... And due to unrelated bug (in xhci console code?), I don't have
> > > kernel messages :/
> > 
> > Hm, that's ... very helpful.  We should fix the xhci stuff so we know
> > what's going on there.  Is the xhci bug also PVH only, or PV is
> > equally affected?
> 
> XHCI console works just fine with PV dom0. But I just noticed I had
> older Xen binary there today, will re-test on the same 4.19.4 again. And
> then will submit separate bug report (even if that's likely be me fixing
> it anyway).

OK, could you also post whatever output you get when using a PVH dom0
with `sync_console` added to the Xen command line?

Thanks, Roger.

