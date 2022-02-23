Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD544C1C46
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 20:31:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277771.474598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMxLW-0007qy-Hf; Wed, 23 Feb 2022 19:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277771.474598; Wed, 23 Feb 2022 19:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMxLW-0007oM-Dk; Wed, 23 Feb 2022 19:30:42 +0000
Received: by outflank-mailman (input) for mailman id 277771;
 Wed, 23 Feb 2022 19:30:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMTg=TG=citrix.com=prvs=046033a78=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMxLV-0007oG-BR
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 19:30:41 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1407c3dc-94df-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 20:30:39 +0100 (CET)
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
X-Inumbo-ID: 1407c3dc-94df-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645644639;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=lnk8BhE0euBbgas7NdN9bZypxmnI+nHh98BTxTV/fUA=;
  b=Wnu4pzyuZTDwC7f0qruohgm2cOdy1CoSI4+bFnt/4iWnvryTe5lQKoax
   1lCMLTpX8etGQYRnXUnqzj7kxejup+EJ6e2F6jEkMfU1gk6aCSAVaAw9N
   UVrLxyWCFnPoBuvuky+KRihtrEmirwqrg6CFgL2MTBHTqwKL/1blFj3tR
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65254828
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PM/kvav8SJKwblH0Z+LXR8+pqufnVIFeMUV32f8akzHdYApBsoF/q
 tZmKWCPO6mDMTb3LdxyOom/9k9Uv5PRx95nGwI4rXw2Hn5A+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQzy4bVvqYy2YLjW1nX4
 ouoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi9wYJ3CvesgfSNGAhNTLaIZwpHHAUmw5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllJyz3DAOlgapfEW6jQvvdT3Ssqh9AIFvHbD
 yYcQWQyNkmcM0cfUrsRILIEw73wuEnTShZBjmCTjvYOyjD36gMkhdABN/KKI4fXFK25hH2wp
 GjL4mD4CREyL8GExHyO9XfErvTUgSrxVYYWFbu53v1nmluewioUEhJ+fUS/iem0jAi5Qd03A
 04J/isjq4Ai+UrtScPyNzWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM05XzUu0
 neAmtr7Ajopu7qQIU9x7Z/N82n0Y3JMazZfO2lUFmPp/uUPvqlq0CLBa9lePpSrn+/YCT6v+
 R6KjBkx0uB7YdEw6423+lXOgjSJr5fPTxIo6gi/Yl9J/j+Vd6b+OdX2tAGzAeJoad/AEwLf5
 CRsd922sbhWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirmUWKxC
 KMwkVkIjHO2AJdMRfUrC25WI553pZUM7fy/CpjpgiNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FLZvxUChCWf47k2reqwIhPVkDnHxWKYT7H82T8vha+eDGOC79pUktajNikdzVHIvb+V6Io
 r6zxuOByglFUf2WX8Uk2dV7ELz+FlBiXcqeg5UOLoare1M6cEl8W6656e5wIORNwvUK/tokC
 1ngAye0PnKk3iaZQehLA1g+AI7SsWFX9yxjZnV0ZQ7ys5XhCK72hJoim1IMVeBP3MRozOJuT
 ulDfMOFA/9VTS/A9ShbZp74xLGOvjzy7e5SF0JJuAQCQqM=
IronPort-HdrOrdr: A9a23:0U8IdK/sJxOgUI9JPhBuk+Fpdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQwdcdDpAtjkfZquz+8I3WBxB8bvYOCCggWVxe5ZnPLfKlHbak7DH6tmpN
 1dmstFeZLN5DpB/L7HCWCDer5KqrjmzEnrv5ak854Ed3AyV0gK1XYcNu/vKDwReOAwP+tfKH
 Pz3LskmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlal9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4kow3TX+0aVjbZaKv+/VQMO0aSSAZER4Z
 3xSiIbTodOArXqDyaISFXWqk/dOX0VmgDfIBej8AXeSIrCNWoH4oN69PJkmlGy0TtQgPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59Zs5Vza/pWVFZql/1WwKqVKuZ1IAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkaoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWsKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEnief/FmHKc7hSwlbF/NLwgFkPsulKSRkoeMMYbWDQ==
X-IronPort-AV: E=Sophos;i="5.88,391,1635220800"; 
   d="scan'208,217";a="65254828"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaJL+GugevdS6AyUL1F+rYiOEVAdMO40Q/hXsg2EjiOIiaz+RIW6z18St2QplhUDd+99GrHbyp6y5bevXNnIhr+nFC7oxPZ28/akj17FOTHvm9X0uXovuX2ZtjZCtDP6Qc+JS1JODXELKbb+IEndyff+7vFDEH+uJpiZvkm1ke7DmEqOobYKJHo1XZDuZH3aiQEFKrabFolKzLFltLmnA3jv6s5oO8UjyR8CwAQ53KWi10b13zRy7aAmtI4QDh1jNgwY0RWilTq0+O8NzosG4Ghxc7nAhlOj4crw4HhymFCzOeQe59EAcvVAHH15L8GB1fEfoJh2up0BfwgL7e2egA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnk8BhE0euBbgas7NdN9bZypxmnI+nHh98BTxTV/fUA=;
 b=T5yhXWtMw9/o19iqGFKWBftYWQpvZFSV9r8LRDekTUgop6CEfulLOBYF4BQYSxeKlZ0WcbO1LZaL5b5UoL1gNpB4yTBiSCGuNPeHlxTlE1Sobto/tetHrRpQrf65fjpPJHBDWwgt+ZxKkWRSTycMFcfz1TEhp4CHxz0nUiUnZFLNUn7+4LDdNHV27HNFjEKGSgtFJkfXmgX12l0J6OvUOTg79XlbNKeKn+6XlP966v96r4t+jCkI0DKHrjhtqjcP5G9OKDcSCFxwc14BabGaKOD3EA+ljCMVLN3gl8SDClylbBNUP7vI8Knt97+vOFwZmP7qHO4d9/S1Mwb+FkczCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnk8BhE0euBbgas7NdN9bZypxmnI+nHh98BTxTV/fUA=;
 b=JXQmvWmUKNQ9ixpyvlWq1X/ucDlXA6TDYc2o/v5Smfnv4DCyG6tJzaoWvAN2ZyNq71Plc067w4LsTfSz87VUxjpMrZi5gdCzJ5s6gYTQejMjKJ8vjtSzF7mb3GPwtuxKBqoPOSVtAon9gyUhUWLEvo25t9vhiv34qphFZ4mkzhM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/mm: Remove always true ASSERT() in free_heap_pages()
Thread-Topic: [PATCH] xen/mm: Remove always true ASSERT() in free_heap_pages()
Thread-Index: AQHYKOShk/ueVOZf6kGfV3gTr3FtFKyhhdyA
Date: Wed, 23 Feb 2022 19:30:33 +0000
Message-ID: <a3f52f29-3280-89b6-5db5-de224dd037cc@citrix.com>
References: <20220223183831.5951-1-julien@xen.org>
In-Reply-To: <20220223183831.5951-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2672ea3d-587a-4b0a-bddf-08d9f702f602
x-ms-traffictypediagnostic: DM6PR03MB4122:EE_
x-microsoft-antispam-prvs: <DM6PR03MB41226A856DE555515AA26F81BA3C9@DM6PR03MB4122.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sRLkhVlP0hphv24CdQD2ZKCCqNmjuLOsoZEgTzH4jGcMzZ0p+dnUcP+1lfUCT+k7FU5KhrUcEvPWKm64vs7ykhjS3CqG0bUmyYMYYfXBFqUIdsNtiFs7opS2EXagaOYWQXZJdPiqeMT3KTCyVtaBIVsitywv0BgislQVnkVI83aJy+ZQ/lUBQx6EW3HBKO5KSiqe6wSHz9JFSqn0Jlft+HboCTMDSCogZyZgBE9aRrnXTnAA5CJ4+q4/HkRTMS6chyv6pHZtohl+SLMISdb6RgqRRdqV5DWiiAnR3Cgcy61SRbO7QHqnrzmEvR2UddyVYMP36GjCuW1OJUd6WIm+2d3OBvpWQ0r95NqDe3ZR5zItuckK//aUzcy/5d2VS//sTqH02fSu/uAsY0QwQKTdVilXTAWwF3Q6m7plGO4+k5WxOGDacJuG2GnDaktLFixvJhZHB3G2/afojlAucOX0zsd+1htv6ibOT29L6gztfPghIC9/d/k8bd39Ifaaj/spAb5eLyh0XO7DUnlHrMGROH1aFpkQLuvNb6L8ZPeOFNvA/GYqefP44GAXB1n/+qe3uDe35xh08qvtXK41cwS8J0shNvzhmRO+2B8wdtlVY0pCmGN2Tk359i6TTCoFkXmeBLXT1aQl/S27znmm7YJqFNKs7fIFeSX3tBUuLIi+oKyYUR2hVtcpe0+bve6AnLwCkgfCzSHdgrHg1MEWS8hZnG4nC8DuSfYHsgRVN4c6gdLbzQoZXncTTtBMEM1acj8H2TQyG+aoWiHmnNWwFFh4KA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(36756003)(4744005)(38100700002)(8936002)(38070700005)(5660300002)(2906002)(31686004)(71200400001)(110136005)(76116006)(316002)(6486002)(8676002)(66446008)(508600001)(186003)(26005)(6512007)(66946007)(66556008)(122000001)(82960400001)(66476007)(53546011)(54906003)(31696002)(86362001)(6506007)(2616005)(91956017)(64756008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUoxbkFCVSt2VjJCdWNORms0eTJFNnV5SWhob3ZqbEZmak5pN081MnRPYnJB?=
 =?utf-8?B?N0QzS25xeVFpNjN3ZEF4REhsNUFJNUpPeG5IRjJGQWNFa3BIZjVGeElFSkxq?=
 =?utf-8?B?NTBXWUo5NzBud2pkUTZKTjMxcEY1UEZla1h3eWoxaXN3UVRpUUNabTZhZkhO?=
 =?utf-8?B?RVVNWGlQSzd3SVI4dzVVeVNsRy9Bdng1cGhibG8vTW9UV0NsSE1SSXZSbE1z?=
 =?utf-8?B?OURBVU15Q2RyQ0tyNTNGZUM5aERSWjJzRmwwZkVPaGZ3OTdMTjlQdTVKUW1V?=
 =?utf-8?B?YmhubURYVW1qaWw4OTVOMm1aN1BtelI4eFZRR2ZQK3NhVWNwZFNtZk1VQnYy?=
 =?utf-8?B?ZFp6ZGZPYU9LVmc3M0pXOVhRcGYwUWxoaGRyZGRKc3hDS1VzdU9oeldJZ2Nk?=
 =?utf-8?B?WUJaZXA0QlJqSktydG14a1Fsekgzb3N5cW9hYW5JM2gzUm16djlIUGdPdXo1?=
 =?utf-8?B?VE03YjRiRmxPNlByVWVValcvSjZJREVkY2l3SGdGcUZ5clM0aEE0S0k3MHY0?=
 =?utf-8?B?WDZXQVhweGd0NmFmL09kNVpjTTVRRm1QYVZtSTBIUEVZK2pmZy8zUDkyRlAx?=
 =?utf-8?B?b0RXb0dLUFpEckNlbThNWVZJUlg2dWdmemZhM0NvbWVTbnArT252SEQzSStG?=
 =?utf-8?B?UVB6ODBvUDBEZ3lMNExKZ29YRUZlbFFiK1NLaXlLbmRlYWdudUNtWi9aaUxV?=
 =?utf-8?B?STZFdWQwZG03d1JBRFVvdnR4L2pEbitYdWZZWWV3eXJDQzRLNjVqM3RjUzNL?=
 =?utf-8?B?bXRGL042UnVsQVJFU3IzVXl0WENVVHkxSHRrMzhFV1c3MjViWWRSZ2pBQVJP?=
 =?utf-8?B?WlZlSjR3VUFsSHJ1NGVqNm4rOUJDTW5iVlVxYzZZWDN1c25ESWpIVGZUb3ky?=
 =?utf-8?B?b1R6dDVqSHoyYTh4SlRXSGFaRXdwYllHWUd3QXQ4SzdBcTJxcVhoOTB4L1dQ?=
 =?utf-8?B?Tkw4VGV3MUxBR1RkL1NOV1RUMms3TXMxYWREbGFabm5MUm9nNTRPRldmT0ll?=
 =?utf-8?B?ZmxIR0JFMUx0QUxMUk1WR1ZiOUluZmVBYkFLTnVtNjJkL1hqT3prR0ZseFlB?=
 =?utf-8?B?aDd3bjRMODVEVHJsaUU1aFFFSTN4M1NvbnV1MFVFYVplNmJIVFFmVTFzSHk1?=
 =?utf-8?B?M0N1b3ZsbUxtTCtoYU81TGI4VHNMR2l4ZlFnVXhwNnFXVFpIeXJSTHVJVU1F?=
 =?utf-8?B?Q1ZlaEVDWVU1VmRHbTdJNEpWZm01VEJnU3crZzRGYThDMnZuOFM2VHNMcDds?=
 =?utf-8?B?dHYyQ2lVa3pkQzJIdHF5UUhLSzRab3JxeHc3SmVYS0FqU21qVmFlbURwM0Qr?=
 =?utf-8?B?ci92MUJ3QVJjQXh4WkNHRk1NZVNFeTlmekxnU3h3aUhwdnkzOGJiWEM5cmZD?=
 =?utf-8?B?cGxiS3BvbzZRdjYyTTdQOUEzMHNZME0rM2pnMGxRc2gvUzdYQk1ZV0owa3NN?=
 =?utf-8?B?VzlWcC9vR2o2WjhmTFU5V2JPMTZUTVRnZWlLcFdFTGo5cnhNK2tqYzJFblgv?=
 =?utf-8?B?SjFLK0tpalU1MGNQY3dSV0thTmMzVmpKU2R2YUZ3dlBUVFBGNVR0NENEQnhy?=
 =?utf-8?B?Qlh5RHlqSzNneEZGM1NYQmRpdzRLcy9BMTY4eVhQdGNVWG1hYzNUdWRibm9B?=
 =?utf-8?B?S3k2RlB5YWdSMWk2eVlwanVpblIwR0ozM1p2ckY4b3oxYjdTSTh2WEJ1UlpT?=
 =?utf-8?B?YWZFTHEyT1ZMU1hSS0FqUGcyZDRoYmIyVm9NMUFQdDBZcml0cmE3S2pSWS8r?=
 =?utf-8?B?SmxraWdLRllEelNMSWhYMkFJeDJXcm13aUFVYzRGcUhYNEhWck1welN6czV6?=
 =?utf-8?B?YXlnRGFoenFLQ25haDhQczJxdVJLWU1XZ1QwOXZ5WjJFQUZBejlCTlQrc1Nw?=
 =?utf-8?B?ZnpOd2dVZ1NzTndaZ0hqYnJTVDIrVmJpZmFDb1dSQ2NESEVUQWxMYnhNTXow?=
 =?utf-8?B?ZWYvTWorc2RyS0x3bUExVWhBaEp1bHExUjh0S2MwZzgwQ09MaDF2bkx4dURz?=
 =?utf-8?B?dHN3bUFHYnQ0ZzBBOXBoazdpTG5hOHJ2bkIzdXBZdHhGUzZOcGhCYzViRlZR?=
 =?utf-8?B?TGl4UTFlV09NMnZFMWVLVVlObFgxOXZiZ2hCQWg1SUtEdzJsR20yR3RuRVRz?=
 =?utf-8?B?cmZaT084MDdSTHFNbEVPQ1VvUWhPeUtpWVRNVU00TXlQTEtZcExycWdvWmFI?=
 =?utf-8?B?eGZOdjNtcGxNcThtODJFbk80eVpicW14cFBqS0xZNHFodE9rYlh6R3AxRXhW?=
 =?utf-8?B?Titna2pZMFJmdGVQbFN2OU1iSGlBPT0=?=
Content-Type: multipart/alternative;
	boundary="_000_a3f52f29328089b65db5de224dd037cccitrixcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2672ea3d-587a-4b0a-bddf-08d9f702f602
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 19:30:33.6506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3sx+1z1SopUNYXO1vm6edb19n84CEVgBS0G3+zwaaniFb7e7EQd7AVW99IX+SmoddRFwDoaWYuFWEcoG+/v2VT2HH71/DVAytFlgT0vtOOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4122
X-OriginatorOrg: citrix.com

--_000_a3f52f29328089b65db5de224dd037cccitrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjMvMDIvMjAyMiAxODozOCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KDQpGcm9tOiBKdWxpZW4g
R3JhbGwgPGpncmFsbEBhbWF6b24uY29tPjxtYWlsdG86amdyYWxsQGFtYXpvbi5jb20+DQoNCmZy
ZWVfaGVhcF9wYWdlcygpIGhhcyBhbiBBU1NFUlQoKSBjaGVja2luZyB0aGF0IG5vZGUgaXMgPj0g
MC4gSG93ZXZlcg0Kbm9kZSBpcyBkZWZpbmVkIGFzIGFuIHVuc2lnbmVkIGludC4gU28gaXQgY2Fu
bm90IGJlIG5lZ2F0aXZlLg0KDQpUaGVyZWZvcmUgcmVtb3ZlIHRoZSBjaGVjayBhcyBpdCB3aWxs
IGFsd2F5cyBiZSB0cnVlLg0KDQoNCkNvdmVyaXR5LUlEOiAxMDU1NjMxDQoNCg0KU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT48bWFpbHRvOmpncmFsbEBhbWF6
b24uY29tPg0KDQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT48bWFpbHRvOmFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

--_000_a3f52f29328089b65db5de224dd037cccitrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <699729DBBAC8274195917B8A0EBCEDF6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBjbGFzcz0i
bW96LWNpdGUtcHJlZml4Ij5PbiAyMy8wMi8yMDIyIDE4OjM4LCBKdWxpZW4gR3JhbGwgd3JvdGU6
PGJyPg0KPC9kaXY+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBjaXRlPSJtaWQ6MjAyMjAyMjMx
ODM4MzEuNTk1MS0xLWp1bGllbkB4ZW4ub3JnIj4NCjxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUi
IHdyYXA9IiI+RnJvbTogSnVsaWVuIEdyYWxsIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5
NkUiIGhyZWY9Im1haWx0bzpqZ3JhbGxAYW1hem9uLmNvbSI+Jmx0O2pncmFsbEBhbWF6b24uY29t
Jmd0OzwvYT4NCg0KZnJlZV9oZWFwX3BhZ2VzKCkgaGFzIGFuIEFTU0VSVCgpIGNoZWNraW5nIHRo
YXQgbm9kZSBpcyAmZ3Q7PSAwLiBIb3dldmVyDQpub2RlIGlzIGRlZmluZWQgYXMgYW4gdW5zaWdu
ZWQgaW50LiBTbyBpdCBjYW5ub3QgYmUgbmVnYXRpdmUuDQoNClRoZXJlZm9yZSByZW1vdmUgdGhl
IGNoZWNrIGFzIGl0IHdpbGwgYWx3YXlzIGJlIHRydWUuDQo8L3ByZT4NCjwvYmxvY2txdW90ZT4N
Cjxicj4NCkNvdmVyaXR5LUlEOiA8c3BhbiBjbGFzcz0iZGVmZWN0LXRleHQiPjEwNTU2MzE8L3Nw
YW4+PGJyPg0KPGJyPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOjIwMjIwMjIz
MTgzODMxLjU5NTEtMS1qdWxpZW5AeGVuLm9yZyI+DQo8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJl
IiB3cmFwPSIiPlNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8YSBjbGFzcz0ibW96LXR4dC1s
aW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86amdyYWxsQGFtYXpvbi5jb20iPiZsdDtqZ3JhbGxA
YW1hem9uLmNvbSZndDs8L2E+PC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8YnI+DQpBY2tlZC1ieTog
QW5kcmV3IENvb3BlciA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWls
dG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbSI+DQombHQ7YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbSZndDs8L2E+PGJyPg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_a3f52f29328089b65db5de224dd037cccitrixcom_--

