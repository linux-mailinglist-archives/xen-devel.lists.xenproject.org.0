Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FAB9D561A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 00:15:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841686.1257186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEGON-0004lX-Ea; Thu, 21 Nov 2024 23:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841686.1257186; Thu, 21 Nov 2024 23:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEGON-0004jU-Bo; Thu, 21 Nov 2024 23:15:19 +0000
Received: by outflank-mailman (input) for mailman id 841686;
 Thu, 21 Nov 2024 23:15:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7QOI=SQ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tEGOM-0004jO-6C
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 23:15:18 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100000.outbound.protection.outlook.com
 [2a01:111:f403:c201::])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76ecb06e-a85e-11ef-a0cc-8be0dac302b0;
 Fri, 22 Nov 2024 00:15:14 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM7PR03MB6580.eurprd03.prod.outlook.com
 (2603:10a6:20b:1b4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 23:15:11 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8182.016; Thu, 21 Nov 2024
 23:15:10 +0000
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
X-Inumbo-ID: 76ecb06e-a85e-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6YzIwMTo6IiwiaGVsbyI6IkFNMFBSODNDVTAwNS5vdXRib3VuZC5wcm90ZWN0aW9uLm91dGxvb2suY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc2ZWNiMDZlLWE4NWUtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjMwOTE0Ljc5NjE1NSwic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8F7QsoV1XOBJP+XHy0Gkt37vtZ4wjTcl+a+bGg4NYZ5iTZh6XmuJpwn9r01OE8Sk+0hJeTjTI2nWTsrwOPTJ1F+XO+kwjzkb45DveLFLw2RXMMhFh/1Rv62lymQo1gtTteV9S2oxmWKvJaJgmCnvx2IYTBaLiHdiVTUJg+JdUI51M9Tht1rojgU46gQOqDZcht79EcxDmynAARg0QCYpjlorxQDsRqe8LdSPUNq4EYOm6fvwnnCby193KKTc4EkbteZpBpJCKxS/iz09tbYwf4XHsYd6ojHf8qt/0svfQiX37NQINri8BsYZ/tTosiFdPnP70F+hN5drE9caFN6Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8g1FN93vkyr39bHXONf8ecLUmiuGlm7IOmyfDjStso=;
 b=A1kBNJ46Y7ZvkntN/eDuUZD/r7YSLzHEtetDqJl167MRVJtzmRmGew8YofaK9XITLhZf+BGJx0ILLwQbXMz8mNgqV3pNvYjEIyGrHB4euKq8ihNCoLUoxm/qOdGT1eXt4NZ8aNafamNl3DLxH1tNJTe5Yin9Dcq31XyGzqCjgQNUiIQpZovkVc6F05KvJgefuBsJTv8c7cnTLP3HbJ3427j7y+q/1X1uRNAogJf/8oJ+TpnGUKOELbonGDmhsL+iLLNwLotnOadhOXv6Pq90xHk+s6J9iENczRe/rLPworHqbzNsCzYAGTfh+dv42WmyII9cGrn5Uv1A24v1W5iaWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8g1FN93vkyr39bHXONf8ecLUmiuGlm7IOmyfDjStso=;
 b=Cg+PHeu3O6DowCD3Gt4B6e9jkLEYNyfoAoUcWit2T7i68t+AhCC4XSJ6UHMweDUevU9wBBWFBr9MLC0rccAwGF/M++XTf0X3H8Wc2jYfJaGegAE2685diCqxFCDkpmgvZ8ExrLcs9zx0J9rbo2V/C8KOMdASnEcbPtz1KNwmybNTIwhQLXB8DsUP8qaMISJ7Em6na2auzrbKlrXEitnrA/ookoE4A8nZe0vE8fwuY4G4wGuHTD342MPbN9EPN9C3w8aoxlylTzHx3f9n86pR4WS+VSTPhmliaw7QNmoXcmYHpL+IQP+y37AFsFuxVR4nYh7yD92j02NARQ27uTd9aA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Dario Faggioli <dfaggioli@suse.com>, Juergen
 Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: Re: [RFC PATCH] xen: add libafl-qemu fuzzer support
Thread-Topic: [RFC PATCH] xen: add libafl-qemu fuzzer support
Thread-Index: AQHbNucXRmUX3Y7lRUGcS7d55ZSXhw==
Date: Thu, 21 Nov 2024 23:15:10 +0000
Message-ID: <871pz4kwle.fsf@epam.com>
References: <20241114224636.1942089-1-volodymyr_babchuk@epam.com>
	<alpine.DEB.2.22.394.2411181737570.1160299@ubuntu-linux-20-04-desktop>
	<875xojmexk.fsf@epam.com>
	<alpine.DEB.2.22.394.2411191409140.1160299@ubuntu-linux-20-04-desktop>
	<87iksilod0.fsf@epam.com>
	<alpine.DEB.2.22.394.2411201406060.3516911@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2411201406060.3516911@ubuntu-linux-20-04-desktop>
	(Stefano Stabellini's message of "Wed, 20 Nov 2024 14:07:47 -0800	(PST)")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM7PR03MB6580:EE_
x-ms-office365-filtering-correlation-id: 37d362e7-1168-4aa7-affb-08dd0a8258ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7bnchV5TWjspcasC1X950r0I/u7rp6tQ+kGh9+H+az9t25sxt22gOva76C?=
 =?iso-8859-1?Q?IOR18kmn7bqYOqaLC71IazV4Aq21uXHahGFtQ+N11njWU8BCryxXaGgSA5?=
 =?iso-8859-1?Q?jyJMVGmr3Zr1j1eAw2Sk/5OhitCS1nxO5IlBMsJllFvfYuM7yxDG4dHcWT?=
 =?iso-8859-1?Q?dzK13Ss5EoABley6YxnXnwf6xPcuVTEPdpm+IGyw3mo1ouhpedwlRTlxSX?=
 =?iso-8859-1?Q?J4C1ixcr30SkplAddK4vHkzKMsDx9QhQNzU/sZlV6a2j0vZowwhKrrJWEW?=
 =?iso-8859-1?Q?gyw6v/FWV5EPeHsb5/qs4RxmkOkW6OFn3/rQspbXpPQeNsVHx15sAMeioN?=
 =?iso-8859-1?Q?SfDKEt0g8iiD1fWNXwXhe0O9Pn9t4xpxvB9+i/f2qU0bqs0YYz6exWINUP?=
 =?iso-8859-1?Q?4vV42nldQnnJdIzsv/17sQgHKSQ4PyiY5PL3nymr0ynrLgpKbnja9dgSPu?=
 =?iso-8859-1?Q?pfIx/aG2Sr80TIA4134ZZLuHQnueJeQ3V7rIwTjTC+06Jh/eTlRfqioX5c?=
 =?iso-8859-1?Q?/ZUmPqEkoaaJlXtRzK2QrukiMH8hoICaqAKWKTvnhrQAlhOvYdWSGH/0TV?=
 =?iso-8859-1?Q?X3cj3SgV0JNr7SZ6pbjyX7U/bXzgJYg7H+PpVGQBbqbNzHBvMckcH9+D6Q?=
 =?iso-8859-1?Q?lZpMyoJ5RqYQD0VgP8Pwcqad9qKmkuRLmpavlZtLkOW6cu1MKtkH7Kao20?=
 =?iso-8859-1?Q?/vhM8qDvv0RlWcrnV+xNEKmyFAImT1lqCpTjCKwvifUnflOPDVFJ7VD3J6?=
 =?iso-8859-1?Q?eUJ+FzfWGz/3k48rnGtW10S1IYstbFRSU8lMBmMgUCcDio5eSqWVYc/KND?=
 =?iso-8859-1?Q?BS20+24HZ71jwnR5wpJvidAgjUyAzZs3maXvTTjAZNkPGzpuXAd5D5XLgg?=
 =?iso-8859-1?Q?t9xvCuxJ3pNjXFFFaVHKHnEEgFyPR0YBKAJAgAstdSLc8Q82jf+RoCf5uW?=
 =?iso-8859-1?Q?qKp3d7gdfuIJ4/LKRckLwHz67bx7C6LvoCbZa03wELQHkh6y3TChEP86l/?=
 =?iso-8859-1?Q?dWoQLncfFcDEETSv51UvKZEkEiBtpCKEtWKsKQlDwSr9pFIvGGPJcZNVmu?=
 =?iso-8859-1?Q?e+jnY4PlMROnRW0v4wqGbk7SJ9oLPNzdoqE4U91/20oTM5azDsiqkQCCHe?=
 =?iso-8859-1?Q?EWRgFNV63pjNB5EOVhzSNZ/E2dFv6+604aia62jdBr0nediuowdOSytiNU?=
 =?iso-8859-1?Q?pSnk0OqctZes6VuK93OWNB5UusE9+w6feG9f0E/yhGFLn3n1XDghF9hgeH?=
 =?iso-8859-1?Q?+SuNINQFr2YrTrv4eIlM0Ynpa5blE5ryxpsue9mNBfRZrC9q9YYyOo6PYJ?=
 =?iso-8859-1?Q?AUKw4F60qXJ+EkSFOLkFRrEGibj/ql3QwH1TkP243Jo+rezSmQ6ABDBJln?=
 =?iso-8859-1?Q?XUWks1sZxl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?VNtUZvakmUAvTenyOm6+0HM9VXNAYnZXHYRkimKlXIqL/wndode7v+YAaM?=
 =?iso-8859-1?Q?1FkBfS/9b0UV3Bhc0PBylIe00DdenD6W2jL5vut5NEXYPN7VjsIs26l1xf?=
 =?iso-8859-1?Q?W40GpUHlVsQWACeUlVdsDrTDv9Ii/85mtHfl05Qgixx1Pvo0XmYzncrHg1?=
 =?iso-8859-1?Q?2lI20TnO2iSW2b+ng3jascflV7g//5eXjrgJxivM3udwmUDAxyakgLTzAO?=
 =?iso-8859-1?Q?bCa8AD5OKf1YFI/NxjSz/ekVvd4RcaWjz+e2ekRBYbZj5X08XMw16bhF4U?=
 =?iso-8859-1?Q?a9xVtHRFg5+BE02L4d0xDWA/snis7KEIblpoTS+7Xc85lBs7sR/q/CYt83?=
 =?iso-8859-1?Q?RxMYmSi97vw3KZAk8Y51+K8i7zxQlUgNWR1LIJ0bUs9AjAAnUsV9Puxak7?=
 =?iso-8859-1?Q?mkXRzEY4TLv8RmJn6rWx7JkSk9fpiAEAHWLtvxjinDxyL02e3ZvDXdgaAV?=
 =?iso-8859-1?Q?3F/AnnATkG2NXAvCyuC3pDUk6coYm875yLrkqhx25hMpX4xRQe2QKPYR4w?=
 =?iso-8859-1?Q?4X/GN2oxIcpvzcA/GbjPkjBK6Lz2lW6S2FviF4sowaaSH5G9JgAiF0jMi7?=
 =?iso-8859-1?Q?kNnXfemuD/zTyICEzoFecaBttRRG0bVmMRgmiyiGhtjeP3Y0vNbYo9tMtr?=
 =?iso-8859-1?Q?PLn4t9m+Pun1MlX3d1w2pGSliqlO2vX3sqkrct4rn9JINBIZxKcrMC1ung?=
 =?iso-8859-1?Q?BdCNNS7wQIb+hsDe3aK4kGySaUUew0xMCLOuNX8JlQxN+wkuMH0La6U9P2?=
 =?iso-8859-1?Q?LXYgcaN7MhOXMX4daiT1kfj1TdSrk9Pfu6dl9w73LWnofdKxsz1ZwS6Bsz?=
 =?iso-8859-1?Q?x6SXRAb6+NMHOcRAAJyPt2hWAZqjh1R5Qw4VK10o4v5zbwKBrhk3AfJyvw?=
 =?iso-8859-1?Q?CnM+Gp2vpVdsORqlCzxCgTXYNWRJbBmYQxM7iOsV4NxN3LdexeqlcBLMie?=
 =?iso-8859-1?Q?hxgPDGcWiJylMnwXf9QouBWxi0V12HRMQ1HLAOLHpINR4TH9HBJd3Pt0lT?=
 =?iso-8859-1?Q?QQtsyCHKadd7uN+SsKDvh1O1C+Gb5LWCMUDmMufrMuN9Mmuo05UOtq6BhC?=
 =?iso-8859-1?Q?Fz0rMwXiaUcKBXl5w9OmkdX9DCJrB5aWdrEPzbXf885RhF+GWdiO96o+j7?=
 =?iso-8859-1?Q?YWtUcgMAVI72J6wpQyizy2KAO7F0mqqJLikj1LgJdcT2o34wOUKsjTSlEk?=
 =?iso-8859-1?Q?Kwos4YdxMcs1VOpG/Fw5GxCgvNebuPqZvoo9w2UDx/SsNOfwF5oT/pXQyE?=
 =?iso-8859-1?Q?MoRuB9MP0vFxLsUhMhE+RynH3xbv5lPdTWTt2gakQFjDi7Jvxoo7SKS1Ma?=
 =?iso-8859-1?Q?1n54dH1BLALl21c3uxrArDfxqlrGHdfexxk+B0laTMHZfMV12LJBlKAfyt?=
 =?iso-8859-1?Q?dPcSEHibq7SRBep31rmKpb/2BBcglWJVEKc0XK1Z8Lkn334vG8qguc9iZS?=
 =?iso-8859-1?Q?4vkDKxcmtVNs0C5nqArAguIPTFqXQgWgv5qi0jC2148UUb2T2djvsh9b3k?=
 =?iso-8859-1?Q?Yl5xxR3+D3pHRWjGLFcHz0+O88xnfHpvEZGmr4nbdfKWOrkv9Ij5slMsSS?=
 =?iso-8859-1?Q?aQ1+1IQwiq5+FbrPui6TZXU2K6gLVF/Iz3flMHG8QhwRBlyW92U5vhHp74?=
 =?iso-8859-1?Q?CGRNii08qz/sOHiorO66Dsnb+hA1CvfbPXTLLufFyHqi40yxf7LvOvzw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d362e7-1168-4aa7-affb-08dd0a8258ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 23:15:10.7922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HMKVbvSLzNiz6491zvbsog/WK303T+0ziMNDE6lRHtqza5n9EdTYgS0okLvPMPmjXLk8cyA86ypGMCw/9EpTPX/pY7iUVqWOzMvv3/yV9JE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6580

Hi Stefano,

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Wed, 20 Nov 2024, Volodymyr Babchuk wrote:
>> Hi Stefano,
>>=20
>> (sorry, hit wrong Reply-To option, re-sending for wider audience)
>>=20
>> Stefano Stabellini <sstabellini@kernel.org> writes:
>>=20
>> > On Tue, 19 Nov 2024, Volodymyr Babchuk wrote:
>> >> Hi Stefano,
>> >>
>> >> Stefano Stabellini <sstabellini@kernel.org> writes:
>> >>

[...]

>> >>
>> >> I was considering this as well. Problem is that fuzzing should be
>> >> running for a prolonged periods of time. There is no clear consensus =
on
>> >> "how long", but most widely accepted time period is 24 hours. So look=
s
>> >> like it should be something like "nightly build" task. Fuzzer code
>> >> needs to be extended to support some runtime restriction, because rig=
ht
>> >> now it runs indefinitely, until user stops it.
>> >
>> > We can let it run for 48 hours continuously every weekend using the
>> > Gitlab runners
>>=20
>> Great idea. Anyways, I need to add option to limit runtime to the fuzzer
>> and invent some method for reporting discovered crashes to the CI first.
>>=20
>> >
>> >> I am certainly going to implement this, but this is a separate topic,
>> >> because it quires changes in the fuzzer app. Speaking on which... Rig=
ht
>> >> now both fuzzer and test harness reside in our github repo, as you
>> >> noticed. I believe it is better to host it on xenbits as an official
>> >> part of the Xen Project.
>> >
>> > Yes we can create repos under gitlab.com/xen-project for this, maybe a
>> > new subgroup gitlab.com/xen-project/fuzzer
>>=20
>> Good. Whom should I ask to do this?
>
> I created gitlab.com/xen-project/fuzzer as an empty group. What
> repositories do you need under it?

Right now it is only the fuzzer itself
(https://github.com/xen-troops/xen-fuzzer-rs). If we are going to use
XTF then we don't need additional repo for the the harness.

--=20
WBR, Volodymyr=

