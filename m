Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D4A607D66
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 19:21:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427910.677519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olvhv-0001KC-FN; Fri, 21 Oct 2022 17:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427910.677519; Fri, 21 Oct 2022 17:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olvhv-0001HC-C2; Fri, 21 Oct 2022 17:21:19 +0000
Received: by outflank-mailman (input) for mailman id 427910;
 Fri, 21 Oct 2022 17:21:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1mzs=2W=citrix.com=prvs=28632f022=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1olvht-0001H4-C3
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 17:21:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c36367fc-5164-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 19:21:15 +0200 (CEST)
Received: from mail-sn1anam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Oct 2022 13:21:12 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5603.namprd03.prod.outlook.com (2603:10b6:208:29b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 21 Oct
 2022 17:21:09 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 17:21:09 +0000
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
X-Inumbo-ID: c36367fc-5164-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666372875;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jjfyHLihhuhnu/YJf6pwiYxfMAD85K4XcXo40A5JsQ8=;
  b=NH8Emrsnn3tLMue6a6+ot6LzzcwRNuXHAtAi6H4N348XLV6OHqIaH9CZ
   Spp+JshpXnP1CXbYhgY7tLSi19aHm7B3ItC98WBtO4olWG829ZTXyj+V7
   j17OvJDmV9SBRyEb10kGlr4rWi7ABqqJGc7z5yhfX0OdnziJGPjDZs60k
   k=;
X-IronPort-RemoteIP: 104.47.57.42
X-IronPort-MID: 83689072
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:z4gSM6OVlx7MsrfvrR15lsFynXyQoLVcMsEvi/4bfWQNrUp01jFRx
 2IXXWDUOanZM2H8fot+Ooqw9hlU7MWGz9NhGgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglbwr414rZ8Ek15ayo4WtC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eYqtJx+0rIj1y+
 McZdB1XSTCMicCX6efuIgVsrpxLwMjDGqo64isl9heASPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF9xTJ/8Lb4ECKpOB1+JHrPMDYZZqhQsJNk1zDj
 mnH4374ElcRM9n3JT+toiny1r6XwnmTtIQ6E7q/z/pD3gSqn3EoGUdKf0OU+Ou+oxvrMz5YA
 wlOksY0loA39UerR927WAeqrXqstxsQHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRkuaeZTn+1/b6OoTS/fyMSKAcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdOTz22
 SHMkyE4iJ0al8tN3KK+lW0rmBqpr5nNCxUzvwzRV2f9tAdhPtb5Pcqv9ETR6utGIMCBVF6ds
 XMYms+YqucTEZWKky/LS+IIdF2028u43PTnqQYHN/EcG/6FoRZPoag4DOlCGXpU
IronPort-HdrOrdr: A9a23:EON/w6y53H0jiXQAKWjYKrPxj+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMQs1MSZLXPbUQyTXc1fBOrZsnfd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadu/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZebxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESttu/oXvUjZ1SxhkFxnAid0idvrD
 AKmWZmAy1H0QKSQohym2qq5+Cv6kd215ao8y7kvZKqm72EeNt9MbsOuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGLf2RYUh2rD3xnklZqsoDWb/8sQqAe
 NuBMbT6LJfdk6bdWnQui1qzMa3Vno+Ex+aSgxa0/blmAR+jTR81Q8V1cYflnAP+NY0TIRF/f
 3NNuBtmKtVRsEbYKphDKMKQNexCGbKXRXQWVjiaWjPBeUCITbAupT36LI66KWjf4EJ1oI7nN
 DbXFZRpQcJCjbT4A21reh2Gzz2MRaAtG7Wu7BjDrBCy83BbauuNzGfQ1YzlMblq+kDA6TgKo
 SOBK4=
X-IronPort-AV: E=Sophos;i="5.95,202,1661832000"; 
   d="scan'208";a="83689072"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jP09fAKJwSSl2rdD0bgqt9s3vTzLe9q/ODTPOGDr1XfDvuoSYMgZ4VWM20WT4P7oONiRw/+aIE4wOteRWVzVIFX++rSJ1OfmHCdH3gHUXx4HAomt0lZoOhLAh5PbJhjiNzIwg/UYnf/Cmo8/QxZbvwaVlKX/FZnhF8llKf6tg5C2HZtXfT8N7UG6ExNEdPviDCsJgSX+1fJ69efZFzEkShLkiOcq9zNE41CEewztEe1L9dOh5O2koQCLlqWEMjcSRnN8wMENpC/Kh2AoUBbR1IgbsrARLJf2rjYL7gAFCzja6152ombrj60qaXf2sGb2Hd7efu5yD6nkIsVG8/3deA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjfyHLihhuhnu/YJf6pwiYxfMAD85K4XcXo40A5JsQ8=;
 b=S+swa9xcN/P2hPNFNrg41j0ogfm3jdL+D28OtNYRiK0wLbjQOFY5nUgAlMldQLJi2rcKrQOMqu/4Wn5les+CUYvx4/hKKMTY9twRtdvy0sl11wlZPNAPJNwBNIant5szNpIcPe+xBjr6v2LSYhkrfE8aeyU3gtC8dlpaCud45depq7D6JYK4yhPHJ0ZWuQ4SWfAbzyugnKWtcH++FzyoUxFOe6/H1fBUTv9/eItk4ciUuvasE/kMDs9l5Lwnh0XcbOXNpTNLyvP2joS+3s0MhhjU80wumU3HUEUFfqwSLaWZfgwajzA8cf1JkWWuQq+178YkmgRKVuH8EPKijeAztA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjfyHLihhuhnu/YJf6pwiYxfMAD85K4XcXo40A5JsQ8=;
 b=aAa6ElXzGpmPtzNMWKKLF7tx1wW+oxpTmlVvbZKFevS+GRIaNSQNG/OX+0hV8+E8tm7IqAiKLXKI3Txw5SWGvkhgiMXQwVfDPwLT+e87yZVS14+KOHO/cM/JDvxKWsiWpz5z11//eFDoIB2NGlpXspoUHmgC8/9BWlTE/AIbvkI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [for-4.17] automation: Do not use null scheduler for boot
 cpupools test
Thread-Topic: [for-4.17] automation: Do not use null scheduler for boot
 cpupools test
Thread-Index: AQHY5W3J3NgQRSiY5kiY+kL0DoKe0q4ZGCaA
Date: Fri, 21 Oct 2022 17:21:09 +0000
Message-ID: <b1f7c77b-6e39-85e9-074e-0e31ed9648db@citrix.com>
References: <20221021165341.7905-1-michal.orzel@amd.com>
In-Reply-To: <20221021165341.7905-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BLAPR03MB5603:EE_
x-ms-office365-filtering-correlation-id: 7a78b67d-1de2-479b-eb83-08dab388a4f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 XytZRB4LdxX0Sqm6rl4paZBJ6kBNiyF4qlI823/83xV/AIkiRLtywPRURx3D3VllpvbEnhcq8Vb0PM2RjB/fw6ykRNx39597Ymch4+McyGk7jXqrLzPc1fpCcrsV4kt3Gu0KnzvO+66jsSOKQtIAyCV0abPDNUzeWnPNr92sifeqUD6v0rLNJG21Os2Io8+PN8YKLfV/+MXY3Uz9k+QvjRKMH+UJsMIpJaMekbpp78R/qdsORCO9cfbmzOPv3DLVhwicCVG/HJDoQ1spwRSFHJYCk+cu24wMdg8aiS8ehN+i4ouBUhoJ3M3hVPIT8fZhV0YF8B9xfnTarxzilNMoZNjxtgkp4pGPGUdFRgCQtT4kcOqywMUCguWO1ntzclo5aV6ZfH4OuXXdFcdW9RsXVwZDJyUQ052DcmlU5XJqvMgWKNIB7XJUcBSkbLlSIZsA0mc3M8Z2d3tkOfrkuTRySUDR15bMP/wQDbn2VILrQK4TxXYLIys7EzXQHduTc4FMuNKCjSLfQhrnGER940nDnsCD/elxAnckhhLA9SaGd9gYiL54tmx7Om1n7i32zK9ROlv3bnf75l91ijOGIS0neCXFX/q+OJCkiuOyzJAK/z2jCF+6uhTV+vnLKlPkEcTp91rtn4VDYyZUfpUXc/xsRu10UwfbAqAZhHh2BPyHxKWte3CgzLGcqkAQZWl37B8wA1Sk1+bfbm6IsCtQIIiDkuuHlDKCCk6AggEedUjgNfd2/78GRk/tjnlv7HMiz6aWtUDOMB/OWTW5umuxTtcoxyotuwJ7l3mRVw24Q1Am9pyCb1woIMJVgb6v+gPKARAf6McjuUkxNxLjPwFEo0zU8Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199015)(478600001)(122000001)(38070700005)(6486002)(31686004)(71200400001)(54906003)(316002)(91956017)(8676002)(6512007)(64756008)(76116006)(66946007)(6506007)(5660300002)(66556008)(66476007)(66446008)(4326008)(53546011)(36756003)(41300700001)(26005)(8936002)(2906002)(83380400001)(31696002)(2616005)(38100700002)(186003)(82960400001)(110136005)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WTZCdWtVUVhoUXFVZ0ZZTkh2YWR3NjJTMUROR0RiRFhzTk9iSUR4KzJVVlpm?=
 =?utf-8?B?Vk1YdE45UnlYS1c0Tm1EaUlseWRsd1dudFVZb25nUjYvQldKOXVlQmZ1eTNZ?=
 =?utf-8?B?OUVtbUl4ZWtWOVhZaFhvdS83ODJ3bHVRQ2djQkp3UW9aYnFaSWlBYi84NTdw?=
 =?utf-8?B?Smc4TVkzeE91UXkvSndNbHA4aHB1bENEbVgvQkpDZDJMUGQ5c2NTK0NSTWxk?=
 =?utf-8?B?Nko1WTBYN251SXc4WVRtclhHSUtkTTVrNnZPRU9VaFp3UHpkMG1BcHFaRHRD?=
 =?utf-8?B?WVVBZDVERmROS21rL245SW54WUEzSkQ4eEVHTjN2eW9wOFFpb1FRM090Z0Np?=
 =?utf-8?B?NVpoa1ZZc1RWTHZQbFlJelVJMDFzbGdrcmRSYnZ3YTR4UENQUUZpMU9MZHNK?=
 =?utf-8?B?WHQyY3NXKzUwRUp6eW5TZVVzekw3Uko2M1JIS01WSS9PYWhiejdVeEdsTk1k?=
 =?utf-8?B?T1dYMlg1M2tXVStlY2EzRHdMMElRd3FHN0VxMlB4KythYUdWZkMzM2N3K0lz?=
 =?utf-8?B?N1BnVkQ5eE9Wc3QrYzJEYXMvUXZ5SDRqVFlMWU96ejZpR21ZQkdCN3l3SHRN?=
 =?utf-8?B?TEJFMTRuRmcxSm5pM1ZsZVNwUEViMGFmRWRmSEdXS3kvQmdHR0Rib3VPUDEy?=
 =?utf-8?B?QUFDK3FRQi9CcVBaYU93SEVMK1JDY05WVjFrVEE3ZWxGa1ZaVkVoTk1Zazcw?=
 =?utf-8?B?aXF2bEp5V2p3RFduRWxUSjBha1lZSTBLNXRIQkJFajdCL3kxUzNQZDBldkQ5?=
 =?utf-8?B?MjRzOUxHd0hBdjQ1Mit0eG9RZmk1b2NxU1dhOXVGK2NobkJHN2pDbjhQaklW?=
 =?utf-8?B?STk2RmR6MHJMeGUzWFFVY29sZ1Z3MmM4eVFkNTZIM0p5UERZZzd6UTQyTzRT?=
 =?utf-8?B?eURBVDViVU4wdzhZcVhURnRNUUNRK21vQmtnUDE5bVkyQkFyVENiVEI2Mkkv?=
 =?utf-8?B?UGlLamFxV2QxZWpkZUlROWpSdFpsVWdSMWttcEZ5S2Q1Q2pRdTZhOEw1VUtB?=
 =?utf-8?B?OWd2VG10MGxwaGE1M1hyOVVUTk1LU3lDZ0xnSEM0NnlxVXpZVXBWbGwwOUF6?=
 =?utf-8?B?SXRIczhOaEZ1S0ZiTzdCN0dzeFRIRG5VZ0RKak1uNmN1WUpUSW1XRWExeUpn?=
 =?utf-8?B?bWJNRXUxUnNab2ZGNXZ1QmRUMDhCSVViTVlmZG55QzZTVjBDVzljMXFmeDdS?=
 =?utf-8?B?N3JoaFZhbWNLVXJTN0JzalVvZUhydU80TE1xWnc1STh4b3VxQ2pRQkxHWm5v?=
 =?utf-8?B?M0NpWlZxM1ByVHNuM3llV2lBQlZWaENoWmxEcHZLclV0dkVYUytVdDFkekpK?=
 =?utf-8?B?Rzc4RUVhV25TWm9iM3NtWi9xS1JUTjJZd2M5WllJSGhLMGs4cDFSYVNyYXFU?=
 =?utf-8?B?RDZXeUdlQUJPL3JkZ0hSaFpFSlQ4OTNCSnpIbXNDYk1jNXorcTRiSGlsRjdY?=
 =?utf-8?B?aHE5WVR5TGgwM0pVZ3pVL0RNRExRcEdwVDA1S3hMSzlWY285M2MyQTc3YXQ2?=
 =?utf-8?B?UjNaVWJvMk43Z2J1RVJvNWcxVEdzL1AveHRWZGJRdlVFc2Z2VGtjWkxMODRN?=
 =?utf-8?B?MlFSMjAzdWJUMTkxVUlBbzVSdzkwZDhPZDkrOWJTTndlZDRQYS83STVoZ2d6?=
 =?utf-8?B?YWdOWGVXY0N1OUpOUXV5Y3draDJOc3M5WUNrRUVRM0hBaXRQTmhBdDdYYzBj?=
 =?utf-8?B?QUNzMENoV1dabWZWcWVwZUtMSjNTVFY4T1JCOC9vR3FWR2xtQldzbU1BYjVH?=
 =?utf-8?B?K0hkVTNKa3E2MDIyL0JhcnV0RU1PWHFrZ1VDWXYwNlV6THljWHhONDF6NHVL?=
 =?utf-8?B?YjhiRzdmMGZ3bXkzZCtKSUhwdktROWlNRlhQajhDSmdpQWdtTGhxVll3dGY1?=
 =?utf-8?B?ajRSM0grOVFYalIxT2R6SVZZUXFsblE5TUd4T0J1bnQycnFSbzNaZ0tvUENh?=
 =?utf-8?B?bk1YVXFWOTluQTIyY245VEIwMGM0UTJxdFNTM1pPTVYyeGZuYWl1TVFiTlkx?=
 =?utf-8?B?cndlYzlBeHBhd3Fnb1k3UTFrMjduMUF3eGFCYktQN3dtblVkTjhTb2VacVhE?=
 =?utf-8?B?SlJEWjRDelkzeDdpS1lwQXNZRCtDZnR0NkI3d0ZGZm8rcmFsek1uWEF3WmJT?=
 =?utf-8?B?V2N5TVFINEVNMWIySjl2dWNWNHY2c1h0d01tQWhmTHY3anNYaGZnL3JrRita?=
 =?utf-8?B?OEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C35859A99D454D4583698333A8E268EA@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a78b67d-1de2-479b-eb83-08dab388a4f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 17:21:09.0407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cAxwrroDnKUxC/Rp3ap8hkmVihN/Npnzd0898sLTNDPtWVpbHjwh9Po1SlF/nYGBTte0nMhxT9tMgAw4VLVjWt37DMkbaQGaSR0aD8Qowms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5603

T24gMjEvMTAvMjAyMiAxNzo1MywgTWljaGFsIE9yemVsIHdyb3RlOg0KPiBOdWxsIHNjaGVkdWxl
ciBpcyBub3QgZW5hYmxlZCBvbiBub24tZGVidWcgWGVuIGJ1aWxkcyBzbyB0aGUgY3VycmVudA0K
PiB0ZXN0IGNhbiBsZWFkIHRvIGEgZmFpbHVyZSBvbiBzdWNoIGpvYnMuIFdlIHN0aWxsIHdhbnQg
dG8gdGVzdCB0aGF0IHdlDQo+IGNhbiBhc3NpZ24gdGhlIGNwdXBvb2wgdG8gYSBkb21VIHdpdGgg
YSBkaWZmZXJlbnQgc2NoZWR1bGVyIHRoYW4gZGVmYXVsdA0KPiBvbmUgKGNyZWRpdDIpLiBTd2l0
Y2ggdG8gY3JlZGl0IGFzIGl0IGlzIGVuYWJsZWQgYnkgZGVmYXVsdC4NCj4NCj4gRml4ZXM6IDM2
ZTNmNDE1ODc3OCAoImF1dG9tYXRpb246IEFkZCBhIG5ldyBqb2IgZm9yIHRlc3RpbmcgYm9vdCB0
aW1lIGNwdXBvb2xzIG9uIGFybTY0IikNCj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4NCg0KL3NpZ2ggLSBJJ20gc3VyZSBJIG5hY2tlZCB0aGF0IHN0
dXBpZGl0eSB0byBiZWdpbiB3aXRoLsKgIGFwcGFyZW50bHkgbm90Li4uDQoNCkl0IGlzIHRvdGFs
bHkgYm9ndXMgZm9yIENPTkZJR19ERUJVRyB0byBpbmZsdWVuY2UgbG9naWNhbCBjaHVua3Mgb2YN
CmZ1bmN0aW9uYWxpdHkgbGlrZSB0aGlzLsKgIFRoZSBDSSBzY3JpcHQgaXMgZ29vZCBpbiBpdHMg
Y3VycmVudCBmb3JtLg0KDQpSVERTIGFuZCBBUklOQyBzaG91bGQgYmUgZGVmYXVsdCBuLg0KDQpO
VUxMIGlzIG1vcmUgdHJpY2t5LsKgIFBWX1NISU0gaXMgZXhwbGljaXRseSBzZWN1cml0eSBzdXBw
b3J0ZWQsIGFuZCBoYXMNCmJlZW4gZm9yIHllYXJzLCBzbyB0aGUgIlVOU1VQUE9SVEVEIiBpcyBi
b2d1cywgd2hhdGV2ZXIgdGhlIGRlZmF1bHQgaXMuDQoNCkFzIE5VTEwgaXMgZXhwbGljaXRseSB0
ZXN0ZWQgaW4gQ0ksIGl0J3MgY2xlYXJseSBzdXBwb3J0ZWQsIGFuZCBwcm9iYWJseQ0Kb3VnaHQg
dG8gYmUgb24gZGVmYXVsdC4NCg0KDQpQbGVhc2UgaW5zdGVhZCBmaXggS2NvbmZpZyB0byBub3Qg
YmUgYnJva2VuLsKgIFRoYXQgd2lsbCBiZSBhIGZhciBiZXR0ZXINCmZpeCBvdmVyYWxsIGZvciBw
ZW9wbGUuDQoNCkFzIGEgbW9yZSBnZW5lcmFsIG5vdGUsIHRlc3RzIHdoaWNoIGFyZSB1c2luZyBu
b24tZGVmYXVsdCBwaWVjZXMgb2YNCmxvZ2ljIG91Z2h0IHRvIGFjdGl2YXRlIHRoZW0gZXhwbGlj
aXRseS4NCg0KfkFuZHJldw0K

