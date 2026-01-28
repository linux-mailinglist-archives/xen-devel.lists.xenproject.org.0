Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDIYCj77eWkE1QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 13:04:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA3FA0F9F
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 13:04:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215577.1525744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl4HC-00016R-Qm; Wed, 28 Jan 2026 12:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215577.1525744; Wed, 28 Jan 2026 12:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl4HC-00014g-Md; Wed, 28 Jan 2026 12:04:02 +0000
Received: by outflank-mailman (input) for mailman id 1215577;
 Wed, 28 Jan 2026 12:04:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4J3=AB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vl4HB-00011L-M4
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 12:04:01 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cac35b1-fc41-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 13:03:58 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7357.namprd03.prod.outlook.com (2603:10b6:408:195::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 12:03:52 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 12:03:52 +0000
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
X-Inumbo-ID: 6cac35b1-fc41-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAFy+t+PNZo1dvnwPddImr8g4zPnTipURwwo3gjzmDPnWV7Awp6CcN6feNnReIA8pzdn/6c3btQDS+Wi7LwoHh8LRQNlXnPzuxa+lx1krCYzlKQsYy8lo0Zc7LeuukN/1tqWIFjgLLpznnKMdMEO15z8vUERvAUbBjV1s1wBI9YvzHNpIejSliEVudQdgYKi+geBcUCeZoWGTAmZ37T9a1NhK1qVUlM4BONMZGISiRczQb4lNY+hKYHEH0vNSmTvxEGbE1m7fiSs0xgjrtFXZRuZzMW6rj1PSIMi5weGVZXrwlrqwFFG4zGeSuzfHzO8hqhZD6uaTKDWOz7dPzVmtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0T5V+kHkdL8FvGWYql4pNaSReTvMoCHjT2QNsPOM0n4=;
 b=yfe3LLiNUrAo+fNNqjFfsElo263Cm1cICg69G0Ych3eDuaaR/tASQzq2cNKeF5MOqGXjh4hkAMbf+Twp+3PUm4jNNtLjx/Q9HPhBDw2JQ7IW89n1iU8rlNYlzZgaVcH+0aqPaqjhogsoD8ncUIc6wRGbZXxMWUOGN4xsJHCPsUVthL7GW81SVQZcMsLsZxkApoULnRScXhNWgcIt8KENxjoSDPQDBNes0UIEfpOefU5NkJaTKUfJdEaz8nYFHiBtQ5xMBobhtUUeBqvD7ZaD2kipBSIpSRuXcIRQwyPE6O2/uqb3rTNilpOxDPNZi8GjdWwo5QdgDMGlTpHzvS+qGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0T5V+kHkdL8FvGWYql4pNaSReTvMoCHjT2QNsPOM0n4=;
 b=rvzVEp2flsZDlvYcJiL+luUyP+hohxglWh8F8rVln9a/62xifuHOAkcQtShiK6vyR09WejcRJoG0L6f4w3jy79C/muGdQYrHNXqjazHt6f0iyfeZSa/g0YzMzM/e9b7rgRo4+iXxgxRfSSgI7dQsbY7VtGMPqOy2dsMU9FUC0Kk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 2/3] xen/mm: allow deferred scrub of physmap populate allocated pages
Date: Wed, 28 Jan 2026 13:03:38 +0100
Message-ID: <20260128120339.47373-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260128120339.47373-1-roger.pau@citrix.com>
References: <20260128120339.47373-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: 277c2970-bc93-4deb-cf95-08de5e654d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bG9oVkZlTFQrTDhTMy9mbG1kNW90UCszZXFWSEJEdTVxRng0RWcxdCtuYnU4?=
 =?utf-8?B?bmVReldYZlFvYnU4b3o1dmd4bThNU2VkVUFYYVpuUkRhUXlRRlhaMjErYzV1?=
 =?utf-8?B?dDREajcyYWlyeVFsTFJCSWVReDQxU3hNczQzRGJjQWFQZmsxdkZ6VGg3c0Q2?=
 =?utf-8?B?Q2tNZWsybWZnRkRvdzVUWU1aUmJVWUh6MUhyV3dxZEhWMjlpck9jYmMrZ256?=
 =?utf-8?B?ZjFVZmFjdnVEa3pDNGcyOTlVck1INXNnelhhRFRBZzZYZTNmN0FVSUM4UHdO?=
 =?utf-8?B?SU1pQURUTmtKZWNVODg1T01FUkhhQ3NoYTRKdkdQRTFNN1J1b1hzbUpodXlS?=
 =?utf-8?B?ZkkxT2NtTFczZTJ5RnlEcUpEdkd2UnIzQ1hlVDFVeGVsbmhvVTRUbkMzRUNy?=
 =?utf-8?B?aFIrNGxZUUJ3TnVMUC9BR1YxWTViNWd0QlJkZ0krZ2hRakJ6MGNDKzBWNFk1?=
 =?utf-8?B?TEZBQWYvZUZZeXZPWks2bDhqRFJXZ0pnaG95NnlBY3hxR25mSVBBN3VCYWZl?=
 =?utf-8?B?Z2JlSlJIcWpWNUIrQ29IcDRmbGhya0IyblpqbG53eEFEYmx2d1VvM01LTjM1?=
 =?utf-8?B?ZHJZQmFQai9HbjBLcEhMOEZxWWZROTVjRVk3MkFUcVM5N2lUY2NEZktJdG5o?=
 =?utf-8?B?Slh5QW9JZ1R2RjJ0UGg0d284L1dMbzZiczdLSUEwQ2VwQnlsWS9ENHhBV2Nq?=
 =?utf-8?B?MG45Z2NiMDU0ZkV0SGphY1ZaSUI3SyttdTNsbU4vR3lsV2VoZVp0UmJ5QUxJ?=
 =?utf-8?B?ZUNxaFJJbmgwZjgxekZxMFhvVkpuUUtka3pKTGN5QUtBZVQ2N1VqQVpEYzVF?=
 =?utf-8?B?aXhVTEN1NzE1dHVuVy9wQjVJazdmb1hMQ2RHOEp3YzhHWTJMOXVjaE5DRkpK?=
 =?utf-8?B?Tk10d25lazNVNGtkTUd4RDBJUW9idkdScTE0NEd4N0hnZThzMzcrQklSU2N6?=
 =?utf-8?B?Y3RYS2VRdnJ3MzFhU1laK0M3S1JkUmxWVFNaRHA1dDNlZ0J2WmxlSFpMdFQr?=
 =?utf-8?B?dHN4R29SUmFpN0FadkNycHRnb0o5cytNVnJmZDFzdjhXL05DOWtOV0tFeGlw?=
 =?utf-8?B?TGVMSEF2dE1pWWVQR0s0L0p5eTVlZG44VkdONnFSdVBhVGk4NlFBd1VZa0xE?=
 =?utf-8?B?UjNaYW5CT0ZrYU0ySkNTS0F1M1ZVRXN0bzJ2UFRTNmpKeVVTR1hkay8wQWZT?=
 =?utf-8?B?LzJjTlpaVExBWnh5NXdDZEl2aEwzdU9UelJYZUh3WWFHVlZWYnJCcE95Sm9a?=
 =?utf-8?B?UFlFcUNlenVSRG11WHFWSXJrWFVUdk5rZm1uVnBjNFRCemFQbGYzL3cwMy9a?=
 =?utf-8?B?MlpGeFQ5cWlWSDQrUEM2WmpxS3JsbVgrUXUyMkRxS0FqeEQ2K2ZJbHV1U0s4?=
 =?utf-8?B?S2RZazdRTlJPUUN0RlliWmsveCtqc1BmdzdEWEIvRDZPa0lOVng2QmFHall5?=
 =?utf-8?B?d3JzUzBjak5Hb1c2RmhuZGdLbXVpNmpEdER3NFpKZisxYW82M3ZYNmVyOEc2?=
 =?utf-8?B?UE5QN3JLcm5qQzRBUDhXUnczb2tRcjhKK0hxQm1mK2ZxTTBPOUg4dVJuVThs?=
 =?utf-8?B?NEh3VWNRNEpHSTlZUVRnbWhlYmlSTmlBUTVOQ2s2TmlTb2VYVjBjNTJ2WlI0?=
 =?utf-8?B?MG9QWU05Smw3QlRRblloRHZ5SHJ3WldScmNqOHBHK3pHK0dIMDR4VkFDUitl?=
 =?utf-8?B?WEhEYWp3bWdvNjJLNGhQWWZiWWNIa2VDKzVMczBXQTQzcnZlUTlyUHo5R0pa?=
 =?utf-8?B?SGFDWkhwWUgvWXA2MXltUlE2UnYxWGh6L0JoSGh6RXlHSklxM04vcXJ0SDlo?=
 =?utf-8?B?R3JUL3hpeHlsWHNvaFB2U3U3RjJIeVljNGRqc1VweEFPNHMwMjcwV3R6RkJU?=
 =?utf-8?B?SklQcUl0aC9Gcnl4Sk1jWU9IQm1lUExZa0RYWWZtd2dOWkpRb1V2dG9ZVnJX?=
 =?utf-8?B?aENMZ244RlBwdXJJM1dCWE5mQW14MkFoa3ZhZUYwTElTT0Uyd0paVk5lUGVJ?=
 =?utf-8?B?Y0VSbkhjdnJCLzZ5aWkvb3VTUVR3d2thL2QxR3R3NjZXdjhSZTh0SkpTNXVi?=
 =?utf-8?B?Qklla3l4SmVUZVQyTWtMK2xyeXc3dWh4WVhkTGhGNVVUNzgvZVpvaTZ4aGlZ?=
 =?utf-8?Q?Tjss=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVVtRy81Qi80MDNYTTh2azhwMHRUa0UxMjk2YlNWdWRnTXdHZmRCR0xyYTBH?=
 =?utf-8?B?V0FTaGp1ZGhaaHcrdmIrY0xLNGV4SUtkTThwVUpNMUxKbFl6NnNtcU1QMDE3?=
 =?utf-8?B?cEtIVVhRSlBQTVIwakd2Zmt3UHRDWGNXRlY3ZFJJMUhKZ1pXMFdDdmY1TFQ1?=
 =?utf-8?B?eXB6UVBwRDBMTUpOcktpUndMS2NxNmQ0UFE4VXNIa0FuSzFiYU1JVGhjRUVP?=
 =?utf-8?B?OVVpUVhIZ3I1elhWMWFIYzEzb3BiWnlDR2hSN2krMU1DYlBQZTIvNUZhelJu?=
 =?utf-8?B?dUFHVjArNXhoNVdJZWM1ZXFYdUk0dzFuZTdpZ25FbldUbzg0enI4VlROYWRX?=
 =?utf-8?B?cUx6ZWowSzZpRkd1dk5EdEUvZkVqc0dlaENJd0dhU3VSTHF4cDdkQWdwdVBZ?=
 =?utf-8?B?SytUQ3BtN2UzNmp2WDY4Y3NabmVpS3pTcUNHTUd2WTFyNG5FQUhpalUxVlVG?=
 =?utf-8?B?ZW5SNTBXMWw5VHZnRHdzWlpsZk5EMlB6Ui91RmxSczd6Mkd6WnRTalJXNm5j?=
 =?utf-8?B?ZjJQWERGaXJkR2xra2MzVkxMMDg5STdkUXRlZG96N2tyRFNoNnh6TkJOUjFq?=
 =?utf-8?B?emp1ejNZOEhTamFFcmRsWkdCdW45WEhWeEo2VVNENVJOWXJ1ZndxQjFvcjFr?=
 =?utf-8?B?Q3dDbjZOQ1NmSHRjNjBBS01sb1B0OGlKbkRVcm1DY05XY3FreVc0L2RTTEF0?=
 =?utf-8?B?dkhLcmVWcm5OTG0xdy9sSjBSRjU4QlVVZ1pqVkNmWVFURGs4KzV4RUc5S0hL?=
 =?utf-8?B?N0JDNyt2bkpheDJrMmNQeUo4V2RtOEN6R055Y0g1SjRYejlDTlhNK3dBQlF0?=
 =?utf-8?B?Yk53b3gvU1JVMnpqYm1NWDNueFFvR3RlUncydjR2QkVrNTVLM1NGbWVhNVR4?=
 =?utf-8?B?d05ScUF1dU9KZHpHQS8vWjdnRFVPQTN2UEJSWmQ2Ykd3OTR0NTUrYVVmbExo?=
 =?utf-8?B?YTRHN3d1NUMzOHJQa2hkeitTVXpmeDdNdFh1aWt6ZFIrMExLRWdKNGRiWE45?=
 =?utf-8?B?NVkvUmdTeE16bmhkRUU1aVB6bC9HNVVTSmplcG9KWDJYS3k3YndLWXU0T1Iy?=
 =?utf-8?B?NzQrTkZnOVdpSk9iU1NGNVd5aElEN3BwYVNVVWZqL0NubzBSK2xvakdQdDlk?=
 =?utf-8?B?T04vY25tNENvSjZDRTR0MU00VlVLRlFGTElsQlF4d1g4M25XUFZCYXFONlNn?=
 =?utf-8?B?aXhOclVjWjJDWlpSUG1rekNLZEQxVVJsTjIvUGd5clQyamprZ3pkRFkwT2ho?=
 =?utf-8?B?U1ozUzlVT1daQlIrdXBqY1hJb1UzQzJiKzJKTi93MmJUbkFWS3ZialhrdlFw?=
 =?utf-8?B?MHFGNkZmRjlLQTdQRmgwOGZ1NURmdksxTTlBSjRhanBRZnlEQmIwei9MK0dU?=
 =?utf-8?B?U2M5Kzh3VVhGT2JLV3g0U3pCYW9OTmoxVFNyZmt4MFIvdlhodnlNQ2cvbGxS?=
 =?utf-8?B?ZjVId3dQM0JGcUNyV2tCenkwQWFDTHRhV2lWKzV6RXM3b1ZDZndySXR0VFhn?=
 =?utf-8?B?OER5Mjd2UDNEbmZBUjFOeVJLNXl0aFczNWhEUm51ZWRkdXFuckZZMGN4Sitj?=
 =?utf-8?B?N0RPOHc3QzluanBUMFE3dHlSdVRWeVI0L3lHVVJKcWNnN2tLd2xsTG8vZmtY?=
 =?utf-8?B?UTFFM3BPV0xpNVhCb1VmTFh4ZXZFT3pzTm5aVUdBM0VyK3RDZmVzOUtkRlBt?=
 =?utf-8?B?Qk1Mc3RlNzVydFRtOU1hRFIxQTBtSjJWTXlESHNBT1lXKy8wZzdZS2VYTkg0?=
 =?utf-8?B?OGN6dElOWjNBMmIwNVBYWkhES05KSDhZeVY0UGZMTXA5UnV6djEzS0U0UFND?=
 =?utf-8?B?SDF2NWNnNkhoUkR5WkdvZHRJd1QrcG5HTnlEeEx3aVNVWDdhcUZGWW1sV2tV?=
 =?utf-8?B?a0xDOGpYbjF1aGFLUTQzTnorYjhMMWdhTHlhelVvb0tXcTRvNmIxL1NBZCt5?=
 =?utf-8?B?YmYwM3RDbGt6TUkrYWpZS1hOSWdHQzE3NnFIZVZ6OHg1WGFxWHQzZHVNQzBF?=
 =?utf-8?B?OUlhcFBRWm90UXZwaytvZTg1WE5OL0N1S2FTajZld0tkd3hUdGJ2U3Q2TnFs?=
 =?utf-8?B?dE5sQ3VrcThPVzlJYVVWRll2UmxWME9ld1UwZlZxZ0NubnhkWElpRjhNak9U?=
 =?utf-8?B?MXA3T1hQZkVaMTNVd2pONXJ6bVJhclZ6NE9jNjRlWnNGM1RLeU5TQXdTbjBH?=
 =?utf-8?B?UFlNby9KRFZ4WUQrMnlWbk5za0gwZ3lGMVVCbWExUVZaRjd4WEpFQzVJczVO?=
 =?utf-8?B?SWZvbEQrdkNZUzB5MHBJaS8xTVIzMjZURTVVeS9qZGJqckcrVlYzYjh6SDFG?=
 =?utf-8?B?dnNPYVJrNUk5R1NYMm1VN1hLMlVJcm0yMFYzTHBzdVRCZVRPcWhFdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 277c2970-bc93-4deb-cf95-08de5e654d3e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 12:03:51.6139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGESvEn2p0A/cTdmoXSe5IfUm+Oj7b68y5yJ+xUlWu5RLrJXztBttnJwM05jQEMVLBsX4noIi0yd0Gh8tnH8TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7357
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9EA3FA0F9F
X-Rspamd-Action: no action

Physmap population has the need to use pages as big as possible to reduce
p2m shattering.  However that triggers issues when big enough pages are not
yet scrubbed, and so scrubbing must be done at allocation time.  On some
scenarios with added contention the watchdog can trigger:

Watchdog timer detects that CPU55 is stuck!
----[ Xen-4.17.5-21  x86_64  debug=n  Not tainted ]----
CPU:    55
RIP:    e008:[<ffff82d040204c4a>] clear_page_sse2+0x1a/0x30
RFLAGS: 0000000000000202   CONTEXT: hypervisor (d0v12)
[...]
Xen call trace:
   [<ffff82d040204c4a>] R clear_page_sse2+0x1a/0x30
   [<ffff82d04022a121>] S clear_domain_page+0x11/0x20
   [<ffff82d04022c170>] S common/page_alloc.c#alloc_heap_pages+0x400/0x5a0
   [<ffff82d04022d4a7>] S alloc_domheap_pages+0x67/0x180
   [<ffff82d040226f9f>] S common/memory.c#populate_physmap+0x22f/0x3b0
   [<ffff82d040228ec8>] S do_memory_op+0x728/0x1970

Introduce a mechanism to preempt page scrubbing in populate_physmap().  It
relies on stashing the dirty page in the domain struct temporarily to
preempt to guest context, so the scrubbing can resume when the domain
re-enters the hypercall.  The added deferral mechanism will only be used for
domain construction, and is designed to be used with a single threaded
domain builder.  If the toolstack makes concurrent calls to
XENMEM_populate_physmap for the same target domain it will trash stashed
pages, resulting in slow domain physmap population.

Note a similar issue is present in increase reservation.  However that
hypercall is likely to only be used once the domain is already running and
the known implementations use 4K pages. It will be deal with in a separate
patch using a different approach, that will also take care of the
allocation in populate_physmap() once the domain is running.

Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Introduce helper to free stashed pages.
 - Attempt to free stashed pages from domain_unpause_by_systemcontroller()
   also.
 - Free stashed page in get_stashed_allocation() if it doesn't match the
   requested parameters.

Changes since v2:
 - Introduce FREE_DOMHEAP_PAGE{,S}().
 - Remove j local counter.
 - Free page pending scrub in domain_kill() also.
 - Remove BUG_ON().
 - Reorder get_stashed_allocation() flow.
 - s/dirty/unscrubbed/ in a printk message.

Changes since v1:
 - New in this version, different approach than v1.
---
 xen/common/domain.c     |  30 ++++++++++++
 xen/common/memory.c     | 101 +++++++++++++++++++++++++++++++++++++++-
 xen/common/page_alloc.c |   2 +-
 xen/include/xen/mm.h    |  10 ++++
 xen/include/xen/sched.h |   5 ++
 5 files changed, 146 insertions(+), 2 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 376351b528c9..123202f2c025 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -710,6 +710,23 @@ static int domain_teardown(struct domain *d)
     return 0;
 }
 
+/*
+ * Called multiple times during domain destruction, to attempt to early free
+ * any stashed pages to be scrubbed.  The call from _domain_destroy() is done
+ * when the toolstack can no longer stash any pages.
+ */
+static void domain_free_pending_scrub(struct domain *d)
+{
+    rspin_lock(&d->page_alloc_lock);
+    if ( d->pending_scrub )
+    {
+        FREE_DOMHEAP_PAGES(d->pending_scrub, d->pending_scrub_order);
+        d->pending_scrub_order = 0;
+        d->pending_scrub_index = 0;
+    }
+    rspin_unlock(&d->page_alloc_lock);
+}
+
 /*
  * Destroy a domain once all references to it have been dropped.  Used either
  * from the RCU path, or from the domain_create() error path before the domain
@@ -722,6 +739,8 @@ static void _domain_destroy(struct domain *d)
 
     XVFREE(d->console);
 
+    domain_free_pending_scrub(d);
+
     argo_destroy(d);
 
     rangeset_domain_destroy(d);
@@ -1286,6 +1305,8 @@ int domain_kill(struct domain *d)
         rspin_barrier(&d->domain_lock);
         argo_destroy(d);
         vnuma_destroy(d->vnuma);
+        domain_free_pending_scrub(d);
+        rspin_unlock(&d->page_alloc_lock);
         domain_set_outstanding_pages(d, 0);
         /* fallthrough */
     case DOMDYING_dying:
@@ -1678,6 +1699,15 @@ int domain_unpause_by_systemcontroller(struct domain *d)
      */
     if ( new == 0 && !d->creation_finished )
     {
+        if ( d->pending_scrub )
+        {
+            printk(XENLOG_ERR
+                   "%pd: cannot be started with pending unscrubbed pages, destroying\n",
+                   d);
+            domain_crash(d);
+            domain_free_pending_scrub(d);
+            return -EBUSY;
+        }
         d->creation_finished = true;
         arch_domain_creation_finished(d);
     }
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 10becf7c1f4c..1c48e99a6ab2 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -159,6 +159,70 @@ static void increase_reservation(struct memop_args *a)
     a->nr_done = i;
 }
 
+/*
+ * Temporary storage for a domain assigned page that's not been fully scrubbed.
+ * Stored pages must be domheap ones.
+ *
+ * The stashed page can be freed at any time by Xen, the caller must pass the
+ * order and NUMA node requirement to the fetch function to ensure the
+ * currently stashed page matches it's requirements.
+ */
+static void stash_allocation(struct domain *d, struct page_info *page,
+                             unsigned int order, unsigned int scrub_index)
+{
+    rspin_lock(&d->page_alloc_lock);
+
+    /*
+     * Drop the passed page in preference for the already stashed one.  This
+     * interface is designed to be used for single-threaded domain creation.
+     */
+    if ( d->pending_scrub )
+        free_domheap_pages(page, order);
+    else
+    {
+        d->pending_scrub_index = scrub_index;
+        d->pending_scrub_order = order;
+        d->pending_scrub = page;
+    }
+
+    rspin_unlock(&d->page_alloc_lock);
+}
+
+static struct page_info *get_stashed_allocation(struct domain *d,
+                                                unsigned int order,
+                                                nodeid_t node,
+                                                unsigned int *scrub_index)
+{
+    struct page_info *page = NULL;
+
+    rspin_lock(&d->page_alloc_lock);
+
+    /*
+     * If there's a pending page to scrub check if it satisfies the current
+     * request.  If it doesn't free it and return NULL.
+     */
+    if ( d->pending_scrub && d->pending_scrub_order == order &&
+         (node == NUMA_NO_NODE || node == page_to_nid(d->pending_scrub)) )
+    {
+        page = d->pending_scrub;
+        *scrub_index = d->pending_scrub_index;
+    }
+    else
+        free_domheap_pages(d->pending_scrub, d->pending_scrub_order);
+
+    /*
+     * The caller now owns the page or it has been freed, clear stashed
+     * information.  Prevent concurrent usages of get_stashed_allocation()
+     * from returning the same page to different contexts.
+     */
+    d->pending_scrub_index = 0;
+    d->pending_scrub_order = 0;
+    d->pending_scrub = NULL;
+
+    rspin_unlock(&d->page_alloc_lock);
+    return page;
+}
+
 static void populate_physmap(struct memop_args *a)
 {
     struct page_info *page;
@@ -275,7 +339,18 @@ static void populate_physmap(struct memop_args *a)
             }
             else
             {
-                page = alloc_domheap_pages(d, a->extent_order, a->memflags);
+                unsigned int scrub_start = 0;
+                nodeid_t node =
+                    (a->memflags & MEMF_exact_node) ? MEMF_get_node(a->memflags)
+                                                    : NUMA_NO_NODE;
+
+                page = get_stashed_allocation(d, a->extent_order, node,
+                                              &scrub_start);
+
+                if ( !page )
+                    page = alloc_domheap_pages(d, a->extent_order,
+                        a->memflags | (d->creation_finished ? 0
+                                                            : MEMF_no_scrub));
 
                 if ( unlikely(!page) )
                 {
@@ -286,6 +361,30 @@ static void populate_physmap(struct memop_args *a)
                     goto out;
                 }
 
+                if ( !d->creation_finished )
+                {
+                    unsigned int dirty_cnt = 0;
+
+                    /* Check if there's anything to scrub. */
+                    for ( j = scrub_start; j < (1U << a->extent_order); j++ )
+                    {
+                        if ( !test_and_clear_bit(_PGC_need_scrub,
+                                                 &page[j].count_info) )
+                            continue;
+
+                        scrub_one_page(&page[j], true);
+
+                        if ( (j + 1) != (1U << a->extent_order) &&
+                             !(++dirty_cnt & 0xff) &&
+                             hypercall_preempt_check() )
+                        {
+                            a->preempted = 1;
+                            stash_allocation(d, page, a->extent_order, ++j);
+                            goto out;
+                        }
+                    }
+                }
+
                 if ( unlikely(a->memflags & MEMF_no_tlbflush) )
                 {
                     for ( j = 0; j < (1U << a->extent_order); j++ )
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index de1480316f05..c9e82fd7ab62 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -792,7 +792,7 @@ static void page_list_add_scrub(struct page_info *pg, unsigned int node,
 # define scrub_page_cold clear_page_cold
 #endif
 
-static void scrub_one_page(const struct page_info *pg, bool cold)
+void scrub_one_page(const struct page_info *pg, bool cold)
 {
     void *ptr;
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 426362adb2f4..d80bfba6d393 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -145,6 +145,16 @@ unsigned long avail_node_heap_pages(unsigned int nodeid);
 #define alloc_domheap_page(d,f) (alloc_domheap_pages(d,0,f))
 #define free_domheap_page(p)  (free_domheap_pages(p,0))
 
+/* Free an allocation, and zero the pointer to it. */
+#define FREE_DOMHEAP_PAGES(p, o) do { \
+    void *_ptr_ = (p);                \
+    (p) = NULL;                       \
+    free_domheap_pages(_ptr_, o);     \
+} while ( false )
+#define FREE_DOMHEAP_PAGE(p) FREE_DOMHEAP_PAGES(p, 0)
+
+void scrub_one_page(const struct page_info *pg, bool cold);
+
 int online_page(mfn_t mfn, uint32_t *status);
 int offline_page(mfn_t mfn, int broken, uint32_t *status);
 int query_page_offline(mfn_t mfn, uint32_t *status);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 91d6a49daf16..735d5b76b411 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -661,6 +661,11 @@ struct domain
 
     /* Pointer to console settings; NULL for system domains. */
     struct domain_console *console;
+
+    /* Pointer to allocated domheap page that possibly needs scrubbing. */
+    struct page_info *pending_scrub;
+    unsigned int pending_scrub_order;
+    unsigned int pending_scrub_index;
 } __aligned(PAGE_SIZE);
 
 static inline struct page_list_head *page_to_list(
-- 
2.51.0


