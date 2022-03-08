Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A85B4D1A19
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 15:11:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286966.486700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaYq-0007Qg-5Y; Tue, 08 Mar 2022 14:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286966.486700; Tue, 08 Mar 2022 14:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaYq-0007NG-1n; Tue, 08 Mar 2022 14:11:36 +0000
Received: by outflank-mailman (input) for mailman id 286966;
 Tue, 08 Mar 2022 14:11:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LykH=TT=citrix.com=prvs=059d7c239=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nRaYo-0007NA-Hj
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 14:11:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7530351-9ee9-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 15:11:33 +0100 (CET)
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
X-Inumbo-ID: a7530351-9ee9-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646748692;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=aKETpxFH8LdGlgVFAiFjlAYzztfO/P4BKRnLtagc4Wg=;
  b=GQfXS+YUtnlTfB32nkjuuq0DbALdwMKbxvRHhiq4QRmAPJlGT9cH7wIT
   OwRpKVUTBcE+Ojy2/3BxUg3FxqY1B1K7LXqhNUJ7rybmYM9gyf3tubh+d
   H0dcUHmzf1wvL/zBNecPV1BW2G7KMUN2xGNDZdXZkQD/6ihKpkXhxF4hI
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65639381
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:L7gPHKgNfVcbbU11FgdlvatIX161kxAKZh0ujC45NGQN5FlHY01je
 htvCGuCb/nfMDPzfNB1Ydy39kgEu8fdmNQwHAFq/HpkEn4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvd4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YV07Z62Qt8s8bxsbMHFTbY9m/pXbMEHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xN2cxN0WbM0Qn1lE/DbthlsSRnmLFemdSrmyso/EmoHCN01kkuFTqGIWMIYHbLSlPpW6mo
 WbB83X8EwstHtWVwjqY8VqhnubK2yj8Xeo6Fre16/pri1273XEIBVsdUl7Tiea9ol6zXZRYM
 UN80iAjt7Qo/UqnCNz0RQSloWWstwQZHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRR0q6GcQ3+Z8raSrBuxNDITIGtEYjULJSMH/t3irYcbnh/JCNF5H8aIYsbdQG+qh
 WrQ9W5n2utV3ZVjO7iHEU7v2SD1psTmYS8J5Eb0Dk/1zCN/TpK0Xtn9gbTE1spoIIGcR1iHm
 XELncmC8ewDZa2weDyxrPYlR+/wuavcWNHIqRs2RsR6qWzxk5K2Vd0IuFlDyFFV3tHokNMDS
 Gvaoktv6ZBaJxNGhocnMtvqW6zGIUUNfOkJt8w4jPITOvCdlyfdpUmCgHJ8OUi3yCDAdollZ
 f+mnT6EVypyNEie5GPeqx0h+bEq3Dsi4mjYWIr2yR+quZLHOiLLF+hVbQDXPr1ihE9hnOkz2
 4wEXydt408DONASnwGNqdJDRbz0BSJT6W/KRzx/KbfYf1sO9JAJAP7N27IxE7GJbIwO/tokC
 kqVAxcCoHKm3CWvAVzTNhhLNeO+Nb4i/ClTFXF9Yj6VN40LPN/HAFE3LMBsI9HKNYVLkJZJc
 hXyU5nYUqQVFGWdoGh1gFuUhNUKSSlHTDmmZkKNSDM+Y4RhV0rO/NrldRHo7y4AEmy8ss5Wn
 lFq/l2zrUYrL+i6MPvrVQ==
IronPort-HdrOrdr: A9a23:M9Wc9qFzZ4O/NAY7pLqFRpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536fatskdtZJkh8erwXZVp2RvnhNFICPoqTMuftW7dySWVxeBZnMffKljbdREWmdQtrJ
 uIH5IOa+EYSGIK9/oSgzPIUurIouP3iJxA7N22pxwGLGFXguNbnnxE426gYxZLrWJ9dP4E/e
 +nl6x6Tk2bCBMqh6qAdxs4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1SsV
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RGIFq/QpF4t1H2mxa1O
 UkkC1QePibLEmhOF1dlCGdnjUIFgxeskMKh2Xo2UcL6vaJOw7SQ/Ax+76xNCGpsXbI9esMoJ
 6ilQiixutqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MciFW5uYd499RjBmcga+S
 hVfbXhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zo93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkf8IzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehTKYd0s8LAo23FUgMyPeFOwC1zxdLkHqbrUn8ki
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65639381"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIKNne3sdQDzw+Z2pRzpZOhjhPnZNh1DcKZIcw8R7oQseGf76cxid6iHEjimRBlFS0WmdE8iaaazuWS22li5FYDPMEtQQZqNhktOk06piu7h2HQvNzgAP/tLBvw77ZrODonosvmSQSNplDg+BZBeOkpZxrvuKlApHW/2EaYCefez6k2j6q6dVQsR9FsMUZkdsbU3i+Urx2uzN4m44DAnUSK/Iv16AFpRzJZ2ADyg52ijimlUTASfFUWK6RM+dy9IYeZoxywHnM4mYwPscgkXV1IHQRCEec8YwhjYef0A148tI7rpM2RUCRc+dnFgpiBbcE7tEN0otZHOB1UATPqYnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKETpxFH8LdGlgVFAiFjlAYzztfO/P4BKRnLtagc4Wg=;
 b=Qwr4pBKw3ZyBUw8FZt8kkA4THM/+Ao+WtWQx9MudOmwPDHm32tR72DENqPL5X22oUwY4axLJJhh7aNa5S5MnIxvmKFLPSNe1sfaBjq2ZTYai3AEl5X2jfPA/fZxcH2LCC/QnGa+UztT080Qo27FQYLSayvVGE2OzZNNakkjEhfEX2xhRg+t/SkxOk++P0WPUgSuO0piHeVVfyxX0azeArKzUWY5cXbDsZEPM6zHFv0ufrIiqb5COpxC9oHPlX/BJCY07bLeT47v+3hx1eAsRnNI4AmQ7NhWMPugJFXs2+DU8mfgdX11sXuYkgUNQSAuAMh8Zw8rhAXuPI02iE0IB/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKETpxFH8LdGlgVFAiFjlAYzztfO/P4BKRnLtagc4Wg=;
 b=ayt53CpVOwdeamo5tY3yX8m9WlZ5mz8HDx4+bQqSrKgyJ+XS/L6v8lc862RcYGPKpW5XNLnfTqyq6frspdtg3ia06T+zH2mDSPjPGpp8LDwcDPygyBC/rpRsShXkeMWBlq6TRA3hbFOTTI9IdlfmXdFHuJdsRcxDJiehJN0Qsy0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, "Wei
 Liu" <wl@xen.org>
Subject: Re: [PATCH v3 1/2] xen/build: put image header into a separate
 section
Thread-Topic: [PATCH v3 1/2] xen/build: put image header into a separate
 section
Thread-Index: AQHYMvNuZ1BxBquPPEGLviSvK+ljSKy1huaA
Date: Tue, 8 Mar 2022 14:11:28 +0000
Message-ID: <3d08555a-2ee2-53be-d495-d3aaa6ec661e@citrix.com>
References: <20220308134924.83616-1-roger.pau@citrix.com>
 <20220308134924.83616-2-roger.pau@citrix.com>
In-Reply-To: <20220308134924.83616-2-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51f4f5cc-cd89-42f3-bda0-08da010d89b7
x-ms-traffictypediagnostic: BN9PR03MB6073:EE_
x-microsoft-antispam-prvs: <BN9PR03MB6073FDE1EF74B4D23BA28376BA099@BN9PR03MB6073.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RcwlfrRmuAOXmSq/8d8uNeG6yZFo2d3/C6Kqiu2NszPuG1Qkpu4Rk3iehLOqttqLRpdD7GJ64kDw8FQg0ywxAXgN4cg4gwSpLXorDjHV17u2frfkBrgji9lyiZ2aSD3hWeUDWFkkfQ1UHN1YXNERaI5vnZq2aWc1ZR7TBf/U4vNzPyXqlVi3MTtbYfSxW3tXDaaROtzteXglXCrGgLTuAK5jxcfaJO7cYg19sZzSgb/646X4Ke1DL2XTI80TsAnLWKvReeXdxfue/cbyq6rSNG1Sh8mGKF4n/5qM39shFoTrHl0WhjI37+IhVwYmd/yATU/AMF71dUTEhJJiew4Zn85ac/nCvzpU0q6vVlP3O/GdqFB0pzo25e/IUjZuf+YIL2pesgY23DEVPxbXTr8iClRql/iaVc+5uOdxwqMRN6AHise8RbhYslQnFvesbUggb+55tlUpBYpSavyUizhVZ0UPQmcBioMEtr4q71iM4fiGw6hhUmT8xB58e6XQ9F4c6A3d3o/jOm3QqxByFRKv4MVBV3jJV+ld+G5yG2fV3/E6/JHvZTu9lrHUygznmm9rTswGA5bc4rk3rgZTfeO6wyGhrqHwm3ieS09oivuzbNp053YNBKdnp3AyRfxaTovQW9WvCnEFZhZmzZKq9LRkpb9W7fibJFYCsoPDW/jzGsarVmG9VI2SBNep1laXhZ7rSN/pxQTwn/TcPIJrK5J1K12hGcOnhp94yvVaD0tG7niADccrH5AaprHM8mU7d+Eu5GCU8GIVV+qqC+TJMdtZ5g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(316002)(6506007)(86362001)(508600001)(36756003)(186003)(26005)(6512007)(31686004)(2616005)(66556008)(82960400001)(6486002)(91956017)(4326008)(66946007)(76116006)(66446008)(66476007)(38100700002)(64756008)(8676002)(2906002)(110136005)(38070700005)(8936002)(5660300002)(122000001)(54906003)(71200400001)(4744005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEFQRXBoaEZrNUxEZXJ2THNFeHJCUE5wNUoxOEUyTWJzNEd0THYvaGZJTmV6?=
 =?utf-8?B?dGdqVmg0ZEJIRWlSc1A2a0FuM1ZvZ3RFNlRZOS9JY2JQNTQzRVFvZWkyVWFz?=
 =?utf-8?B?RnhrZDl0WUtaZXNmRGNSYU1qdlUyWWFxZGpxTHB3ak9QeE5QVE94blBNRFVo?=
 =?utf-8?B?dGNSRDYwcGlKbkhydGI1Um1kcnpmbmQzYzJCS1VLMnRnc2JyOVBwMFdvQ1R3?=
 =?utf-8?B?SWVDLzQzbDNkQmJhdnRTZGNJbmc4SE5Fa3djcis2anpPWmtFc2RBaE1HV05D?=
 =?utf-8?B?K2poNUVLeUJreWlpL1h4UTRVakRjMWlxNFlhV2F4L3ZaQ0R5L0ZDTGNUOVdl?=
 =?utf-8?B?d1NkNGhZYjM4N3VsOCtZUGd6clJpY0phbjFpaDBkU0FWUVBOeGk0NVc4ejNF?=
 =?utf-8?B?YS9hVzFJZ2xsazlTc1orT1RkNGp6M25JbTdSOHhXb2E0NlJJY3k0RmxjUmZP?=
 =?utf-8?B?K0hidWtJSGFDM1JwcDV3Z2p6L2dmSGVQTUczTWFVZkUvdEwzcnplZnlrQ3hQ?=
 =?utf-8?B?Qy9SbnVWaEprRDQzQTVIekc2ODkweHo2TkRTRVU5bDZyVGZEQnFrRk1iSHpT?=
 =?utf-8?B?WDErZS9LVnNUdENDbVZ6TGVKdmU4OU1pYWMzOVI1MmZ6ZTFVNTJXd0czdVpQ?=
 =?utf-8?B?RnNxRjRUV0Z6MUtVNTEya2NzMUxBd3JreDdJcGxvSDVnRUVLbi9MQ3BKT2h4?=
 =?utf-8?B?cThCSFRlZHpIb3BnWHdJU3RFU005RFErUUc3QWdWNVNpcmswR1VFdUFUMlpZ?=
 =?utf-8?B?SmRrUnMxU2FqUUdmTldUMUlEZEc0M3BKdDFpYzVNeitUMmNST1JJSlM0eE5R?=
 =?utf-8?B?cG5Xc2ZHdjdET0JTenhXbEJCUVF5bldyYnpyWGc3MFg0M1BsTDRyQi9pQWFV?=
 =?utf-8?B?OXVFcUpqZjc0QTdHZWtYSUhDN3ZOUURDcDBCV0orcHR3dy9VYWx0NGN0R3kr?=
 =?utf-8?B?cHJEcWJUQmVZVi9sVFlpZXROd244UXF4aEQ3dVk0T1ZlNjQ5QktpOTlDaTRW?=
 =?utf-8?B?Z3RicllORlVOdmNqZGpoUUhibXZ3VWZOYXR2TlVHdjBBZGR2UXR2dU5jdXRl?=
 =?utf-8?B?VU9WRUxGQWVuQkw5OVZpd05IK2dBY3lxdTQ0SWNpcDVUZzcxWisxWC9ZcXgx?=
 =?utf-8?B?T0dTYS9RZktxbXZuaytyWUI5T09yVmFCYy9Sb2NqUmIzeHA3SE5QU0hzeTQz?=
 =?utf-8?B?dzRqOVZtY3UwMm9rd3UxRGZYd1VUOEttN1JLNCs3ay90OHJzNitUZHZBaEdS?=
 =?utf-8?B?eENWUi9XOXl2aFlrQzA0VFR0OGxsemNMWjlBSmVMZzRrNkFTRXp0VnJXU295?=
 =?utf-8?B?dFVpakVNaENGSXZjTVpPVnhqbXVRWkRiYlB5Zm9iWFVQUFhQdlRFVVdYQVQ0?=
 =?utf-8?B?ZVUwT2dwWWtIbmFUWmwyTml2V2lSdVpRb3ZQM2RIN00yUldxK0Z1UTR4b3Bt?=
 =?utf-8?B?cHJxOUV0THZHV2kwMlVrNHI1dlV5TytrZnFwNTIyemc5azF2MER1WE9tdmNU?=
 =?utf-8?B?N09STUlDSENvTk1LbytpSGJzckY5K2VGOUZCUjBvcGNYTFpOMUswY2tqUlp4?=
 =?utf-8?B?QTJYOHZJS3lENlpCc0R5SGRJODAvQ2IwbnZtenVjRDRkSU4xZWZTbEs3OGg1?=
 =?utf-8?B?V09BcThWTnZwVE80V0huZUs1SDBpYjJ4amZ3UE50TE5iZm9hdzF6d291V2ph?=
 =?utf-8?B?WTI3RFdrMmtQNDNvbFJxZm5VaTFvd2cyZG9zZW5icEZBWGNya3JqVW5BTkpL?=
 =?utf-8?B?cmZUc3hGRDMwdnd2T0JDd2xIWDQ2SGRiYnVjWmRoUTFGSUttbUF4ejdkT2lp?=
 =?utf-8?B?d05wRUtJUVpydVEwUmpHWExrbEp0b2pDVGdZRHUxZDlHV3c1MUtDcWkzRHVk?=
 =?utf-8?B?Mm9jcThmSXBLTXl6QVhQMjIwRkR4encvWWRtREpyRE9YOVAzNjB6Ym1CWmF6?=
 =?utf-8?B?WVplRkw3ajNRd0VwbUdDamIzbEZFRnBYQUgzUEhDc2lzQ0VIS2hTTndMU0dm?=
 =?utf-8?B?UWtJRE1CVUh0bDNKblExazdKMGY2eWQ2UkFSVWptMEd4eHh2QkZQalZ5VUQz?=
 =?utf-8?B?SHFzaE4vbDB1L1p1SVNudTdsZWhudlRuVVRGUHliNFY5T01kandPUUNzdmg2?=
 =?utf-8?B?NWZIOVlXTWw2VklWSm9lR3lEbEdXVUZGclBYTS8vZDc3b1lQMmkvRlY5NzVZ?=
 =?utf-8?B?a1J1L1JpcmR0SGxDV1dnTHZXT1hLcE9vSGJaWnVXQUdZTlFJYllpV3pCQUJO?=
 =?utf-8?B?dEp4UU92a0cxbTJQTlR2ZC83UG53PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF712488C7E18A438CE4285AA422E835@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f4f5cc-cd89-42f3-bda0-08da010d89b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 14:11:28.1819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wnh1Xo4p4gZxwnSiW/gwIMVbl84cVepGA6RML5TVzLeE5d0+dIW9BaDLA7nUDpBo1bc8y/kSquprhiBJGyUWy1g4XLSygziHsLZyYHD0liU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6073
X-OriginatorOrg: citrix.com

T24gMDgvMDMvMjAyMiAxMzo0OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL3hlbi5sZHMuUyBiL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMNCj4gaW5k
ZXggMDgwMTY5NDhhYi4uNDdkMDlkNmNmMSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL3hl
bi5sZHMuUw0KPiArKysgYi94ZW4vYXJjaC9hcm0veGVuLmxkcy5TDQo+IEBAIC0zMCw5ICszMCwx
MyBAQCBTRUNUSU9OUw0KPiAgICBfc3RhcnQgPSAuOw0KPiAgICAudGV4dCA6IHsNCj4gICAgICAg
ICAgX3N0ZXh0ID0gLjsgICAgICAgICAgICAvKiBUZXh0IHNlY3Rpb24gKi8NCj4gKyAgICAgICAq
KC50ZXh0LmhlYWRlcikNCj4gKw0KPiArICAgICAgICooLnRleHQuY29sZCAudGV4dC5jb2xkLiop
DQo+ICsgICAgICAgKigudGV4dC51bmxpa2VseSAudGV4dC4qX3VubGlrZWx5IC50ZXh0LnVubGlr
ZWx5LiopDQo+ICsNCj4gICAgICAgICAqKC50ZXh0KQ0KPiAtICAgICAgICooLnRleHQuY29sZCkN
Cj4gLSAgICAgICAqKC50ZXh0LnVubGlrZWx5KQ0KPiArDQoNCk1vc3Qgb2YgdGhpcyBodW5rIHdh
bnRzIHRvIG1vdmUgaW50byBwYXRjaCAyLsKgIFBhdGNoIDEgc2hvdWxkIG9ubHkNCmludHJvZHVj
ZSAudGV4dC5oZWFkZXIuDQoNClNhbWUgZm9yIHg4Ni7CoCBDYW4gZml4IG9uIGNvbW1pdC4NCg0K
fkFuZHJldw0K

