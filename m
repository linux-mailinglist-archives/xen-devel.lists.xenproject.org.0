Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B8858A14B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 21:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380664.614989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJge7-0004NZ-Rz; Thu, 04 Aug 2022 19:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380664.614989; Thu, 04 Aug 2022 19:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJge7-0004Ln-OX; Thu, 04 Aug 2022 19:36:39 +0000
Received: by outflank-mailman (input) for mailman id 380664;
 Thu, 04 Aug 2022 19:36:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t48H=YI=citrix.com=prvs=208fa1d4a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oJge6-0004Lh-8l
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 19:36:38 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf03ed17-142c-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 21:36:35 +0200 (CEST)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Aug 2022 15:36:26 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5637.namprd03.prod.outlook.com (2603:10b6:5:2ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 19:36:24 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5482.016; Thu, 4 Aug 2022
 19:36:23 +0000
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
X-Inumbo-ID: bf03ed17-142c-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659641795;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ozvjxOWCPPviMtlh8ALbzzgkTWgA0s5ztxHpD3BshrA=;
  b=huSeQuVh30wJm0q+jd2RxCyB0Vbt3p83R+/wVyfygzSNuMhj1Piy92s9
   38xoT4oe+OrAUsYWwiZKpnRGL1CkTZARAP7TSDbhKyAd2i46SAiyF6YQc
   P/TjXbQhvAR+SoCEzco9VKMdcOEismA+Fbo8N6pHVSg1SD5ZKh9cFRWsJ
   I=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 76657994
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Jkb/0KyjNAzDIGdDSiV6t+cuxyrEfRIJ4+MujC+fZmUNrF6WrkUBx
 zQWXWGPaf6JYjekKNwkYY+1oUkFu8TcyoRkHlRv+CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Esz5K+aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1qSx8OFJIX2dxsDHpJ0
 KICMQgwMx+q0rfeLLKTEoGAh+wFBeyyZcYzny8lyjvUS/E7XZrEXqPGo8dC2ys9jdxPGvCYY
 NcFbT1ob1LLZBgn1lU/Ucpi2rv3wCSgNWQH8Dp5poJui4TX5CV33KLgL5z+fduSSN8Otk2Zu
 njH7yLyBRRy2Nm3lmTbry3917OncSXTVds4Kq27x9xTjViR+F5MGCMrelmFrqzs4qK5c5cFQ
 6AOwQI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8ywSTC3UATzVBQMc7r8JwTjsvv
 neWm/v5CDopt6eaIU9x7Z+RpDK2fCQQc2kLYHZdSRNfuoa75oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr/hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:CYWfK6DUD4ZE8ljlHegPsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuKKdkrNhR4tKOzOW9FdATbsSp7cKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUaF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlml9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4gow3TX+0WVjbZaKvi/VQMO0aWSAZER4Z
 7xSiIbToZOArXqDyeISFXWqlDdOX0VmgLfIBej8AfeSIrCNXwH4oN69PxkmlGy0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59bs5Vza/poVFZql/1owGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlIhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OFDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowVLau3iefPFm8Kc7giwlGl/NLAgF4vsulKRRq/n7WKfhNzGFRRQnj9agys9vcPHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.93,216,1654574400"; 
   d="scan'208";a="76657994"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nju6XtSYNndgXxidz0QHNvdQQLqlvf99zDbs+slOH9p2uyCo2mAjSfJssphYbijPCulUZ+p87wA9NLer22dMO5gvJFwABbBNqXQqJrC97Bdi502A2dBG09OCKDTIX80mQijyzFSHeDdUw57ju1uVlULg5NDS8BvALXZM4QwWsClhlv/7y8jPIxiN7h31A1UFOQ8A9aW6IxHaVUpLfm54pjT7GNVtopqQaG2c4a8C4DJvfIPlJc95wbrHxm0cFsIdvS6jdfIZWkKGN2GJFxyjij2YrvKekPUKVuztyAmtOYmWkirXWkifsjd8qSlpRVs5dwavEY4lkG6oRlru8oZ3Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozvjxOWCPPviMtlh8ALbzzgkTWgA0s5ztxHpD3BshrA=;
 b=KvR5i9CCCRVSE+s7a99ZjeZoovnAl2MWsa4StTI9rVf+qbkBy90viFkvDZmOSmcxrc6pROP/diSowePHl2Mv8v4iTLkFvKdTUWllC+Ya/wIG+lrAuCuik5WQJWim1d2Qnb3qmPM63Zkc9bbJGmwwQu6YPLS2jKCX2WWcwYIfh9GebctjA0NuaZtizXDeP221Pc26nxFWI2lasw0qSZxDSyCFyF9xrN35/nO6fbD2lbpZ0D936JmZi509Jk/MFivz4/Coe6d+2ictdWXpvXvmszW4Vy1iDPlBosXkcYuglCLzkHwKa0gbtmG2r1GgPpFZjAr65YR4mG8NVUCRBOyEMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozvjxOWCPPviMtlh8ALbzzgkTWgA0s5ztxHpD3BshrA=;
 b=PfZzQ7xA0pSLuQjI9+INCywqPtFET7BNNXV397zB/Tcgn7C6/HKUnoxekGceRRcprncv4Jvlk0yUc2b4CPA6Q/v6VqxL2Q9PMFUKIsC/45oPn/GYmY7i64S6aMFeyPVQGr3VX27A0wv5BkfRkj/LK2H5U226Khz2AtMosXI7ttg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jane Malalane <Jane.Malalane@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/4] x86/entry: move .init.text section higher up in the
 code for readability
Thread-Topic: [PATCH 3/4] x86/entry: move .init.text section higher up in the
 code for readability
Thread-Index: AQHYqBOZq/911YsKKEK60hmSvt8o862fIs2A
Date: Thu, 4 Aug 2022 19:36:23 +0000
Message-ID: <489d489c-6eb6-192c-1b57-0680ed2ac61a@citrix.com>
References: <20220804150424.17584-1-jane.malalane@citrix.com>
 <20220804150424.17584-4-jane.malalane@citrix.com>
In-Reply-To: <20220804150424.17584-4-jane.malalane@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6483c5d-cce0-4bc5-6630-08da76509d79
x-ms-traffictypediagnostic: DS7PR03MB5637:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1enp6OV6lrcaPcdgOXvKxYyMZV923FryNJWXvjwfXrO1S6YIt+fCC5mx2qAUORqPX3tAO/JnmpjXG1UZj9aHufDcJmWzrqPmrAeX8i4OY68Q7Vrnl7RsxeW95p/ud8DCFfwQRkk0pqUCKpnEQDN8WVLQJULOTMjW8wSGuDYFwZIp7LCnI8HUnTYm2RuYl8MS5iaWIYk7+bni6rHmYyaPbIln9dRQZIG5L4nTBrpEm8FGwhFoxrfc0UJxlTx6emw2Jnp/unS8XB3ilUeLrxSzqjfGpwlDypeGyP8jkkNHH89QEZO/rlBw1fO7igQ7mOFNQ9ZPy90Wk7qXE/rz2G1NMxqtC3hBpV0gVECc3XdiMb5XuUCrw56SHxhuDGr+pYLqAyJqT5MUYixPBYbtRdEQ3xD7c7DSRkA7Mks863ZYCRnMMq5Xq2P+IlSSVxm6zFBm6BI7sh0cRfy223u+uo0g8/d1TcxE19dksuF5rrrb0Blec3cnYFJJmE2CjOEoT6hJiBrqaNxO/NoZrjfUj98ecR2POJGY4B8PPEuLDJ5qZ35I1O/iHqURDTIS1UBLUQtdCTIp9ASBibmn47QWaU1jVDB69fRF2Ml4CQAz9LRVTmnvuuqowHMbxyqX8QGEgG07gli5ASr9UI+JWInrky7F1xcr6h/zBrObX494je6UvCxZmwth206xdV7hTQUjMDAgsrTgi9jA8tBT9u6sPiPrulYT3r9RM8bgsi/H2qHw74ob3RkQmubLBaAkP6hV4BB6QL8uCX0f/Tx2ZzxS5xwawu6c4Xg55EiLWH+yYdNqbMjTnRu0eHtQI9RgBPglNiWAF0bl7UiWSHrTOEPg7FeSHR5aN8RtQMs7UerTIiTViyhkETcang1R+oQRL+bAOq0i0UsadDpgRMnhsf8SPbplTQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(53546011)(186003)(6506007)(41300700001)(2906002)(6512007)(2616005)(26005)(38100700002)(86362001)(31696002)(38070700005)(83380400001)(82960400001)(122000001)(478600001)(4744005)(6486002)(5660300002)(110136005)(54906003)(66446008)(316002)(8936002)(66556008)(91956017)(36756003)(76116006)(31686004)(71200400001)(4326008)(64756008)(8676002)(66476007)(66946007)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bG8zRnJBYTlqallublpSOVozcFZidGJFc292a2M3NTg0ZGMvazUyd1RCR1R4?=
 =?utf-8?B?QWhSUHFCSVFyemtnVmJTNGNVRVdMY0I0cGwzakVJcE12TC9XblB0KzFlcFBm?=
 =?utf-8?B?Yzc0RzFYOERkYXFzSTNZUkxKdU5YMTcrQlJCb2FwL1dUYmtPTEpETlJZek1G?=
 =?utf-8?B?Y0pnMm9aSnZrQmxlMERVK1JZaStRenpjTFdSKzl3QllhQkdGWkFqbmRnZnRh?=
 =?utf-8?B?ZGppQndUQ1Iyc0dLeUM5OHFwb3EvYmFjbTA1cGxIZXVCdzMyYklRMjJNbnV5?=
 =?utf-8?B?dWlnaWdTemlPdE4xeHVuWjluSXhBU0VJM3dlN2NHL1JKaDVhbDZzY3VQemNO?=
 =?utf-8?B?OXRHTnBpQ0I2eUlNSkxSSURGUGNRY3BNNUxqSDhaSmlvT0dUeVQxY2FYOTFq?=
 =?utf-8?B?dWFYd2dMSU1obkl4Y0p3V0xZWHUrdkRDMDYrSExsRzdMR1ZET3k5aWNGblFN?=
 =?utf-8?B?VXp3cHlLT3IzcjF3ZGNWL0NPSEpYVm83T2ROTHhBSENqOG55NWJMZjFwOUZi?=
 =?utf-8?B?V0JTdWQ1MVgrUUl0UWZoYitwUkNIdVpVeGhtTnZ4NmdiUXJTVTExclBVQlJP?=
 =?utf-8?B?dmx4RlVtRGl1MEFHVzdTUlN2LzhjYkFOQ3lEdXZvNDdTVDY5N3czejlEWFRK?=
 =?utf-8?B?a3VRM3RNaWM0MGxEQVVpb0syYS8xcnhnRTRZOUxIelpqYVE2WmlpZDlib2xF?=
 =?utf-8?B?OWE2WEwzQlA2NWFtdld4c0VLUG9UcXFxUi9OSmdYUXAwVDZ4bmd6OHYwd05x?=
 =?utf-8?B?L05qWEhHbVpkSWM5eStNcnhUbG03YzJNRmlqdXlLNlNLejVWWXRTQjJWRzRI?=
 =?utf-8?B?TS9BQXlRR3MyblRNUnhweFJXUGdGTHJRYWY5UUxOTEZQWlVzNVFhV2ZhYVRk?=
 =?utf-8?B?VjR5UHZQUS9mVzkyMnMrenJydzFUcHM1ZXNvYS92eWdOYjJqMGo1MGtnQXF1?=
 =?utf-8?B?WnM5cG5BL0xlMWc4Z3JDU2tkV0NBdEhrSVRWVjFZRE14NC84RG1aOEtFSURG?=
 =?utf-8?B?TGZQM2lleXNWUXprbzZHYXA0M3ZyN1BWVGg5K0RhT0k4MlRldUJBanRtakxJ?=
 =?utf-8?B?eTE5OXUxa2lsd2drZ01aRnBGRzFxOUk4MUFnZHI2UlFMR0R1ZmRsV2RPMGFu?=
 =?utf-8?B?OExDQk45ME1vbkN6UDcvTkoxQW5SQVlXMlpiSjBXUE9tK1V5ZUpWWWFqYVpY?=
 =?utf-8?B?S2ZsTVZSQmZpNWlFOSs1V0ZpWWt6Zk9xV25qSTVNWnhFa2FncnRrTVVJM0o4?=
 =?utf-8?B?bzVSaytUKytoOExIYUhabGxxNlZOZVUvdmVlOHluU1VBVHZPNktGOGpvN1Bj?=
 =?utf-8?B?a0dEOUlGT3BTSHd0b0tOTGRKWVExcW0zN05yUXNSY3gyZHYwNC9TckpzMUNG?=
 =?utf-8?B?cXovcitmME1ieWYxcW95azZWd255SEpvaFhhWHYzSTZJNUh3SjBRZ3A4azRv?=
 =?utf-8?B?WlVpUW1sQUpNUVNXKzUvcjd5L3FUSkh0Zzc4TDNENmJmTGZuVk9USzVjeHlr?=
 =?utf-8?B?TWdvMjg1a1hnY0M3dFlVTkNZM1BXbHN4R05TRWlEYmladjRoQ0h5ZTlKVC85?=
 =?utf-8?B?NURva0hsUjFMdnRvZEI3NWovOVpIQnBmNlpuR1RQUUk5emxzaDFYb2xZSHo2?=
 =?utf-8?B?RFBEMU5wSStub1QyZTAxb2RaV3EwUk1ITlZFTzJ2K0FEN3VBSWVJZjdPTGNT?=
 =?utf-8?B?YVNITFJ2ZFY2S2o5YVhnU3g3NDluTFBRczRuQ3RrdHpFbXQxQTlBVkU0RHlt?=
 =?utf-8?B?MDNsZEVoWExiNTBYQm96ZFFyMkpQZjcybXdtNWJGRGxJS3lNaloyc3dDUXc2?=
 =?utf-8?B?Yy8yd21TSFVNb01xOThJOWJyNDFYZ1liOEN4K0gvc1FSc3c1cGgrQml3UGhT?=
 =?utf-8?B?VUtuMWdyQXNxV21NT0o2NHQvQmtDSlR4RnlqVnNONmwrZERqdThVNFEwZlIr?=
 =?utf-8?B?ajQwTm9XMkxDZk53L3NWM1phR0lid1ZrbEtiUHBMRzFQYmN1QWlLaW56M1c5?=
 =?utf-8?B?YjFjSkE4ZWJMRjVHMS9POFFqaUFUdDFMSmxIUXMybzRvR1phVVdyZzNTb081?=
 =?utf-8?B?R0tWS0dnYXNTSEp1Y1NKaEJxY29WWHlxN09TQXA4clhaWTRhK3l0d0YxUVNP?=
 =?utf-8?Q?kpr9CCW5A/92Zi9Lj0kD9lrqH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1703E70025AB3B4993E45F5F7FA0A7F2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6483c5d-cce0-4bc5-6630-08da76509d79
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2022 19:36:23.7317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZPicCkcYory8Lys8IiDquvjTM+AwZ/UtRi83JHWN86FUn8/7w4XHs2EIoUkoHyR3PGZjOUEDqTaojW6L9VscysYQJ4imNac46KFnY4DCIrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5637

T24gMDQvMDgvMjAyMiAxNjowNCwgSmFuZSBNYWxhbGFuZSB3cm90ZToNCg0KQ29tbWl0IG1lc3Nh
Z2Ugd2FudHMgdG8gcmVhZCAic28gaXQncyBub3QgYSByYW5kb20gcGllY2Ugb2Ygbm9uDQoudGV4
dC5lbnRyeSBpbiB0aGUgbWlkZGxlIG9mIC50ZXh0LmVudHJ5IiBvciB3b3JkcyB0byB0aGlzIGVm
ZmVjdC4NCg0KPiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEphbmUgTWFsYWxhbmUgPGphbmUubWFsYWxhbmVA
Y2l0cml4LmNvbT4NCj4gLS0tDQo+IENDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+IENDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBDQzog
IlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gQ0M6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+DQo+IC0tLQ0KPiAgeGVuL2FyY2gveDg2L3g4Nl82NC9lbnRyeS5TIHwgMTkg
KysrKysrKysrLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveDg2XzY0L2Vu
dHJ5LlMgYi94ZW4vYXJjaC94ODYveDg2XzY0L2VudHJ5LlMNCj4gaW5kZXggMjZiZjJmMTk0MS4u
NGFkMjVkOWM5MCAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC9lbnRyeS5TDQo+
ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvZW50cnkuUw0KPiBAQCAtMTQwLDYgKzE0MCwxNSBA
QCBwcm9jZXNzX3RyYXA6DQo+ICAgICAgICAgIGNhbGwgY3JlYXRlX2JvdW5jZV9mcmFtZQ0KPiAg
ICAgICAgICBqbXAgIHRlc3RfYWxsX2V2ZW50cw0KPiAgDQo+ICsgICAgICAgIC5wdXNoc2VjdGlv
biAuaW5pdC50ZXh0LCAiYXgiLCBAcHJvZ2JpdHMNCg0KR2l2ZW4gdGhhdCB5b3UndmUgKGNvcnJl
Y3RseSkgZHJvcHBlZCB0aGUgLnBvcHNlY3Rpb24sIHRoaXMgc2hvdWxkIGJlIGENCnBsYWluIC5z
ZWN0aW9uIHJhdGhlciB0aGFuIC5wdXNoc2VjdGlvbi4NCg0KQm90aCBjYW4gYmUgZml4ZWQgb24g
Y29tbWl0Lg0KDQp+QW5kcmV3DQo=

