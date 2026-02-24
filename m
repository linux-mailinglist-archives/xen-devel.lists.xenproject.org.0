Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEqhDDt3nWmAQAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 11:02:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF7B18512F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 11:02:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239702.1541097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vupEb-0002Wz-Bb; Tue, 24 Feb 2026 10:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239702.1541097; Tue, 24 Feb 2026 10:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vupEb-0002Uk-7N; Tue, 24 Feb 2026 10:01:41 +0000
Received: by outflank-mailman (input) for mailman id 1239702;
 Tue, 24 Feb 2026 10:01:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7lmg=A4=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vupEZ-0002Ue-49
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 10:01:39 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdcf50f5-1167-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 11:01:37 +0100 (CET)
Received: from SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6)
 by SA0PR03MB5595.namprd03.prod.outlook.com (2603:10b6:806:c0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Tue, 24 Feb
 2026 10:01:32 +0000
Received: from SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc]) by SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 10:01:32 +0000
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
X-Inumbo-ID: cdcf50f5-1167-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6cKU6xMOJDGy8HrwbrXI66ye0VfygXDh+yXh0BF5w+tFnKQNOYZmpCqoTTeWVMlnGTTjVNYli3Kh3xyE5NuxcQiQca3ZYAIkWL0el7ogAgF+ZGlMqt+l5/WakuLgnK3shuY1wdhS4dR9c1J143JSHHUHjvMEcfcWl8CV3AeGzsDvrHbcK5wE+5qAV4KslZy2HRcBXYlizBkZEMMqnktf1Zb3clEr6H17WmGMfIi3V3/et3y9dgbmjYIvqsM5RmtqNTGN5giugD4VMon1K8cLHjMq4qDi5OUoy94d9dVru5jkeumCM7Ni8pjCXaTAlt+rgGVwFDFTais5mACdNH0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTZSMhYAEI4D/jxIuJtRqH/FYjp8i3bl1huQ38JFh/4=;
 b=zNbEHrWw01H44STp8brAkydENul2qXYhEDh7TNNwdTXoz7JFZmzovYkskJ1lGWd/KeG5R4AIGfNKmTo7+OCCohHfN+WQyn3h7RaHMfGRVlbYrhw8YfUNaA4tgofPEPdu0vgisfxMC1ZsRIPrbdfr/GEcukTavN3wYY+l/2sX2tU20f+9MoCCOTMX06/C1ZRDWn5Em5LoyRualSZ8Smf9/duABcUMZXeQoGNyA8pappjyXJhIB+2XBg3Fqb8HRKJOTSc7apYdbuP5kx8z5kQ5Vcr6c5dl5lB4rYoEhKqAKlCdvzqhQzrWGZMzkLDOEdMXiG1wWgA6EkPJeaQf6T8IGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTZSMhYAEI4D/jxIuJtRqH/FYjp8i3bl1huQ38JFh/4=;
 b=sr3Q73dHsjnTfYwDIOCVeGoY2E8a+C8OOAlehJ2pYfGpufxapYZY8DrJbcVxankKDgx+degoO0W+XQgqQbgJfJHW9jk484EqHkNa24yZpVa8IgfUJAiLZhQRcE9vBtXnm/VNQ9kYRJ8xIW0jrw6tre2SJ7PoF9wLG9yEGa1uJz4=
From: Edwin Torok <edwin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/7] tools/tests/*/Makefile: factor out common PHONY rules
 into Rules.mk
Thread-Topic: [PATCH 1/7] tools/tests/*/Makefile: factor out common PHONY
 rules into Rules.mk
Thread-Index: AQHcpK0tQx2+yGxKK0yu3GIXOaCAi7WQe++AgAEdWACAAAEEAIAABWkA
Date: Tue, 24 Feb 2026 10:01:32 +0000
Message-ID: <7B23282E-4CA9-4B8D-A521-C8483F7E2541@citrix.com>
References: <cover.1771840831.git.edwin.torok@citrix.com>
 <6fa0d95dad3d223cf8aaa923ae59fd0b3a97d4a0.1771840831.git.edwin.torok@citrix.com>
 <20e3edf8-9aba-40e9-af57-e5eddf001a7b@suse.com>
 <6616BFC6-2ABC-4DEF-A799-BC660BBE31BC@citrix.com>
 <e866d080-2c6f-412f-8ac4-f97eb7e874c5@suse.com>
In-Reply-To: <e866d080-2c6f-412f-8ac4-f97eb7e874c5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7419:EE_|SA0PR03MB5595:EE_
x-ms-office365-filtering-correlation-id: 740bd51d-7204-4cc2-71db-08de738bb012
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ckcyRDRqWHRZS1pteTh3eGM5S3pLbG45SDNpVU50R1ZHRC9uR29KMTU3VDNZ?=
 =?utf-8?B?NUJ6RWtsOHUwRGJRQlF3RU1ta3ZibXU4OHBWbTBrK1ljWU9PWnRET3Vucy9H?=
 =?utf-8?B?S05hSzZTN0dISEJhQmxjbU1JaEZSdGxXdW1pd2M0YVhzVk5QdkxUOFRTeWxp?=
 =?utf-8?B?MFNDdzlIdS95RytQSDNrS3lUT25YQ0QvandmY1JiT1o0dURuUXFnZHVxMnBu?=
 =?utf-8?B?blNGdEgvOXFKTmp6VW40MGdQb1VseFFiQzkveWRwVkpjWXN1VXQ1b0p6RjlG?=
 =?utf-8?B?RjlzeWVpTnRhYkQ2amFWUXZrV1Z3VnJvUEVDNktBTEtHQWIwTlNhNWpkWlBF?=
 =?utf-8?B?M0JMMThiV1lkOEJzeXBKTTVhajRSeGRKZWdOall6cHJjRWNoVTVnMXk3WlV0?=
 =?utf-8?B?NCthbUpKc25EZHU4ZHpRMFcrM3hRb25rT0RYOGFpMGVENlp0ejBJOEVVdlVU?=
 =?utf-8?B?M2IwblArN1JpbUpXNFNVbFM0b2hSaWo5THA3cHUrbGtwVUJNbVJRbG96RFRy?=
 =?utf-8?B?bGpoSUpNeDdUb014RU0vYzhsckNuYVBBUW93bXNueDEycExEZ0Z4bmdZNmtu?=
 =?utf-8?B?Nzk1eHFmeXQxZUdQSVovUENDV2VNNGhYbEZYZ0lZSzVaTFlKdy9qZ2FZV2dC?=
 =?utf-8?B?ZU9oQVNsYjVHZ3lXem9lNW5WTjF6cVlWeFRDT2JyWnVHUUk3QU1OV3k2KzZy?=
 =?utf-8?B?cWVybFo0NjVmVFp0ZVhjYTVvTTR2aG4xdWEwU2xlYTAreUJRaHR3ZHRYb2ww?=
 =?utf-8?B?VVcrVFd6UWoyUjQxU2R1dkptL3dKN3BxeDh1VG9UQ0tKQndMS1NVcEJtSHgr?=
 =?utf-8?B?MXdFaXlRNnhJQjE1MDBiTEJKbmRxMCtobDBFK0JlTWR4UkFrUEo2Y2dWSnVE?=
 =?utf-8?B?K2ZjSkgya0NlSStZTlFkSUpPVkV1SUM4VFlMbllpR0dlLzlUT09xbVNiZ2N4?=
 =?utf-8?B?OEtRam8wemlGa3haMVBJUTJUM0NNK0V2S3EyTUhVaUVISW8zMjluRHI2SXQ2?=
 =?utf-8?B?aVBXWG5kU3RQNnBoTzYxKzJDTzQybXFvOHhYRi9zdzMvbjhkWDBuL1NBRlJn?=
 =?utf-8?B?UXBZYytVQWk2TzJrOHAzWmppTGthSm5LL3dpOUtCSXh3WUcxb0tyWFVkWU5t?=
 =?utf-8?B?S2htUkRQZGljemtIRnBaWGlLcWVQMUFkQlBTdWVLWWlRUGxrM3MwbUJqZktB?=
 =?utf-8?B?c2ljYkIxTHY1ZGk0VE1laWtvRkE4aU8vNmZRNEh1L3BULy9NNDVjalJwNGMz?=
 =?utf-8?B?MUtKaGVNU2Q1VnpOelloaHp2WjBlUTZzajBBWGpES0pmRmFtV2JhbjFoaTFN?=
 =?utf-8?B?UkdUV0IwN2lQZDkreFlZM2pPMzdOTWtVeUh4dERIZkY4UVA2TUU4Wlp1T1BX?=
 =?utf-8?B?TUNjanNNYzlKY3FaWFJkeHR0c01yVmVkbHh0ZmFrMmdhTTU5cjFQejRhMHIw?=
 =?utf-8?B?N3RnTVoza1BtdXdsczhkTG9XT3FKUDNrai9EUzhPaDI4UFhMM2VkSVFrcTN2?=
 =?utf-8?B?bytEMm9oa2pRbEJTVno3WFJxSU9xc3RxZStnTy9ZNXlXNG5FRzM4Zi9yWmkz?=
 =?utf-8?B?TkpFKzIyOXJES29QT1ptMUlZM01nZlV1U1c4V0dCeElqc0VzeWxUanVmc2tV?=
 =?utf-8?B?d2xESHRKOG44NGtvZ1hQUUM3OFdENUZFeTJ2clFoTnF1dXArRW56NVhTamI3?=
 =?utf-8?B?c1B3YWdQL1FsQlJRNHJqRUNBMERTdkZUdmRwU21JVlllVUptRmJYWWVobkFT?=
 =?utf-8?B?VmFkaHd3STlMSnVqV3ZPNnk3RzdlRXZITmN4dEFSUHR0YWFVdnM5NVNkeldh?=
 =?utf-8?B?bGZURE9pRGNmVS9OS3ZWTE92dWJ2aEx4bVpRd2M2WGk5ZXZlZ3JRZC9jaGtH?=
 =?utf-8?B?V3hrYXowWXNpdktHbmpUNHM1UnBST0xBRURCWXRPcFMzR1FaZ01KWEs5ZFNX?=
 =?utf-8?B?YTlYWFZwejVwZ2pRS3ZQa00wcEowd01BZHRNTkkyMGdLSGJuVUlsSDRha2hI?=
 =?utf-8?B?aFlmbG9sOGdTOCs4K0VqL2NkVGlwamFVaXc0bXpwY1Y1M2ZoT2xlTnNFbUZa?=
 =?utf-8?B?cUZtN3BIeTQ2NGdMQU0xcWJrWldmd1RNeEVrU2c2UXcyR08vbFR0aUJOb3ZM?=
 =?utf-8?B?QTV4SlE1S2toQi9IMXlSRVFPamtXQnR4N2FkOHhXWU5HVEtZdURLSTRwSDVa?=
 =?utf-8?Q?J961HcSo9SsquZvSusV5rhk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7419.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c1NJUWUyRGpSZFMwNWNsQmcxYngwSGZQNksya2tIdEdJY2lYVXNPdVJWKzJ2?=
 =?utf-8?B?bWMvYmdwK2I0eHlENDVDMTAvUkFNN3J0bEZlUkVlQ1M5WitQTGVnTFRDSEhh?=
 =?utf-8?B?bnNYaGx5S3Z2VUszRHBXRXdJK3pjak5qalpHQnRNSFNXOU1KUm1hd3JqVEpk?=
 =?utf-8?B?d1MrNjBpajV1b2FaTHlEcDJxRjI5RURiS0tUYWVUVlpPVG9tQmtVMFRkZlFT?=
 =?utf-8?B?MVc0Q1dTQjBiNHNSNGg4bE5yTFVxc01SZERuOUxCRDRrY2lUcHphcjRYY0Q2?=
 =?utf-8?B?OXpxZndzdmVMa2d0bSs5VjdBRi9sTUhhYkxmeG1pSnl1YnQyUHNKSGhJbWw1?=
 =?utf-8?B?MnFoQ3FURWVIL3FjQUNjdFdZUitnSGhxNXBJMkx6dnQ5T2w3RFVBTExlY3Bv?=
 =?utf-8?B?TXQ4eUdIMVNrSDcxd2NmYnB4T3BFUkJ1a3M4ZitOZXBxcmorbXB1b0xpTEhS?=
 =?utf-8?B?Z0NOTDlnRG50ZTMxT1RSMzRONGZGV3hsV3BEZUkvRll2UjczS1h1OHlXVmpO?=
 =?utf-8?B?dXlCU1RzN01LMm9aWVJndVA3RkdMbmJKM0Qxa0J6bjU0U1RzeFN0Z0ZKYkNI?=
 =?utf-8?B?azg4d21VS3BoRTZVR1FYVU10ZmErRjRLblVucGFQeVFsNmhHcHUwcDYxMmM2?=
 =?utf-8?B?R2dlLzN5cDNzanRvdzV3Q29nbzJCTy8xNCs3UUgrcE1aSEhCYUZGYi83Q0N5?=
 =?utf-8?B?eWxVRlZSRjVYRkUxalRqQzIrOHZGSk1ZRWRabXFVUVhwSkt6SGsrT01JR1Bz?=
 =?utf-8?B?cGRBbUJDbjl5QWtLSVUyNkZCVkFBaDh0eXN1YnZOcGlBeFBlTHNKZ2VvVW9J?=
 =?utf-8?B?ZHJoZDRTbGovYlNVNlhnUHFxVEtic2xiSWV4eFY5a1E1TlZ2aHRqeG9LQzNS?=
 =?utf-8?B?bk54YU9VNjcydzEyeW41dDVGZHV6TkRVUGxubno4amprb0NmQjJ1TTk0bWdK?=
 =?utf-8?B?R2hwSkhIQm9ub05qRkdQWFBaQXpOelpMQ3c4Sm9LejB2QmJvR2NJcGZNUXQr?=
 =?utf-8?B?WFNnYVc4VDNvRVB2cVc0VmhGSUhVY3F6L0FLY3E0ck84VEw5L0pkYWFhQTZo?=
 =?utf-8?B?NFRscjBIb2xiVFNZK0Zya3RTbXFXRU1YY3ZiT2NmRXVxTm5iLzZoUk1zMmpU?=
 =?utf-8?B?bXF2NUo0UGpaT0xhOGc3VFpVeVEzd0dYVjRGWG5yS1YwbHJEMnQ2Z1BvUWlv?=
 =?utf-8?B?U1MzTjljZkVoWVhBTXpNeklTMzluOGtJZWtMY0RINHkzT0hGSTI3K1ZIRm9Q?=
 =?utf-8?B?TWJiQ0E2dHovdXA0b3VIMi91cnZJUExnRDRQdWVQMnNQS3JaU0haQ2c2Nm5X?=
 =?utf-8?B?VnVEQVVvN1hPbXB0WUY4UjBSZXZzOTlGMXZGOGFRWUdEYWhvU1ZaTlVicldD?=
 =?utf-8?B?V0I4Qnh3V2lIeEJzeFlhQUtZOXBOWW9Oa1JvMFcvVWRDanF5TmZYdzZEeG0x?=
 =?utf-8?B?S2kyOFpLeFc4Q3FUc3BoZjU0dUF5RUR5eG53Tm5ZMkdVdXVodjNwYzE3Q0Nv?=
 =?utf-8?B?alRnRk82bkp3RDFHcnQ3K05DL0dQM3V6Ym12R3MzUnpHRFR3ZHZJbktBSEE4?=
 =?utf-8?B?Z1JzM0xsMDc0YW5kdEtmY2NZZlpDcnlCaGFzUEJoQ0c2eXg4bHoxb0pjbDFh?=
 =?utf-8?B?NjQ3d3Z2YXFTSE52eHBNSXduc3V0WTdDL0tWanNPREtFUzhzWThuSDVvbzBh?=
 =?utf-8?B?eFEyTnFFZVhVNGFRZ0RjUGtGZnRsMWhOTUdYbjNlNXVzczdrc2NtdjVlMnlC?=
 =?utf-8?B?bWR6akdiU29hSVNvaERqV09TekVmNW4zKzc0ZWZEZXlnTU9kQ0lhcXphVHdB?=
 =?utf-8?B?U1RTd2d5RFdPK2svK0dNMVhIQ1A1azdGbUxpMXlnOVBLQnBXVE85bnovS2Yw?=
 =?utf-8?B?eXJqa2JEZ0tSMEd2NE82NlU2RjFsNHMvdzdqcHlNNS9ZU2ZnRy91aFBtNmJ4?=
 =?utf-8?B?R3JUTmFoQkxDQzc1cE8reWtzT3haT2hWekhySUN6VWtJeTZyMmxkWG9HSFJJ?=
 =?utf-8?B?dHdMYmNWWkxRS0NoN0xnS285bEFuZTFBemZjaHVCaEgxM0swS2syaVNkOUNJ?=
 =?utf-8?B?aEJzT0ZSUVRBTU5BMHRqSDlYbWI0MDJOM1VhVlpoZ3pmblVNWm52Zit4TFBx?=
 =?utf-8?B?K0V5SjUwODF2dEh0SmxhUHY0WFNjMWRrYUxKcHd6eWl6eTZ3Z0l1cnRjWTRB?=
 =?utf-8?B?UDYyQ2RRNHJwSlNGVktCb01hTk9HZzZieGZXejd1ek96ZHN3TmtuVFFIcHRl?=
 =?utf-8?B?SXhHMjdHdmd3Z0tROFBmM1J3YTl6RThNTjZ5aXhuOC9wNTVsQkttcDZhNGk5?=
 =?utf-8?B?NUl6VDg0NEYxYUZCYk5TZEZtZjlFTGNoai9tS2xFMzVnczAwZHNGSUVQNTdS?=
 =?utf-8?Q?h6Nu0HLyAWpuHw8I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DE3BE99DE3EFD43871924B9D0D29301@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7419.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 740bd51d-7204-4cc2-71db-08de738bb012
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 10:01:32.4641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0TjhTchUuqbTXAkFBCkHf85QzGScRDW6GgObQ0F3BIjI/XdBFnkkIPCZlq9tPt6F6cgfYOf0UUjybQA3D9AXdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5595
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:query timed out];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	APPLE_MAILER(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CFF7B18512F
X-Rspamd-Action: no action

DQoNCj4gT24gMjQgRmViIDIwMjYsIGF0IDA5OjQyLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gRmlyc3QsIHNpbmNlIHRoaXMgbG9va3MgdG8gYmUgcmVjdXJy
aW5nOiBQbGVhc2UgZG9uJ3Qgc2VuZCBIVE1MIG1haWxzLg0KDQpUaGFua3MsIGRpZG7igJl0IG5v
dGljZSBteSBtYWlsIGNsaWVudCB3YXMgZG9pbmcgdGhhdCwgY2hhbmdlZCB0aGUgc2V0dGluZ3Mg
bm93Lg0KDQo+IA0KPiBPbiAyNC4wMi4yMDI2IDEwOjM4LCBFZHdpbiBUb3JvayB3cm90ZToNCj4+
IE9uIDIzIEZlYiAyMDI2LCBhdCAxNjozNywgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PiB3cm90ZToNCj4+IE9uIDIzLjAyLjIwMjYgMTE6MTQsIEVkd2luIFTDtnLDtmsgd3JvdGU6DQo+
PiBJbnRyb2R1Y2UgYSBuZXcgdG9vbHMvdGVzdHMvUnVsZXMubWsgdGhhdCBtdXN0IGJlIGluY2x1
ZGVkICpsYXN0KiBpbiBhDQo+PiBNYWtlZmlsZSwgYWZ0ZXIgVEFSR0VUUyBpcyBkZWZpbmVkLg0K
Pj4gDQo+PiBSZXF1aXJpbmcgaW5jbHVzaW9uIGFmdGVyIFRBUkdFVFMgaXMgZGVmaW5lZCBpcyBj
ZXJ0YWlubHkgb2theS4gUmVxdWlyaW5nIGl0IHRvDQo+PiBiZSBpbmNsdWRlZCBhYnNvbHV0ZWx5
IGxhc3QgaXMgaW1vIGdvaW5nIHRvbyBmYXIuIFRoZXJlIHN1cmVseSBhcmUgZ29pbmcgdG8gYmUN
Cj4+IGNhc2VzIHdoZXJlIHNvbWV0aGluZyB3YW50cyBvdmVycmlkaW5nIG9yIGFkZGluZyB0by4N
Cj4+IA0KPj4gDQo+PiBJ4oCZbGwgY2hhbmdlIHRoaXMgc28gdGhhdCB0aGUgTWFrZWZpbGUgZGVm
aW5lcyBYRU5fUk9PVCwgQ0ZMQUdTLCBMREZMQUdTLCBUQVJHRVRTLCBhbmQgdGhlbiBpbmNsdWRl
cyB0aGUgZmlsZS4NCj4+IA0KPj4gDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi90b29scy90
ZXN0cy9SdWxlcy5taw0KPj4gQEAgLTAsMCArMSw0OCBAQA0KPj4gKyMgVXNhZ2U6IGluY2x1ZGUg
dGhpcyBsYXN0IGluIHlvdXIgTWFrZWZpbGUuDQo+PiArIw0KPj4gKyMgRm9yIGV4YW1wbGU6DQo+
PiArIw0KPj4gKyMgWEVOX1JPT1QgPSAkKENVUkRJUikvLi4vLi4vLi4NCj4+ICsjIGluY2x1ZGUg
JChYRU5fUk9PVCkvdG9vbHMvUnVsZXMubWsNCj4+ICsjDQo+PiArIyBUQVJHRVRTIDo9IC4uLg0K
Pj4gKyMgLi4uDQo+PiArIyBpbmNsdWRlICQoWEVOX1JPT1QpL3Rvb2xzL3Rlc3RzL1J1bGVzLm1r
DQo+PiArDQo+PiAraWZuZGVmIFhFTl9ST09UDQo+PiArJChlcnJvciBYRU5fUk9PVCBpcyBub3Qg
ZGVmaW5lZCkNCj4+ICtlbmRpZg0KPj4gKw0KPj4gKy5QSE9OWTogYWxsDQo+PiArYWxsOiAkKFRB
UkdFVFMpDQo+PiArLkRFRkFVTFRfR09BTDogYWxsDQo+PiANCj4+IE1ha2UgMy44MCwgd2hpY2gg
Li9SRUFETUUgc3RpbGwgc2F5cyB3ZSBzdXBwb3J0LCBkb2Vzbid0IGxvb2sgdG8ga25vdyB0aGlz
Lg0KPj4gDQo+PiBEbyB5b3Uga25vdyB3aGljaCAoTGludXgpIGRpc3RyaWJ1dGlvbiBhbmQgdmVy
c2lvbiB3b3VsZCBoYXZlIE1ha2UgMy44MCBzbyBJIGNhbiB0ZXN0IG15IGNoYW5nZXMgdGhlcmU/
DQo+IA0KPiBOb3Qgd2l0aG91dCBhIGxvdCBvZiBkaWdnaW5nLiBQZXJoYXBzIHdlIHNpbXBseSB3
YW50IHRvIGJ1bXAgdGhlIG1pbmltdW0gdmVyc2lvbiwNCj4gdG8gInN5bmMgdXAiIHdpdGggd2hh
dCB3ZSBkaWQgZm9yIGJpbnV0aWxzLCBnY2MsIGFuZCBjbGFuZz8NCg0KTWluaW11bSBiaW51dGls
cyBpcyAyLjI1LCB3aGljaCBleGNsdWRlcyBDZW50T1M2LiBDZW50T1M3IGhhcyAyLjI3IGFuZCBt
YWtlIDMuODIuDQpUaGUgb25seSBvdGhlciBPUyB0aGF0IEkgc2VlIHRoYXTigJlkIGhhdmUgbWFr
ZSAzLjgxIGFuZCBiaW51dGlscyA+PSAyLjI1IHdvdWxkIGJlIFVidW50dSAxNC4wNCwgd2hpY2gg
aXMgRW9MLg0KDQpTbyB3ZSBjb3VsZCB1cGRhdGUgdG8gTWFrZSAzLjgyPw0KDQpJZiB3ZSBleGNs
dWRlIENlbnRPUzcgKHdoaWNoIGlzIEVvTCksIHRoZW4gdGhlIG5leHQgbWluaW11bSBtYWtlIHRo
YXQgSSBzZWUgd291bGQgYmUgNC4yLjEuIFdvdWxkIHRoYXQgYmUgdG9vIGJpZyBvZiBhIGp1bXA/
DQoNCkJlc3QgcmVnYXJkcywNCuKAlEVkd2luDQo=

