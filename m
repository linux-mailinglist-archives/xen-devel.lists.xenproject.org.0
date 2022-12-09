Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 987D7648113
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 11:36:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457811.715799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3aj7-0000N1-Ie; Fri, 09 Dec 2022 10:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457811.715799; Fri, 09 Dec 2022 10:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3aj7-0000K9-Fb; Fri, 09 Dec 2022 10:35:33 +0000
Received: by outflank-mailman (input) for mailman id 457811;
 Fri, 09 Dec 2022 10:35:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/vX0=4H=citrix.com=prvs=3351f26b0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p3aj5-0000K3-LC
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 10:35:31 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 329e3079-77ad-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 11:35:29 +0100 (CET)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Dec 2022 05:35:26 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5112.namprd03.prod.outlook.com (2603:10b6:a03:1e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Fri, 9 Dec
 2022 10:35:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 10:35:21 +0000
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
X-Inumbo-ID: 329e3079-77ad-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670582129;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=o35BP+XDZd5M2HlVpQVpmeE/cPxw11ex4+OapRecYpY=;
  b=DHl12mQVfrZiIfWB7DJF5oUTS6FJqdv210pfCSxcRO1wHF8OGgZSxdgb
   M2zp0LWrICAliy4h/l0tLaG2bb2m32R2QZw1QySuhqfDmPyZMaqymXVhP
   5LurRIvrxKAVDY3sfdu13byqOaN0rPy0HioSUIEHxsOIkTWGd/NPpeYoc
   U=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 87525628
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+VWtB6Dv2+GUNRVW/wviw5YqxClBgxIJ4kV8jS/XYbTApDsngTdTz
 WJKW2nXPvmJZzH8fopwYY++pE0PuZ/Smt9nQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WlA7wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5fRuHXxgx
 MYhMDErayyIwL6sxYucY7w57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvDa7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr+QwHmmBthCfFG+3uJvvh6R1moNMhk9ZUOpptXhhWqvUfsKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluP1TM9KGYDYWoISFUD6ty6+YUr1EuQEJBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNO+RENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:G0G2faEPm+V0E1pBpLqE0ceALOsnbusQ8zAXPiFKOGVom6mj/f
 xG885rsCMc5AxhOk3I3OrwW5VoIkm8yXcW2/h0AV7KZmCP01dAbrsD0WKI+UyGJ8SRzJ866U
 6iScRD4R/LYGSSQfyU3OBwKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.96,230,1665460800"; 
   d="scan'208";a="87525628"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1vNqb3YXl2c3TibOV+FgplKKN3j8Gjlak10pUmpxrlyZkgJbobvewlRlyzxI0sVBLtJzfs9cWp4xfAVIQO/GGojUsL3s9aJ/yQZjzi2PP5aLBQOTvmQIwDR9BtuG9rwNTV6gX/H9Sc0H2Io5YAHSVW5xYF5YG1Ja5y/8V5HlbbksMD0SyQens2afRo41Cqwc7xZSDMRKM7KEkUr4HUsTigSaPU7upqxMUTBePEw+lSxoMZ+gHAQd9nVIIk48DasAGmmvZ7ZOQbwRmAbgcVK5qGiTK5ZQh0Dud/oLcoMoGzXgPPyQUZPXkeNXqQ7xb4bEPhR9goa8kK2Oi/9m+AKzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o35BP+XDZd5M2HlVpQVpmeE/cPxw11ex4+OapRecYpY=;
 b=Gc2BGLbvwNa7uXzs3FDYYoOaBJH5Xo8tKHLMb/KnalSbvLGf8Q3Yhh/mRXBp0Lqzn44B/VkBheQetfCLMzb1WfpSR7h8Nkv/vidZDk3gDYCa05c+e9KbpIba9GJdbJFXkLHBD072ofSmhdEaHl/iZnhjdfEhOLI4iKKqthx/G2XX/blmhwNrS1a36XM9hkJxqE9eE1jLIy8MNp3vOqE/ueQ7AGuS/0zJtevsshJoEOCWPr8Av2wmPnX9HkcRgeIdCW6S3UQ2Uf30WmuVY1gXiPK2PJ0Lk0R1tiq4zKIifdu2I+925tktD7CILKNdZdhj4/WmnbqhuRviM6DMhEUhUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o35BP+XDZd5M2HlVpQVpmeE/cPxw11ex4+OapRecYpY=;
 b=E5p0RVkQYVD5vdm03Lp63oUFhX2ISs6NeeP8QPGIzFlxlPpsKLvtb94W8Jj6lNZqyNFCws6XsjeaLJZEhWaWEWzJYB4DrHyBB5guYdryk0IrDrZSTNIxm3yz6GIHuLRux//kSfI3lBn8O/rzIapwN4vrj+g7m78w0orxp/fKS7g=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] x86/SVM: restrict hardware SSBD update upon guest
 VIRT_SPEC_CTRL write
Thread-Topic: [PATCH] x86/SVM: restrict hardware SSBD update upon guest
 VIRT_SPEC_CTRL write
Thread-Index: AQHZCve5uOkbNmy6S06b6+y4P7v7ga5lU+cAgAAKCAA=
Date: Fri, 9 Dec 2022 10:35:20 +0000
Message-ID: <0fdb4954-c7aa-7e3a-f683-015600cf73a7@citrix.com>
References: <6189fed4-2aac-8ca3-90f6-7a750a8993dd@suse.com>
 <Y5MG/osKnrCMsztu@Air-de-Roger>
In-Reply-To: <Y5MG/osKnrCMsztu@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BY5PR03MB5112:EE_
x-ms-office365-filtering-correlation-id: ff49355a-ca17-466a-33a1-08dad9d11285
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eoTgNMwvt7WHnUbZkUG/0nbHgiyMZRxCyIMn277rjPhVIFJ0GaO08hrNNOH2LnsevnEc85hohjFo3jNECspLesFcUxZ/+d2heKXIVaafEhciXicMliB13RXhZjZ4fHZOxfSJDkuzZUNOC8V6xQ2NVW9prapMFt9VTYW0Dfxe3GKBtAmi9zS9M8qNCfb6IykswJPIU/VDO1edUMvFoH5RdN1lTh2L1oapm2mD6TGfBCXY4t8b61OgJRlGnbF03xCEQYVifOjfUpGuSbaNBZRkMBTOmLxSTcFN9TVUUIiYT8DHu4Zr03idNRChj5GLrqHM9v9v35SoC1wm/T6TZhgr40X/b36UicBW9jCI35Sfa+AqytQChvnwbqd3M70WLvAruBM8G64XVj3tBQAPC+NQ++g7nqLYYCgvpHdhmVfTqfryB2tsjiqnnKbj5F1SEDrZ5wOREo+6yJ6pwN2Xji5ke5hXb9TaA2wEzQpnY08nTWegljuC+Zuwfgbfw1mjvRFpjSyszR1ssopRuRbFyaDrsOF/V63j8t5DWtStzE66ti2hX/CC3efHeOlq7jID78dmwXb74QtXFNto9bNtbjl9fkDzsSRCDFkHqfAqMCUAhVQKw3a3JO5u5gMYGA+MolZ9ZxbCKdF9W+IxZ8KI1JnuldNJZQAY3swkd1TJLlxZlG5L5DCo6OapP60tBfGsa/vwybn4f6+u5Tabqo8HWZmj386IDrEWrEtP8N9tc1E9sZdsvd3ikAE/LNrf5287cvvmmxxOtTLQCLyNFAkKCBLnqQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(396003)(376002)(366004)(451199015)(38070700005)(2616005)(82960400001)(86362001)(38100700002)(122000001)(31696002)(76116006)(91956017)(316002)(31686004)(66446008)(2906002)(66556008)(66476007)(41300700001)(66946007)(8936002)(64756008)(8676002)(4326008)(5660300002)(36756003)(71200400001)(508600001)(26005)(186003)(6486002)(54906003)(53546011)(6506007)(6512007)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dnZsSytXYVJ5TzlrYXNkWkxBNnBWdmE0M0dvQ2FlZEI4YkRicVhqcnlqM2VO?=
 =?utf-8?B?aG96dVprS1M4amJMRk4vWUtkbHdjdkd3ekVUc3pCS1ltTE0wWEcyZ2JxQmE4?=
 =?utf-8?B?QVRpZUxOS3EwQTErYVlWVUV2bzdCL3FNNzNCQnZWb25USENSWGR3alBKais0?=
 =?utf-8?B?dW1uUGhYNUhQdzEyUkZDZWNTYVZXVDJoaFh1aHhpekVsVUt5QkFBcTkwRlVh?=
 =?utf-8?B?RlRvd3ZEK2JSVEpINFFVbC9ibGtKeHRpUWcxakhGZm1jOXhIdm9LaDQwcUFM?=
 =?utf-8?B?L0FrVXlPVDNHUjhvWkYrR29kVFZlMXNhRk1tSWNnQ01tZVZ1bkY5Z091Rk56?=
 =?utf-8?B?S2lsWlFPRjV4dy8ycDF1cEw2Smk3UXlSemt0SktKL1JQOUFZTE5RaXVIaU5L?=
 =?utf-8?B?a04xTWdhTGY3NFZGcFNjb1pXM0ZpWmxNUzhkbzNlVnh1Z2YxeEl6dC8rSU41?=
 =?utf-8?B?Z0hIK1kvZlRPVUVXcjFLQitZOUErM3NadGpMV2k4eWNIaWhBSUwxTFpuUXpL?=
 =?utf-8?B?RmZhdXkvNVUxQTV2QnF1SCtGVnRubjduYzBvazVQQVlkbTdTdlYzVmlycmQ0?=
 =?utf-8?B?NFo3dWxmbGUzM2FTVWo3dHlXN3dHRFJvUFltT1FlbjNsVSt4WmV3SHVTdVR3?=
 =?utf-8?B?MVNXRGJ1L1MvVHRqK2tsdC9nVGhYRSt4b0ZsSElxVUhFZWVhS2dPM3VJOGlo?=
 =?utf-8?B?enVpditpdjUrVUhjanllb3RSenRaTjhwYm9vWCs0WUFKalJWUDUrNjRXODhX?=
 =?utf-8?B?RUNjTXBUTng3emQ5aDBrQ1FyUTgrTUhmYVpZOE5hZGFrdk9RRWQ5UlNDMDQ0?=
 =?utf-8?B?L3pkMWZUMzFPUDV2SDRWanpjRkxOelI3dWhNTVpCL1VZRzVzeVZKejJHZ2FI?=
 =?utf-8?B?WXpLTmw1Um5DOGZVUC9XWThZYUEzMDJrUFhOU2I2Ulh0VXBPS05RNlo4ZnZD?=
 =?utf-8?B?L0F1SXRlQnhPNTdKTStuckd2aWNxK2RMZWFGOTBBNEdyUUw5ZVJ2aWZxVGI4?=
 =?utf-8?B?aTZPajJaRWs1NzFSZ0Q1RVlscXI1OU5PQm5yUnE0LzZCaEJOMWJLdHNuUlpl?=
 =?utf-8?B?UjRVbEV2VnZ3d3ZYSlhOblZteFdvVnY0MWhLaTlaeVFBWHNjRmFjRE5xdlc0?=
 =?utf-8?B?TC9LaU0rZzJoVkxOd29tOU5sVm8xNldBaytvQjU0NjRGTjg2N0ZLZitwdlRn?=
 =?utf-8?B?aXhzdXU1VStLNmxNR0JxMStzYlhNZ0FaSWZVbURNMGFDbVFDOXh3QVZlRDFE?=
 =?utf-8?B?WVF4cGUxZzZQU2VSSlp6MFM1Q045RTJ6bWNzVnc5R2c1RlZaUXlLRm81L2JJ?=
 =?utf-8?B?Ri9WelR3cTIvaFdpakFhU1RvYVhLVWEvWTZhL2x0cWc0MEJCQ2hOL05LdUYz?=
 =?utf-8?B?NHB3dmRlNzBHd1lBM2hyUDZvcGhWeFVlc0UyUFV1YSs4L3JEb1c4SUhGb0Fa?=
 =?utf-8?B?MytreEd2NndFeGF2QmF2VlNkOU5RVjI3OExidmh0SUpZemxXb2xVck1tK0dL?=
 =?utf-8?B?aGZycDI2M2hDMHV6Tjh1VjlaNzFzc0toQ1BjS24xc0JySTc5bVFwM3Y5N3Fh?=
 =?utf-8?B?b2VRcDRkUzBNc29kakhiTGYwb2poaHc0TW43bkQ5UVVTdVJRUXBpTFVlSVlG?=
 =?utf-8?B?WEt1dFFMRGtqaGJCQXpuOTE5aTJvdHdaVVB4blZlWXlQS0VjVEdnRTcrVjFF?=
 =?utf-8?B?Qy9OZFJLRm8vYlM2aUZxRDh1VkVEMWhzWUg5dFpHTDBJWmVPWjA4VHhYdjNC?=
 =?utf-8?B?OUd5Y0VHMDdEazdzcVlkTUNkdjNkV3VnWnB6bVlESG5yeXFjZ29rTGtFd2dh?=
 =?utf-8?B?b1dMWS96SFlJSk9KR1JVNHJnVTBNbFlqSi9ueHByL0RIc0VveXFrTDY5T0Uv?=
 =?utf-8?B?VlVRbXpoaHpJUlNlS1lhOFdPZzBzQjFZSUN4NVdNT29MTk85QW11dEpvdm9w?=
 =?utf-8?B?SUZhbUJlSWQrVUNKWkZmUmQwNE9tT1FYbmpUa1oxZ3pwb2ltcXZ6NTFZalp2?=
 =?utf-8?B?Snc0Y2hYR0F6WWV4QkVnRkY5VDhNaU4reE9jL1ZoWTdjZUVqYTJGTlMxSmpz?=
 =?utf-8?B?NUhWRytiQlB4MDhtNjlBa1RUSGdiUmZ4OFlabGppc3RQajdNNldMZ051MWdv?=
 =?utf-8?Q?I9G8Jxfpr0Ebruxuvr2ZtoEGC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D0A7346395C554FB72C3AA3DDB6608C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff49355a-ca17-466a-33a1-08dad9d11285
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 10:35:20.7833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W7Mb+fcyforcnU0mxq4uiQvZpbke9+ZI8ZyzocN0Ts/i+k0V5vKE/6gi4HUSbhp24ttZ8HpQFZDnYpH0Qj1ozvgexIQS2dfja9PDRfTzLNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5112

T24gMDkvMTIvMjAyMiAwOTo1OSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gVGh1LCBE
ZWMgMDgsIDIwMjIgYXQgMTI6MjQ6NTRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBj
b3JlX3NldF9sZWdhY3lfc3NiZCgpIGNvdW50cyB0aGUgbnVtYmVyIG9mIHRpbWVzIFNTQkQgaXMg
YmVpbmcgZW5hYmxlZA0KPj4gdmlhIExTX0NGRyBvbiBhIGNvcmUuIFRoaXMgYXNzdW1lcyB0aGF0
IGNhbGxzIHRoZXJlIG9ubHkgb2NjdXIgaWYgdGhlDQo+PiBzdGF0ZSBhY3R1YWxseSBjaGFuZ2Vz
LiBXaGlsZSBzdm1fY3R4dF9zd2l0Y2hfe3RvLGZyb219KCkgY29uZm9ybSB0bw0KPj4gdGhpcywg
Z3Vlc3Rfd3Jtc3IoKSBkb2Vzbid0OiBJdCBhbHNvIGNhbGxzIHRoZSBmdW5jdGlvbiB3aGVuIHRo
ZSBiaXQNCj4+IGRvZXNuJ3QgYWN0dWFsbHkgY2hhbmdlLiBFeHRlbmQgdGhlIGNvbmRpdGlvbmFs
IHRoZXJlIGFjY29yZGluZ2x5Lg0KPj4NCj4+IEZpeGVzOiBiMjAzMGU2NzMwYTIgKCJhbWQvdmly
dF9zc2JkOiBzZXQgU1NCRCBhdCB2Q1BVIGNvbnRleHQgc3dpdGNoIikNCj4+IFJlcG9ydGVkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4gLS0tDQo+PiBUaGlzIGlz
IHRoZSBsZXNzIGludHJ1c2l2ZSBidXQgbW9yZSBmcmFnaWxlIHZhcmlhbnQgb2YgYSBmaXguIFRo
ZQ0KPj4gYWx0ZXJuYXRpdmUgd291bGQgYmUgdG8gaGF2ZSBjb3JlX3NldF9sZWdhY3lfc3NiZCgp
IHJlY29yZCBwZXItdGhyZWFkDQo+PiBzdGF0ZSwgc3VjaCB0aGF0IHRoZSBuZWNlc3NhcnkgY2hl
Y2tpbmcgY2FuIGJlIGRvbmUgdGhlcmUuDQo+IEhtLCB5ZXMsIGl0J3MgZ29pbmcgdG8gdGFrZSBh
IGJpdCBtb3JlIG9mIG1lbW9yeSB0byBrZWVwIHRyYWNrIG9mDQo+IHRoaXMuDQoNCkl0IHNob3Vs
ZG4ndC7CoCBUdXJuIHRoZSBjb3VudCBmaWVsZCBpbnRvIGEgYml0bWFwIG9mIHRocmVhZF9pZHMu
DQoNClRoZSBpbnRlcmZhY2UgdG8gdGhpcyBmdW5jdGlvbmFsaXR5IHNob3VsZCBiZSBXUk1TUi1s
aWtlLCBhbmQgc2hvdWxkDQpzdXBwb3J0IHJlcGVhdGVkIHdyaXRlcyBvZiB0aGUgc2FtZSB2YWx1
ZS7CoCBBbnl0aGluZyBlbHNlIGlzIGEgdGltZWJvbWINCndoaWNoIGhhcyBhbHJlYWR5IGdvbmUg
b2ZmIG9uY2UuLi4NCg0KSSdsbCBoYXZlIGEgcGxheSB3aXRoIHRoaXMgd2hpbGUgbG9va2luZyBp
bnRvIHRoZSByZXBybyBJJ3ZlIGdvdC4NCg0KfkFuZHJldw0K

