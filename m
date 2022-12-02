Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5939F6402F9
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 10:12:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451614.709396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p125M-0004Vp-2P; Fri, 02 Dec 2022 09:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451614.709396; Fri, 02 Dec 2022 09:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p125L-0004U3-Vw; Fri, 02 Dec 2022 09:11:55 +0000
Received: by outflank-mailman (input) for mailman id 451614;
 Fri, 02 Dec 2022 09:11:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeCl=4A=citrix.com=prvs=328e240bc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p125K-0004Th-Ez
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 09:11:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5767ff14-7221-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 10:11:46 +0100 (CET)
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Dec 2022 04:11:50 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5648.namprd03.prod.outlook.com (2603:10b6:a03:288::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 09:11:48 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 09:11:47 +0000
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
X-Inumbo-ID: 5767ff14-7221-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669972312;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=UsmSSvJtnOxRcEe+Jq56rbcDbFLS0hlP/R7CJAdg5fs=;
  b=NRfnWdzgS2MNwTSYMp16sNDefcJH41NGEd6kz2/OjX9N+jxCKHytHQbf
   IetMNJNJdge219zdUIHaPT6GltvMuEy0jbuNv9cMYQtdqAcMHv2aBnbff
   ePoBX1WkI0vP+Z3RuV9oAPq0U2IJnryAIwHXigvyJYZ2yiAW4ETFJz0ac
   g=;
X-IronPort-RemoteIP: 104.47.55.105
X-IronPort-MID: 88751284
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vRGZnq412wDKLzOYoPDp9wxRtCbGchMFZxGqfqrLsTDasY5as4F+v
 mAXWWGGPv/cNmv1f9lxO96/oR4GuJPTyNdnSQs5ri9mHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKoT5geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m1
 a1beDcycki/n/uQkZW4ZudNg+QyM5y+VG8fkikIITDxK98DGMiGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooiOWF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNJCS+DhrK426LGV7n0aWUBLTHSEmvSGsF7mXPxgF
 xcUqxN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhqgGqy8qDqzPW0QMjUEbCpdFQ8duYC7/cc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNtWuVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:pXbKeqMoeSmnh8BcTtSjsMiBIKoaSvp037BL7TESdfUxSKelfq
 +V7ZEmPGDP6Ar5NEtMpTn4Asi9qBDnhP1ICOsqU4tKNTOO0FdASrsP0WKI+VLd8kPFnNJg6Q
 ==
X-IronPort-AV: E=Sophos;i="5.96,210,1665460800"; 
   d="scan'208";a="88751284"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Idonf72DZquLZVmhbwlAdcq5dc0ml8G/X+Kf0N1W7PcOdSp4O/cAhIyTBAN7HWAmSd7vAiXOX7lpHXl9B24G5aYcvYgAJZ4dPg3yjHU2FPDkQdQSkkgMw5Nmj1+YZXEjJ5YQAUlHPdUf4lju8hkG/leV+NJoLEwfwdkTuRjhv7Zij9e9iKf51sZ/aqyenUk0QYFDHOxQHY1eJdfWbBOnjaPLqkeBjJ2TZRbT6TVK7U1JlX+2BLIrYlkqQ316m4O58qoKRvaNqgsYz3lMKj90FZ/LG2v9ZOd3oUtoHMsu9YWnKScIxEwpFR/07WUi3igSGrU5jcXJyw6h32ps65wlJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsmSSvJtnOxRcEe+Jq56rbcDbFLS0hlP/R7CJAdg5fs=;
 b=R3gwrWFZO69k8MVi9BR2AttqPguubcgJuAfPDmT6aK7psoTZlNKpfU+njXQytcLs4Gu3rVs4jrcR+je559zcPs6r4uBamvVNLIIGuC9CkJ7zqfQ/JDGOXySnwUhq20Shh4FKtCruVG1C0tIfaEmJLCdAhTClqvRWsE0IzpmZRmTIL8EOE+zLJMtF6vwBJpgi18I7N0ggSZQpxJPr2ClpAiVZGsMXKnSb8x97Cn1yrgIyQC8KJg5mgz0uRYFmcheWbE3A4ONm1DM6/9N8hL6UHNqDBgOAPlw6nmUUSz8BWM6KzSm50gllTtO19rkkaoWWYJ/3OD4PpAYEt5yNtRlNBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsmSSvJtnOxRcEe+Jq56rbcDbFLS0hlP/R7CJAdg5fs=;
 b=E9ZwLlnoUCSyK8XZwZaxHPrV22Wzn3I/lXDfTanmD2YCMlvm4Vdw1IbBnb86Sc6UNZaxOhSMcc8dn7jCP4AehO8TXQbHgmA01K/YV5f74f5p6zkIEsdpbWzDrxZEa9Lb7QV8H24lVPdU1k5Lt7flEsOElxG9MS7G0vyHadu3X+Y=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: preparations for 4.16.3
Thread-Topic: preparations for 4.16.3
Thread-Index: AQHZAxdQbElMHcNupUajNspL4cb9tq5ZCSuAgAFALQCAAAyugA==
Date: Fri, 2 Dec 2022 09:11:47 +0000
Message-ID: <45fcf658-c353-9fc5-e343-64a5f6c1f0f4@citrix.com>
References: <2c4c605e-f8c5-abbb-db85-89465b7e10a6@suse.com>
 <7aeec9a0-628f-d1bd-994d-343ab7f8b85f@citrix.com>
 <d628796e-3b42-5d50-f8cc-039743d23057@suse.com>
In-Reply-To: <d628796e-3b42-5d50-f8cc-039743d23057@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5648:EE_
x-ms-office365-filtering-correlation-id: 94db1040-9648-4b80-4ca5-08dad4453d91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zV7HoSYge2js1NgtE4uVVeH2SypTEYMiFNghRhgWKGjIgy57vJGYnJumLG3zfdm5OANFHR0wtwFGgqWmj72kGXk1ylm9Q70eBZ5FVPPbisA7fChNrk835nOPd32KUdIkK5r/SkMBQEIWqMwAosZrYUGXb+vkcfuZ+ogERcrXVKm75VBSpttQOg4fMkwfbKiCnse3l6aaJB2VPSqIu64KplwHytRGr0YVqrVAPzYIYdeltcJ2Vs3xdbJ/zwqKVOcixB2+64DE3Qufe3PRX7FzSLvwrTKHXyW1kRHJY6aN1KyMVp2QuCL0UmHlDTs7EygZ60+IwOYr5KyG4GiuiWBqH9PN7H2Oae0dRPoAGuLKdo0lLDzm1o1nUKTCYRtl1Vt/jFlVUzMnPQb0KZjFbjLmVmN3VmmTxFKowbb+qvpveQhyC8hvP7VXCsIS2Y8wF1uGeYkioAzz113YAIAFdhiQvJ6qQvEH57ERPadt6P6l0zIKweP7rQaA+qgBuHWt+gtosYM9+OFqQ4ql/5h8wvjH3U+JSOr1Z1+uBhgeTo71IyjrNOO3hJ1gO900FKrTTUoBPt6uF1y4E3GV/q3VozPjXEnFiVJFib4Ghd3UEE4/ruJSuSklP4R/MTupmycaOkfB4l5Q7GvqNLqPJTMmHvviYfrxgVB/GbaQgxdz3gS+vu5tVs83IjJiS/kasZd+J8zBvRA73PeAeizuYaLKNEI4JYtwS+k/AoXTiPz9pNJBjnuxt3j+JPmHjlhk8kVl3IUsjN9U5YlZXAW6T7fuHddi4g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(36756003)(316002)(83380400001)(6916009)(5660300002)(38070700005)(91956017)(64756008)(2906002)(122000001)(66476007)(7116003)(4326008)(66446008)(66556008)(66946007)(41300700001)(76116006)(8676002)(66899015)(82960400001)(31686004)(38100700002)(8936002)(478600001)(31696002)(6486002)(71200400001)(86362001)(186003)(2616005)(53546011)(6512007)(6506007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TnJwZ3FoQUM2UFR6M2RmQ0xqMFBDN3U1dkZkclpBVUIrdm0vVlhlMHpRQU5H?=
 =?utf-8?B?amVsTzZiL1ZTQVhNRkxvU3ZWYmJZOHo2bkJGUmZDQmNRSThmaFJXNndreG1w?=
 =?utf-8?B?QUhUTVkyUnE0d2F4TnhXMm55K0hCd2k2QVk1Mm1VUCtZSmR0ZU95WmYyWi9O?=
 =?utf-8?B?ZnplL0dLNGhCYzRXeHZ0TGROM2RvQ21oL3VUZHkydlZyUGUvRXFXQTRQbTFI?=
 =?utf-8?B?VVo5OHJvcm45QUhBSy9QMCtOeW0ySFI4ZzY1dXA0cVcxU2laWU5aSE5kdWZw?=
 =?utf-8?B?QUprWUxnUEgrU1NFVGNjQk1MdStWaDdIc0J1eDA3dnpQaFJvK21rTUNvT056?=
 =?utf-8?B?dWR6ZGxvbStOTElwN3dQYmJuTWFjNGVYNlQ4dGcxWFFjZ0s4UmYxVWE1OVR6?=
 =?utf-8?B?T21KT0FuUG1WTDk0R0p5ZjEvOXJCWGhxaysxK05YUk9LZC9HUFNzRWlweVQz?=
 =?utf-8?B?L1d3Rndaakd5b05JU0xIQ3d5N0wrYytaYWgwMDNrbE1rUmN4cS9qVzduNE9u?=
 =?utf-8?B?RkVZNFFTOEtWQmZQYmYrdW1ZODBjRzRLS0E5WkJxaXBxNHMyb00ycjBwRW1s?=
 =?utf-8?B?bm1ibk13d0JUTnltUUlMUGxHSDFudTZZTUVIL1B4TnpiMk1DZFdYMzdqL2ZG?=
 =?utf-8?B?Wm56SUVWWUxXcDdWT1k4SUI2SytnNlR2QldvSEVKODRESHdPVGlTNndJK0hU?=
 =?utf-8?B?YmM1ZW9SMktKVTlqN2ZRRllyU1h6Q0pQdkxRKzRXaVY0U2ExKys2M3lDd0pl?=
 =?utf-8?B?NWdVVFp2RXlhYkpaQlZvVWFONkdZOXVkZFFiNTZsRjh5MkN0Mml2bFZsbm1y?=
 =?utf-8?B?emo4NXdOUG1md2hXZUdJRXY1d1ZpdnlSS2Z0cHNWVDU2d2pVV05hOTk4azJk?=
 =?utf-8?B?T2tWdWl3cGZsbVBJWEtJdFpFVzZHR2I3MjBvKzYwZGNhWlNueHJGQzJZTWpL?=
 =?utf-8?B?ZzlQc2RxRUJ5OFdGemN1enphcVlsL2Nrc2dYQU8rRDU2eUdjQUQwKzZCd1U0?=
 =?utf-8?B?WUd3aVgySWVJekFWUFRKYlMzYjFwT2ROaC9kWGtzSG40MHlDUjg0cVhPbE5r?=
 =?utf-8?B?K1o1YmJnd21qb2hGS3RnOW5zNkNEMFExUXROR3hac25QM0FzMzhuZ1JVTVMz?=
 =?utf-8?B?b3RraUpxZ2dsaFJCN3hYUkV0eEtFSm9heSt6VmMxTEs2Zk93RmtWdGhYN2FB?=
 =?utf-8?B?bGV1Tm5pdGNhTFZnNFBCZDJHczNOaG02SnBSdXdVczh1elBzbjZXd29mRTFJ?=
 =?utf-8?B?SVRHcW94SlZsbllWTElRYTdRTVZuWml2ZE1PNjVJelpINEcxRnR1UUsySnoz?=
 =?utf-8?B?aUNLWGpmRURaaGphRTJwQVUvU2ZpQ1hoeTcvNnZtWmZBRVhYWHlmbGludWgy?=
 =?utf-8?B?WGtMYTRHNjZMMGpZZjRUWHZ4TU0wbG1UUVpIanMxK1IvTGk2dFd3RU5DenpG?=
 =?utf-8?B?U2F4T3R3UktOMVYzNzFidENRTGtvU2xMdjJHdEVWcFg4RXlCTXpZTUpFMmJL?=
 =?utf-8?B?ZjJoYTNyUVRiRWpHUVJITzZ5RHB1M1BLZFFUUUxQZkFtM3hTckhEelVhZmNF?=
 =?utf-8?B?b3ZmempWRTNYcHZlTVFsVW1reTVSMUYxSTQ4L25YaXZQRnEwV2grbzk4c1Qv?=
 =?utf-8?B?LzlYRzkvYXJiUDNLUFYxYXVMVUxNbUJzMjBIWTVXOEYrVTl2MTRsS3Y1Nzli?=
 =?utf-8?B?TlRBU0l1OXNxcHNaM0tad0RlbEdrQTJTdmlPUmNBTC9NSUg5WHJNd2VHVzdR?=
 =?utf-8?B?dEdPaEV5N292L0dkOUFhM1NtWDBOeGRaQi9FUGY3SFFiSCswamZVUklMKzJO?=
 =?utf-8?B?MjBJUkNNWWpSU3ViLzdpVjh5em1VeXVGdnlQYzBJalVpRTcySXNDWHVQUkgx?=
 =?utf-8?B?YkZ6dnNjN1JpQlBpMSswR2NTSDEwbENxcHdPYnRXdW1LaHBOWERCa28wRU05?=
 =?utf-8?B?UDE3MWZIUHRueUFDVnFneGc0b0l1dlBRSGZKREYyRDdBd2R4SmNtQkl4M3dv?=
 =?utf-8?B?VUQ4ZFJnZUxNWkRaLzQwNkY0Qkhlclh6NHhxcDcwZ0ZBREJqRnQwK2kvc0Zh?=
 =?utf-8?B?bW1JbHZHTmdiQVdSZjFnOE92bU1abkZsTmU1RGpKMjFiZzNpLzBKc1M3bnlr?=
 =?utf-8?Q?/+hJTnl5EBtrIBEgbjE3mRTss?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DBB9F26C4F46642B0EA2D28F8395C18@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WACIpHuCa+yk6GvzDpBy5nELvbRFbcOwLYstD9lXM+9Gagmqt2NQyItsZVoRQigLrNvWhy6HtL+mMAdBSBtBbOMlmLTHDxPwg4tP7uPMjzYrtx4SNlkrHVmKpcawV7Q3SZ7l1453FS8dmGPIaVjNB4Lyno9VtRIZUC/xRGRDLb/KXy7lyVDh/YWoWWVoS2LVcwbJff/HbKKZwmgOnwPIv3fzMN8/I56DA1qRLgwVbDEMwmONm+qdqg6js0ChnAGVkNOeiu757OAzx2X5Qq5lvlYPoou6NV/ZkfLmI5tjExupSFhKbCHsnl350ID8wh/7mX85vF4ve2D9Kck5FiqwZknxicrvSy9VE6HamtLwQjfeQZQB6qWeTMhNtv3BbG2iw4cta0KjOEko4UImeKfB6Ga/L3Hi3mLSGmFIHm4r4cdwEHLXu53fIZmNM7r1o38V7B2T9/H0BNMgX9MPAJWFCmFfqIAJhiwUKO9UOQbrfZ794a9GFjBa6L8FTqOQysI7oaBpg4DUs4448F42I75jbH2RYfGRG/mINcJzXldaxkMmbpeaVUi0N93yylGJjOjE/Qh6T0nGEDe8Xg6t1wc6Kp/6HBsflDL7cLZLarDvTvqWWQ5Ir4NqQojSWyCKYuYIwIpcwyIp3YFEkFKnqmOJdJOrxHMgbMud7/c15G+Lrj0KGKXO/49ChrKQN6TlzQAVYQpR5iRzqcTBsr6jWwwEYjNx+1wbQdb1le0OW/brgtdKS47ACAJ1CpDvnMs60wvqpkldZtwkJVRkTg5ir52gO+FqQGgBs2KTyW2m8ffwr5M=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94db1040-9648-4b80-4ca5-08dad4453d91
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 09:11:47.6485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ToKxZAq7fmaf8JmD/EL80lbCAlpkb3QIqtrkQt1tdXmy/WQHXv3TB9yGKWnkNsI/gl8oCEuI3xdOjJNjNCLpgiwNJtZ8G/0NhoMGx4XGI8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5648

T24gMDIvMTIvMjAyMiAwODoyNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAxLjEyLjIwMjIg
MTQ6MjAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyOC8xMS8yMDIyIDEwOjUwLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBBbGwsDQo+Pj4NCj4+PiB0aGUgcmVsZWFzZSBpcyBkdWUgaW4g
YSBjb3VwbGUgb2Ygd2Vla3MgdGltZTsgaWRlYWxseSB3ZSdkIGdldCBpdCBvdXQNCj4+PiBiZWZv
cmUgdGhlIHllYXIgZW5kIGJyZWFrLg0KPj4+DQo+Pj4gUGxlYXNlIHBvaW50IG91dCBiYWNrcG9y
dHMgeW91IGZpbmQgbWlzc2luZyBmcm9tIHRoZSByZXNwZWN0aXZlIHN0YWdpbmcNCj4+PiBicmFu
Y2gsIGJ1dCB3aGljaCB5b3UgY29uc2lkZXIgcmVsZXZhbnQuDQo+PiBJIGhhdmUgYSB3aG9sZSBw
aWxlLCBhbGwgdG8gZG8gd2l0aCAobyl4ZW5zdG9yZWQgbGl2ZSB1cGRhdGUsIGJ1dA0KPj4gdGhl
eSdyZSBzYWRseSBpbiBteSBwZW5kaW5nIDQuMTggYnJhbmNoLg0KPj4NCj4+IEhvcGVmdWxseSB0
aGVyZSdzIHRpbWUgZm9yIHRob3NlIHRvIGdldCBpbnRvIHN0YWdpbmcgYmVmb3JlIGl0J3MgdG9v
DQo+PiBsYXRlIHRvIGluY2x1ZGUgZm9yIDQuMTYuMyB0b28uDQo+IEkgc2VlIHlvdSd2ZSBwdXNo
ZWQgYSBidW5jaDsgSSBjYW4ndCBndWVzcyB0aG91Z2ggd2hpY2ggb25lcyB5b3Ugd291bGQNCj4g
aW50ZW5kIHRvIGJlIGJhY2twb3J0ZWQuIERlcGVuZGluZyBvbiB0aGUgc2l6ZSBvZiB0aGUgc2V0
IEkgbWF5IGVuZCB1cA0KPiBhc2tpbmcgeW91IHRvIHRha2UgY2FyZSBvZiBjaGVycnktcGlja2lu
Zy4gQW5kIG9mIGNvdXJzZSBJJ2xsIGFzc3VtZQ0KPiB0aGUgb3hlbnN0b3JlZCBtYWludGFpbmVy
cyBhZ3JlZSB3aXRoIHdoYXRldmVyIHNldCBpcyBpbnRlbmRlZCB0byBiZQ0KPiBiYWNrcG9ydGVk
Lg0KDQpZZWFoIC0gdmVyeSBmb3J0dW5hdGUgdGltaW5nIHllc3RlcmRheS7CoCBUaGUgYW5zd2Vy
IGlzIGFsbCBvZiB0aGVtLCBwbHVzDQpzb21lIHNjYXR0ZXJlZCBlYXJsaWVyIGZpeGVzIHdoaWNo
IGRpZCBtYW5hZ2UgdG8gZ2V0IGludG8gNC4xNywgYW5kIGV2ZW4NCnNvbWUgc3Vic2VxdWVudCBv
bmVzIHdoaWNoIGFyZSBzdGlsbCBwZW5kaW5nIGZvciByZXZpZXcuDQoNClRoZSBtYWpvciBidWdm
aXggaXMga2VlcGluZyAvZGV2L3hlbi9ldnRjaG4gb3BlbiwgYW5kIHRoZSBwcmVjZWRpbmcgOA0K
cGF0Y2hlcyBhcmUgYWxsIHBhcnQgb2YgdGhhdCBmaXgsIGJ1dCAibm90IGxvc2luZyB0aGUgY3Jp
dGljYWwNCmluZm9ybWF0aW9uIHdoZW4gdGhpbmdzIGdvIHdyb25nIiBpcyBpbXBvcnRhbnQgdG9v
Lg0KDQpQZXJoYXBzIGl0IHdvdWxkIGJlIGVhc2llciBmb3IgbWUgdG8gcHJlcGFyZSB0aGUgYmFj
a3BvcnRzIHdoZW4gdGhlIHRpbWUNCmNvbWVzPw0KDQp+QW5kcmV3DQo=

