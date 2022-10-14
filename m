Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53A95FF420
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 21:36:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423086.669519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojQTA-00010G-1m; Fri, 14 Oct 2022 19:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423086.669519; Fri, 14 Oct 2022 19:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojQT9-0000xg-Uu; Fri, 14 Oct 2022 19:35:43 +0000
Received: by outflank-mailman (input) for mailman id 423086;
 Fri, 14 Oct 2022 19:35:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JttC=2P=citrix.com=prvs=279f68966=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ojQT8-0000xV-I5
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 19:35:42 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61926fd9-4bf7-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 21:35:40 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 15:35:24 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5040.namprd03.prod.outlook.com (2603:10b6:208:1a2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 19:35:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 19:35:21 +0000
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
X-Inumbo-ID: 61926fd9-4bf7-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665776140;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=lvyclAa417B571VbYbZTVvqoRQ47YJifB9NMzfX9DK8=;
  b=h3ge4Y6+GFitKyZiU1LxHVC6NLazzRNaLR00q2JcWdSSBEK1E7VCg6NQ
   Xe2kA7WLTE2O1DUeF+MvMD+KoyQqGLf9VPBn42fTTGWm6M0J72yx0f+MX
   6P+t4x6za97kOOWCpfAshTGeAwBpCMBSpwtbpUjoS0Ca+p1iHEQsPoPKM
   s=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 83192730
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PDVjOqMlGK/uyGbvrR2ClsFynXyQoLVcMsEvi/4bfWQNrUoq1jFTz
 GIXDGnSOq6MMGCke4h1Po3g/B4Avp7SndQyQQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglbwr414rZ8Ek15ayr5GtE1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eIYkb3rdOPkh1x
 e1bAxs3Tjqfobq0z+fuIgVsrpxLwMjDGqo64ygl5xeJSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF+BTM+/tfD2v7lWSd1JDENtbPd8PMbsJShkuC/
 UrN/njjAwFcP9uaodaA2iL3376VwnijMG4UPLag1v9Qg2+w/GAoDAxMVl+YrsbhrlHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAbShZRZdpgs9U5LRQo2
 UWOhMjBHiF0vfueTnf1y1uPhTa7OCxQJ2lSYyYBFFIB+4O6/tB1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxlolDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:F7M+iKzVZcmTIqns0godKrPxj+skLtp133Aq2lEZdPULSKGlfp
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
X-IronPort-AV: E=Sophos;i="5.95,185,1661832000"; 
   d="scan'208";a="83192730"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWh4hsNodgBipeaD4puDzowQlDzIpx3iZ22wrlKoW5WXOv6mfGnt2WQV3G9oxLW5TnxdHm6bd8mpMr4KFMoy3K84mQZaYwlO3vZOofvwb+mcUih0vFOttMe60CLtdOKhwiv4mFJx+52HMZQBMk1iThym1XygrMbXUTc9swwjQctQZIk/TGAYIajCtbWYLO7UjUsF0MpkFT8HHDxDVXquR3u5lfSkVfzu9KiPP/eBOLzgtHAxGadf9aatzQ5woy+j0cLEYas89aTTUec9gNV61bVnkEFaRygJzWWDNjU6ieLstUlP6oGfwSL2MiwkQqN668E+RrcYTbXNfPyT8c/+Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvyclAa417B571VbYbZTVvqoRQ47YJifB9NMzfX9DK8=;
 b=LxmeKlPNqc32q7TrCrQbbS8QD8p541M4mpNdz4ViyS8HkIKSTPUZYDLYsVB4K9jCBNVmLjjVztMqxf/uMNwo8ZKV3fIKbplJILtqilKt7i7sMTNBBvAbzprQa+ZtvNnuMGPDoLT6UYa+MaCOLPXKos+d8KIAr790uEDIRiN30u2tKOUszaadkuIHUEUj6GFfOnCmEKVGMqRwtNfXTLcxbtGPvPwDbtJd6PrFQxhzhPJ90BJZkJhirnDM20B/yDlFAbXICTlbx+oaGBjESVO2CPH9fBFgh5S+wkcvty77EjnqPOlLGAcY7sL/c0r1bQEQHgg8xscJkwhgyUMVGxVWKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvyclAa417B571VbYbZTVvqoRQ47YJifB9NMzfX9DK8=;
 b=ISzj4/8KnsaGyu8dG5cYxr3BEHhgIqK0atRUPp7pbz5a07NJqKH5VLEyL3+iZWrwTCa5F/UDQZf7XO3cMC01WluIqpxMxOSoFa5QtwHeOqcD5TwU+P5HuNMSgH1SDcHC6jJbjZm+ntXKgW1dJh5HKPMAN1hXHyyQviTWx9CiwFg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH for-4.17 v5 14/17] libs/light: Rework targets
 prerequisites
Thread-Topic: [XEN PATCH for-4.17 v5 14/17] libs/light: Rework targets
 prerequisites
Thread-Index: AQHY3wX69onYif2p90CqYm9dW0vHXa4OSiQA
Date: Fri, 14 Oct 2022 19:35:20 +0000
Message-ID: <d6e4825f-6fd3-b48b-7a7b-e4f62acadd38@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
 <20221013130513.52440-15-anthony.perard@citrix.com>
In-Reply-To: <20221013130513.52440-15-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5040:EE_
x-ms-office365-filtering-correlation-id: 8391b82d-47bf-456b-eee2-08daae1b3ba1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aQiWKlzCl3aSPyAmdZR/cO0+mygQb7efjmP46Cbph+Wxt01Dao9IopPwkLgvgkWS6AffDfJPF3ScoFKpGsV6TMM1gWBgTYTQZXF3Fkhgl0z/pPEb8uE9bVQGHn0KZm8riBgHMGlbyEaw6xmG7T2zGgiVnxBeEUiKR6tq7jntIfLlKOzYKSWxt4pgoaoLRdvNPqPRfQm6RUp2afl0VeufeEu7v9h30cMRZAWJk4YxkK1hL6WwVgukFSFM4TIqo3z4Nxvaypkntlljv8neIXQsPJ/P24cL5A0F07QN1GzxmPX5P7hm4Fun+IFH4y/hbVKhkfTbDApGG6Zo3mWgawrqt6n7oWv4IsXDMcEuBkouckJ2c7H97zVyveC2WYxB8qelME8r2KeFYD6vVEYpH4NMwmkgcY9UnL7gagj4Q2jqJT7rD+NJ6Z6RiZ0FiX6VUZeMNXWIewT1SkLik0kU8FCIcvfApIACAL0M0lN3Ib1xcDrk6Hz64+DWKEx8hnzQm7UTookEX97m+OBmVUPI+qLaOfOlTyD7Klw3/VWxwIwZmABFNRZxtWUmcW3w6kOe+BGdOn50q7bEi4eFbtjamdo3sGL8wnhrqgJneOITY1m6KsRE/aRpGBcieeNFrx8ArGf/0DGIHiM+EJztG6vdklnSz256WG8IHD0ie05KUyjn0AjRVLzaw9Utzr1xHO4vmKq5VOISrfm4Ph65EbVJdZcFzNpqLMBNcefFJKW/VST8WSnmWkQcVcvcaU8vJgoxVfdyg2nM0Io555b6mSJXiOWH/Mm8csRKcKTI5ZP+MRFin3dnuzDjTXxY4fAY4oBApZRjxIvokf1u8ejMhP0+xj3cTg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(451199015)(6506007)(6512007)(2616005)(53546011)(26005)(478600001)(6486002)(71200400001)(82960400001)(122000001)(38100700002)(86362001)(31696002)(38070700005)(83380400001)(36756003)(186003)(5660300002)(76116006)(8936002)(31686004)(2906002)(8676002)(66446008)(66476007)(66556008)(66946007)(91956017)(4326008)(54906003)(110136005)(316002)(64756008)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Zk5ybE5BalkvZGZ2Q2Q2OWI3K3FhTlNMK1JZMXM0M3g5L1RwaEg0TE5XYzlF?=
 =?utf-8?B?NGg4d09XK0ZxaEhRK0lFazZvTTNDMXB2SkJYeUdWL3l3LzNyOXE0SDQzbmZC?=
 =?utf-8?B?dHZ2TC9BOFBiQ0VKV2lXUDlidnJTQ3A2TnFOZ0ltZG44VWdTRkx4WVhqVXBX?=
 =?utf-8?B?b2RxNVBsZ1Vsc3lxQjJ4T2YwTytiR2tYbFpYZG1pSTl5OVBZck4xZGVqVVYw?=
 =?utf-8?B?TUExNmlqejRZa01yRlhaa2FUcGlTVEU2bFNJUTZRUnJ6M3lPdVpmbEZTV3Zk?=
 =?utf-8?B?ck1ZYVVuR0krbXpHa1NEVmpheHhqeU94V0tyMXMzZXdUalkyak04bkxOOGNS?=
 =?utf-8?B?K1BVT2tHY21qL0hzcTJubWZWTWlrM2V0OGVEeUVWdlh1RnBjbkdYM0Z4YU94?=
 =?utf-8?B?Y2l0UzNjVWtDOVZGaElPR21TNkJEOW1Ja0kyOE9CTHhKdFN3ZU1Ta3lDZkx4?=
 =?utf-8?B?b2toTFpYT005NHVJeGVMZEJSY3BXWmNDazVYeWJ3T2JIVENKdWJlb0I1a3ZB?=
 =?utf-8?B?czN1cUFaQ3hiOUh3V0ZwR0VtVjNsdS9TQkpXUUg2R0lWbXdIMFU5TmF6WW9G?=
 =?utf-8?B?emVYYyswVjRYNHJZZ1NUelJYdnl1dzRPMC83cDR0NGh6b0p3Zi8yWC9GMnRF?=
 =?utf-8?B?MnprcWJ0KzNUTVc0VTFiT1VoTkJvQmlwbjRDYndTREE0TGJwUndBdzhienox?=
 =?utf-8?B?VllacmJHZktLeCtieVJIcDlFMVFqWVdRMXRsN21zRFdIUnZIeHBpc29sV2NR?=
 =?utf-8?B?dlkycUtCVVVlNFJsZWhJMlJIdGdFQ0JKNXpFYmJrQ1BtdTlKWk1BNVk4bk16?=
 =?utf-8?B?TDBmVXB4eHpPTUZudlp1dlVHR3JjTStyUnNhS0JMUHRld0lqLzN0MEg3U2tX?=
 =?utf-8?B?aFljRzROZTFZbHUwVmdmOGtnOTJxSWZ0REk0WlYzS2pqZ0MrQ296NERTR1Ja?=
 =?utf-8?B?Q3hvQWVnZzlVUmt3N2YzTkRITFkwMGNsdTVvSENDL1kxR1AvVnBIWUtKclBy?=
 =?utf-8?B?WitHeldPWDlzbllWVTBKUFpFQ3luZVNuZld4bjlhbWlqL0pwbmRaczVlNU90?=
 =?utf-8?B?TGw1dS9GSUhMWC8vdjVXNFZCME85NStrNThDeTZjeVhyV1ZoSk9mSnljby93?=
 =?utf-8?B?WklGSTFneEtSeEhLTVFneFBYb0xiZ2c2TVFPckxVY0VJY0hVQlVTQmFjOVRF?=
 =?utf-8?B?SXVKbzlTWHJnSENrenVsK29rRTJrN1BzcHlQRFhsRkVMRUp0dkx3Tmx4K1RL?=
 =?utf-8?B?b1hkT3h0eXZyd3NwRmV1OHc2UGRjUWN2SHJ6VUpGc080U3F6dE9NYUIyN0Ey?=
 =?utf-8?B?a1BHU0l2OWREdlBnazE3dS9SNXQ4czV2VUJjOWNyZTVURVE0Z2FZUFNiT0tv?=
 =?utf-8?B?c2xqQTBLQmRFSGViMkdmeG1kbjJXaHljVXIwWDZ0SENUVGhXTlk4anhGWFh1?=
 =?utf-8?B?SGhIYzFPVVRvd0YvdXcrSWhscEdab0ZULzFLZ1VXTkJMNlJBNTNaV2tSRTd3?=
 =?utf-8?B?M2tleXI0NSs5YXh0alFTQUtheFovYjZXdVhDYWFySjAvYU1DU3ZhNGl1MEpN?=
 =?utf-8?B?WTM1K240cGE2Y0xmeGhHTFZXRFZXa29nSmpHbW1XR3JyeElGbXFwNmd3T0dy?=
 =?utf-8?B?bnZ1TzZaUVcwUXBrK2FiTFRTTFgrbW5Ddlk0WlVuT1dLZEVVWEVFeW43MnE0?=
 =?utf-8?B?ZDgvdWxIOUdNWCtsTzhGSTJKeTBrOVAxSWRETG43Q3R4UXYwSnlmaWpXZHFu?=
 =?utf-8?B?eG1KU1Bya2tEbEFDd2tpbG1Yd2FoNjkxRWFFQ25TbkkxUnBOVUJpbTN5cWs4?=
 =?utf-8?B?ZEFNcmI0ZDVtbDVvTDBIUHJkYW9XWFFOY2pSRkc2WHhpNlcrV3NEbW9iVi85?=
 =?utf-8?B?Vk1PSXRIMHdJVmlpa2Vta2o4VTg5NXFKRTIwaHpXQWwvY0FxN0VucGhTZXpa?=
 =?utf-8?B?ejFPVkN5OFRoVmh4Vk9RMHVBaVdlMmxmN2FmU3dpMmFWaDRiRTNSUE85RHh6?=
 =?utf-8?B?L1lMdWNZcVRhOERMNWJvdVgyMjR6cTlrQ3hVOFlQVDBCTW85MGpvSTdrbmk2?=
 =?utf-8?B?VHVtTkRGU0hzV2srbTRSNk1nY1krMUQzVTg4WUUwb3BBaUNqcDJreHg5dXVt?=
 =?utf-8?Q?oLBznjiAjb35pH6nwcHmbCTKy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FFBA34DC1D38A43B6194D859DFEDED4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8391b82d-47bf-456b-eee2-08daae1b3ba1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2022 19:35:21.3539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: khbLhujiltZ7MnxSWnwdZCUgMl0YOc+auMM8i/LZvHS+SC3lV7dQdDz1jQXQYhiPEVqDJxORF6HaexHhHsHpG6Ko8vPZVgp3FUA/lrpjR7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5040

T24gMTMvMTAvMjAyMiAxNDowNSwgQW50aG9ueSBQZXJhcmQgd3JvdGU6DQo+IE5vIG5lZWQgZm9y
ICQoQVVUT1NSQ1MpLCBHTlUgbWFrZSBjYW4gZ2VuZXJhdGUgdGhlbSBhcyBuZWVkZWQgd2hlbg0K
PiB0cnlpbmcgdG8gYnVpbGQgdGhlbSBhcyBuZWVkZWQgd2hlbiB0cnlpbmcgdG8gYnVpbGQgdGhl
IG9iamVjdC4gQWxzbywNCj4gdGhvc2UgdHdvIEFVVE9TUkNTIGRvbid0IG5lZWQgdG8gYmUgYSBw
cmVyZXF1aXNpdGUgb2YgImFsbCIuIEFzIGZvcg0KPiB0aGUgImNsZWFuIiB0YXJnZXQsIHRob3Nl
IHR3byBmaWxlcyBhcmUgYWxyZWFkeSByZW1vdmVkIHZpYSAiXyouYyIuDQo+DQo+IFdlIGRvbid0
IG5lZWQgJChBVVRPSU5DUykgZWl0aGVyOg0KPiAtIEFzIGZvciBib3RoIF9saWJ4bF9zYXZtX21z
Z3MqLmggaGVhZGVycywgd2UgYXJlIGFkZGluZyBtb3JlDQo+ICAgc2VsZWN0aXZlIGRlcGVuZGVu
Y2llcyBzbyB0aGUgaGVhZGVycyB3aWxsIHN0aWxsIGJlIGdlbmVyYXRlZCBhcw0KPiAgIG5lZWRl
ZC4NCj4gLSAiY2xlYW4iIHJ1bGUgYWxyZWFkeSBkZWxldGUgdGhlIF8qLmggZmlsZXMsIHNvIEFV
VE9JTkNTIGFyZW4ndCBuZWVkZWQNCj4gICB0aGVyZS4NCj4NCj4gImxpYnhsX2ludGVybmFsX2pz
b24uaCIgZG9lc24ndCBzZWVtcyB0byBoYXZlIGV2ZXIgZXhpc3RlZCwgc28gdGhlDQo+IGRlcGVu
ZGVuY3kgaXMgcmVtb3ZlZC4NCj4NCj4gQWRkIGZldyBwcmVyZXF1aXNpdGUgZm9yICJsaWJ4bF9p
bnRlcm5hbC5oIiBzbyBhbGwgaGVhZGVycyB0aGF0IGl0DQo+IGRlcGVuZHMgb24gc2hvdWxkIGJl
IGdlbmVyYXRlZC4gQW5kIGhhdmUgJChTQVZFX0hFTFBFUl9PQkpTKSBkZXBlbmRzDQo+IG9uICJs
aWJ4bF9pbnRlcm5hbC5oIi4NCj4NCj4gUmV3b3JrIG9iamVjdHMgcHJlcmVxdWlzaXRlcywgdG8g
aGF2ZSB0aGVtIGRlcGVuZGVudHMgb24gZWl0aGVyDQo+ICJsaWJ4bC5oIiBvciAibGlieGxfaW50
ZXJuYWwuaCIuICJsaWJ4bC5oIiBpcyBub3Qgbm9ybWFsbHkgaW5jbHVkZWQNCj4gZGlyZWN0bHkg
aW4gdGhlIHNvdXJjZSBjb2RlIGFzICJsaWJ4bF9pbnRlcm5hbC5oIiBpcyB1c2VkIGluc3RlYWQu
IEJ1dA0KPiB3ZSBhcmUgYWRkaW5nICJsaWJ4bC5oIiBhcyBwcmVyZXF1aXNpdGUgb2YgImxpYnhs
X2ludGVybmFsLmgiLCBzbw0KPiBnZW5lcmF0ZWQgaGVhZGVycyB3aWxsIHN0aWxsIGJlIGdlbmVy
YXRlZCBhcyBuZWVkZWQuDQo+DQo+ICJ0ZXN0aWRsLmMiIGRvZXNuJ3QgZGVwZW5kcyBvbiAibGli
eGwuaCIgYnV0ICJ0ZXN0aWRsLm8iIGRvZXMuDQoNCkknbSBhZnJhaWQgSSBkb24ndCBmb2xsb3cg
aGVyZS7CoCBIb3cgY2FuIHRoaXMgYmUgdHJ1ZT8NCg0KfkFuZHJldw0K

