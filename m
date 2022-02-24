Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58294C3269
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 18:00:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278520.475808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNHT4-0002Uq-CU; Thu, 24 Feb 2022 16:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278520.475808; Thu, 24 Feb 2022 16:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNHT4-0002SX-7y; Thu, 24 Feb 2022 16:59:50 +0000
Received: by outflank-mailman (input) for mailman id 278520;
 Thu, 24 Feb 2022 16:59:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6js4=TH=citrix.com=prvs=047c6e0b2=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nNHT3-0002RJ-0x
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 16:59:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b2cc548-9593-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 17:59:47 +0100 (CET)
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
X-Inumbo-ID: 2b2cc548-9593-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645721987;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2+SnpnIe2UeRFXwEc2cG5/BwM17UTPrMDST4j5wAOqc=;
  b=VClIACsG5hdJ05i2jtYUPBFguJMkXCxmGnFC0O8dqB9B/CNHMM2jc8Tu
   HlMeeTHD1FO0TrFasbr6Eb1VJfMrKXlAy9kcFMpcfjpecxtuy8qvNW/3Z
   cN7ElFdCRNRo2oCSd58xo1jQhl6qi/m6R5tYP21KXS733TEpccSAlHFsx
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64924405
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9JbZO6Ci7e6WURVW/9Djw5YqxClBgxIJ4kV8jS/XYbTApDJ302FSx
 jYXUD+PP/rZY2X8Lo0naYy29BwEvsKAzt5qQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Rj3tYz6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhs7
 s506J2RGD10ZO7mtfoDTAgFTgdxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwBJc/meqYWvnhkxDfUJf0nXYrCU+PB4towMDIY2JwfR6qCP
 5dxhTxHUU7PODhFHFUtT58snua6hiTHVGQGgQfAzUYwyzeKl1EguFT3C/LZc8KHbd9YlUGZo
 iTB5WuRKgoBKNWVxD6B83StruzChyX2XMQVDrLQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAaykuvSdXsWgyil1SNtBUcRtl4HvUz7UeGza+8yxmdLngJSHhGctNOnM08SCEu1
 1SJt8j0HjEpu7qQIVqf67OVoDWaKSUTa2gYakcsTwQf5ML4iJoulR+JRdFmeJNZlfWsR2u2m
 WrT6nFj2fND1qbnyplX43japSmV+5noHzRovEb9c3y78RIkOaiqMtnABUfg0d5MK4OQT1+kt
 XcCmtSD4O1mMaxhhBBhU81WQuj3uq/t3Cn0xAc2QsJ/r2jFF2uLINgIiAySMnuFJSrtldXBR
 EbI8T1c65ZIVJdBRf8mOtnhYyjGIEWJKDgEahw2RocWCnSSXFXelM2LWaJ29zqz+KTLuftiU
 ap3ie72UR4n5V1PlVJavds1374x3TwZzmjOX539xBnP+ePAOCPLFe1ZagDRNrtRAEa4TOP9q
 Yg32yyikUg3bQEDSnOPrd57wa4idxDX+qwaW+QIL7Xec2KK6UkqCuPLwKNJRmCWt/89qws8x
 VnkAhUw4AOm3RXvcFzWAlg+OOKHdcsu9hoTYH1zVWtELlB+OO5DGo9ELMBpFVTmncQ+pcNJo
 w4tIZvYWa0XEmydk9nfBLGkxLFfmN2QrVvmFwKuYSQlfo4mQArM+9T+eRDo+jVIBS2y3fbSa
 ZX5vu8HafLvnzhfMfs=
IronPort-HdrOrdr: A9a23:BkwD0Kk0LuwaW5ATnPpTmzubMYXpDfObimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcIi7SdS9qXO1z+8R3WGIVY3SEDUOy1HYUL2KirGSjAEIeheOu9K1sJ
 0PT0EQMqyIMbEXt7eY3OD8Kadb/DDlytHnuQ699QYUcegCUcgJhG0ZajpzUHcGPzWubaBJTK
 Z0jfA3wwZIDE5nCPhTcUN1ONQryee79q7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFuxaR3NTjj9iLjjvnk0PD5ZVfn9XsjvFZAtaXt8QTIjLwzi61eYVaXaGYtjxdmpDu1L9qqq
 iOn/4TBbU315rjRBDwnfIr4Xim7N8a0Q6h9bZfuwqknSW2fkNiNyMLv/MnTvKQ0TtfgDg76t
 MR44vRjesnMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZIZc6I5l/1WwKp5KuZ3IMvB0vFvLA
 CuNrCo2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZLyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR/2Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NKggFCvsuk6SRloeMN4YDaxfzOGzGu/HQ0ckiPg==
X-IronPort-AV: E=Sophos;i="5.90,134,1643691600"; 
   d="scan'208";a="64924405"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bK14UY5E/M4p1kKx53/y0sycu+9ryUt3sB81I7A1q5mCCtR7Avev4BlnV8y6kOWp/0zq3xxOMeBbZIWZV1oTa5ctDq7D8qqWzLJtdOtP8IXzpMUhQkXkbrkmJfVRMcDGjZOx6zd1WChOQ+AqbjwM1d0F6+Of3KerrA1fME9wIIBykuJoCkq5nOcA0GD6pJ1TrA6xWyH3M2pxnNfVeiPpTi3VW8qDL2Zto9Nimo/vurB9V/whAGmyMwKb6Q77RHVYPFaUgp6ICYXu2gIm61FEjAHaNV5rMmhwfzKOAExbPfwTf94ISuDtzD90tb5HkcIohukvMy/93k/qVUe0jjn8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+SnpnIe2UeRFXwEc2cG5/BwM17UTPrMDST4j5wAOqc=;
 b=C/bDa+EGdEng1hFzrWc7xT1+EMpjj3SuYB7HYYKwSrjmcp8BUIjr6b/cvjnjG9aBT/Zh3aBdh1XCUT/kRF1cN+FbZP8vGqxGvqdVrlJpNVjlMq4PEdvtrIxrGlA1Tx8md5+ITJkKRMe1JoN+ZFmUeadPmeMd2Cn/jsAkOY0Vfns6EFMV0+vtIyNXrJsGt/A97GsFhOV8k6Mru1rHox2/o1pdK2XXaGLM4j2FiTewQoa5Sbdz7mRFXJs3+udKd8mhKdKTFgt7V0fijcngrxI/k7kNZk6FeHDj45dfo79QupBcmuG1m+WwMQfwpxFrnbfF7SntBfjHm6evfHsHBOr3OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+SnpnIe2UeRFXwEc2cG5/BwM17UTPrMDST4j5wAOqc=;
 b=gB15Qh1r2bK5M+8gZAKExJZasWlEsmjvbuWbLwWJhTAueZbDITzmrIGr9ILmgmDZTOKSG843MA07IcQDbRCVCsgn3loZF4MvCiV39veqfCFNeDRNLaHHrhKZ67hWGIcw2KDnkMfh7dmdT1EbHK0JILNN/6HXGFHUEUWla28lfr0=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "George
 Dunlap" <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Topic: [PATCH v3 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Index: AQHYJO0/E2Q9kBLnmUergICAnT03vayiyEcAgAAtrYA=
Date: Thu, 24 Feb 2022 16:59:41 +0000
Message-ID: <50854702-490a-521f-c4af-1de57d4abf4b@citrix.com>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-3-jane.malalane@citrix.com>
 <b83773ec-c97a-7aea-e61a-c2e34b270816@suse.com>
In-Reply-To: <b83773ec-c97a-7aea-e61a-c2e34b270816@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35e5def6-8afd-41e7-3943-08d9f7b70cfd
x-ms-traffictypediagnostic: BYAPR03MB4648:EE_
x-microsoft-antispam-prvs: <BYAPR03MB46480B4080F78480C08BB01A813D9@BYAPR03MB4648.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M61fCpFKmNCYs9BwR9XGm/4iTkFu8vBwiRcKzqF2mORRGVaJrEbqxYFr8OrqyB4OvnJUYURCuWFqq4Gs//BIZ0KiQjdnijC8HQx1S05aZz9lqvd1paf8rF5elQkERFMpLSKlIPuf28tsQL1owgopAoDZgxjB34D6nw0axjeUKuSbR9eNysaoaURXmiquKtYi+Vx6vgDYcVuOAKnltetmqN1YIVgcd3QH4qEZr7zlBuNy4QKMZBbsxG+OMfESzwlMf1zrcbNY2sLZTjRFc7rfQBGwTcgpmkKLAq0I8+RBncyMCqfvJFPzgA6sPRWYiIK+vC2aNKVD6wmR/FUQ1GArkkMb5qx3fvpzGul+QOvEwIg245XcdSRJunmXTeikTsaTZ4XUI92/CQx+UtsaSYJi7XWDpOyqtIuf5oY7VpcDnI42PWqyFhve4xXduOdoX8cbPwSHURpt1+ne1YbgUOqo1djrZqRQqv7pm1LheKzCsezTPkQaz++gNp5QLBtf7ylkZu16dA9BTvPnhKA0JqiOHL3EiP2cKBa9wLRDIYlIoW9bmrI7zBQk4Ey9DWq5zfwszMraVcrxHVttn5BNBjf5oKJ6uBeyw0VuIHMbpw1U5tttO0KLtf+4TV7C9qZ7PTbEiPVZLLhHqHYQv2V1nYmtsX1/j6wxKZ5NSQIAedga0Lflf8UY2n1FzpIe5NKpMzmIGHNBdvBOuqqhQ3KbpDhQNKu1LvT8iXimOQ5CSgJOpZAuOLwh55VeNmKY0vrE8aMt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(91956017)(6486002)(2906002)(186003)(66946007)(26005)(53546011)(66556008)(8676002)(4326008)(66476007)(66446008)(64756008)(508600001)(36756003)(31686004)(316002)(6512007)(6916009)(54906003)(76116006)(6506007)(8936002)(82960400001)(38100700002)(5660300002)(2616005)(71200400001)(31696002)(83380400001)(122000001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1NENHM5dGxGUEhJZ0Y1eTlkUnRhejJDM0FSU2FCajhoK08rcndLeUVkRzBW?=
 =?utf-8?B?WEVhV1NRZkp6bDdURHRaWHU0MlNQeCtoa3IyWWVrejVrZ2Frdk9pbUdqUmtI?=
 =?utf-8?B?cXAzbWRJS2lhUEMyeFJEbTFIZFZUc1doek1LYmJXWTkwL09XbzhZT0N5SVRL?=
 =?utf-8?B?K240cTloem1ac0UraXdRWjJhd0xxMjVQakJIbnpOYnJNeW1FTGJhNVkySzRB?=
 =?utf-8?B?Qzhrc1RybmFDeERCVytDZVVjQ1FMYnRybm40UUFxczlDYTdISHhTSVJEN09L?=
 =?utf-8?B?TFJqS1lLVXZwT01lL1Fkam9vRzFYN0ZEckEzcm5RYUtWUXIwZUVjTDc4VHpL?=
 =?utf-8?B?WEtRRzJxZzVaSkpoNFpwdUFYTTR3MXhzZlgzVWl4TjVMTCtPaWdWN3Z2ZjUy?=
 =?utf-8?B?S3pJOXVQTCt3RGYwdE81eW9rTFlOTkpGaEF1YndBTUpqKzgrUmwxcjYxcXlU?=
 =?utf-8?B?NGVrT1FNRCtzN3QwVnpLdjVLZStKdmd1RHFrOGRJNXFBeXR6UTdCWCtJdlNz?=
 =?utf-8?B?NS85cGxXOUtxVjh6ZWRkUjBGSFZNdS9sN0NDbVJXcmJQRWNwV0U0c3Y4SzVH?=
 =?utf-8?B?WjlLbGszMGtNbkFJa25DTTdxekFqZFRIdkVveWxVd3BYc3A1c2prK3VoTlhO?=
 =?utf-8?B?STRyZ2tRbGxuRzE3UEFaUkYxY21jR1U4RWtzV3U0OWplUFRLZlJrMWVZb0wv?=
 =?utf-8?B?TUM0MW8yZ1ZCYUVzMkRRNFNENThOVkQyRVFORE5KUFJvTzBUWkVYSVBGM3B6?=
 =?utf-8?B?QnRWYjEvWHpiZi9MellpT3cvcjlZeEFBUVRTOE9SVEFlOFF4ZThmcm84THpQ?=
 =?utf-8?B?Rk9rSFdHd0NCeGppbUNhKzdsTkVUV3hoc2oyU3FaeE1LYmpUdFAvVC8rYkNs?=
 =?utf-8?B?SW9xWXZBM05EUGMrR3F3S0cydlNvdnpWZlVLeW9KSWR6Y1RBd1F2cEdNQi9E?=
 =?utf-8?B?Z3VHY0VkS2Z1K3pyUTBaMldHMnFQNm0yQTJXMmZGcjEzd2FaR0FNZDlyczcx?=
 =?utf-8?B?aFQwd3U2S2FyTFp5cU9nRFdPQVFtUkQ1RmJyNm92SFZ6Tk9VbDkrbEg2TGxz?=
 =?utf-8?B?MFlyN0dwNEx0N0VudXlxbS9FZThDMEl0cGtqTVFVdWpJdi92NWV0eHNWVmpZ?=
 =?utf-8?B?YmduVUFBMUkwb0FTaGJYRVR0RlgzVDg1WlFUbmtad1FLNnpZMmhsSmhYeExC?=
 =?utf-8?B?Mm9xU0hFUVE4TTY4L2E2YVV3ZHFLRHNuMHJoTHRJdWF3S1dqSkh2cTdQN3NW?=
 =?utf-8?B?Z09Jakkrd1pzR2dxejRsUnJuL1JiVWt1djBYT2pPR3Y2UE9ScEZ5TUlpRkoy?=
 =?utf-8?B?eXB0cnRyOGFyUlpwVGliM2hhNU9XVXNaZ0xPSFNBSC9zeXovQ0pkYlQ1eUla?=
 =?utf-8?B?RStneWRvcU43L21uWUJibG5TNGdoVTlUSXZrZjBrM3ZoVWlqa0FMYitSWW9S?=
 =?utf-8?B?VFN0T0tsalM4ZDdWK05OYVd0aDdYa2JHVEgvcGxwbEJIaU1qSU1pZXd5dyt0?=
 =?utf-8?B?cC9Sa3M2L2tVUHpzcjRGQVF5VnRXYi9oN0RzeWMvL0ZIZ3VJekRKamRwcFNo?=
 =?utf-8?B?aEhkVEpNOUNPakJsU1NhU1JkTkM3UUFmeGNidUM2ZGhBbnR0NGxIOE8ycVU0?=
 =?utf-8?B?Kzl0Z25TQWFmam9FQWd1TVBDMUhBT1N1SEhYMkdBNTFVMTErekplSU9zQ3lO?=
 =?utf-8?B?SjhaTTF5ck9WeGlnOUV5bStkWldGdnZUVFhQRnE0N2lsOXV1cWhJellUYWNV?=
 =?utf-8?B?TEFVQWViZVpqOFVCeHN1eGx4WGRXS2NjUjliUTR0UGwzWEgzZ3VGRlRrSzNn?=
 =?utf-8?B?OGtReGNLbHowMEZQQlRiaHNQckIvV3ZOaThGS2NuS212L0cwNlFUSEt4dXJy?=
 =?utf-8?B?bDBENnFHK2JGL0w4STdzVjZCTndlcXlTbFozVmExU2hFR2Rabm9LeEhGWDJW?=
 =?utf-8?B?ZnZEaVM0dkpKTDhlZVlkVG1DREdFeWpEOGFiNWpWNWVDU3pLMk5Mb0pqSm5o?=
 =?utf-8?B?RmR2ZEVObjFaU3U1aTY2cExWSXIzVlRSLzRaSHNSMEIwc2RKcjY4RUJwUCtK?=
 =?utf-8?B?Ukd4QmtOZ0VXdng3elVFQ0ZBRzFzNWRHNTJjNzlwRkk4NkVQR1VhQkdMem4z?=
 =?utf-8?B?ajE3SGVSckl4WTBrTXMxM3FyK0dHMXZ0RXBMaGRYSUdVTVhZVUtjSWFOY1pD?=
 =?utf-8?B?aVJ4bWJjL3lWUEdQR2NZN1lHY3h4R3hiVHdnMUpsUXZLd2tTOVJ1czdIRldq?=
 =?utf-8?Q?ExXYJWvMYWAvKL7Si9kjH3+CV0gOFJnNqbnKsvKDnE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44F3199BB171444AB7F1D163082F7B58@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e5def6-8afd-41e7-3943-08d9f7b70cfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 16:59:41.7539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6QMPhzxIlND2L8G+dSRZAeqYE+Yt7JFC1RwOc9U8cD73EbN7xfqJ6AcdepgAKLimutdbqGhjHFi/FSdKDpNxzT2sn8z6Swoird0B/UEiv/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4648
X-OriginatorOrg: citrix.com

T24gMjQvMDIvMjAyMiAxNDoxNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFtDQVVUSU9OIC0gRVhU
RVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IE9uIDE4LjAyLjIwMjIgMTg6MjksIEphbmUgTWFsYWxhbmUgd3Jv
dGU6DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0KPj4gKysrIGIveGVuL2Fy
Y2gveDg2L2h2bS92bXgvdm14LmMNCj4+IEBAIC0zMzMzLDE1ICszMzMzLDE1IEBAIHN0YXRpYyB2
b2lkIHZteF9pbnN0YWxsX3ZsYXBpY19tYXBwaW5nKHN0cnVjdCB2Y3B1ICp2KQ0KPj4gICANCj4+
ICAgdm9pZCB2bXhfdmxhcGljX21zcl9jaGFuZ2VkKHN0cnVjdCB2Y3B1ICp2KQ0KPj4gICB7DQo+
PiAtICAgIGludCB2aXJ0dWFsaXplX3gyYXBpY19tb2RlOw0KPj4gKyAgICBib29sIHZpcnR1YWxp
emVfeDJhcGljX21vZGU7DQo+PiAgICAgICBzdHJ1Y3QgdmxhcGljICp2bGFwaWMgPSB2Y3B1X3Zs
YXBpYyh2KTsNCj4+ICAgICAgIHVuc2lnbmVkIGludCBtc3I7DQo+PiAgIA0KPj4gICAgICAgdmly
dHVhbGl6ZV94MmFwaWNfbW9kZSA9ICggKGNwdV9oYXNfdm14X2FwaWNfcmVnX3ZpcnQgfHwNCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjcHVfaGFzX3ZteF92aXJ0dWFsX2lu
dHJfZGVsaXZlcnkpICYmDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNwdV9o
YXNfdm14X3ZpcnR1YWxpemVfeDJhcGljX21vZGUgKTsNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdi0+ZG9tYWluLT5hcmNoLmh2bS5hc3Npc3RlZF94MmFwaWMgKTsNCj4gDQo+
IEZvbGxvd2luZyBmcm9tIG15IGNvbW1lbnQgb24gcGF0Y2ggMSwgSSdkIGV4cGVjdCB0aGlzIHRv
IGJlY29tZSBhIHNpbXBsZQ0KPiBhc3NpZ25tZW50IG9mIHYtPmRvbWFpbi0+YXJjaC5odm0uYXNz
aXN0ZWRfeDJhcGljIChhdCB3aGljaCBwb2ludCB0aGUNCj4gbG9jYWwgdmFyaWFibGUgY291bGQg
Z28gYXdheSksIGp1c3QgbGlrZSAuLi4NCj4gDQo+PiAtICAgIGlmICggIWNwdV9oYXNfdm14X3Zp
cnR1YWxpemVfYXBpY19hY2Nlc3NlcyAmJg0KPj4gKyAgICBpZiAoICF2LT5kb21haW4tPmFyY2gu
aHZtLmFzc2lzdGVkX3hhcGljICYmDQo+PiAgICAgICAgICAgICF2aXJ0dWFsaXplX3gyYXBpY19t
b2RlICkNCj4+ICAgICAgICAgICByZXR1cm47DQo+IA0KPiAuLi4gaGVyZS4NClByZXZpb3N1bHkg
d2UgZGlzY3Vzc2VkIHNldHRpbmcgdi0+ZG9tYWluLT5hcmNoLmh2bS5hc3Npc3RlZF94YXBpYyBl
cXVhbCANCnRvIG9ubHkgY3B1X2hhc192bXhfdmlydHVhbGl6ZV94MmFwaWNfbW9kZSwgdGhhdCdz
IHdoeSBJIGhhdmUgdGhvc2UgDQphZGRpdGlvbmFsIGNoZWNrcyBhcyBhdCBsZWFzdCBhcGljX3Jl
Z192aXJ0IG9yIHZpcnR1YWxfaW50cl9kZWxpdmVyeSBhcmUgDQpuZWVkZWQgZm9yIHRoZSBzdWJz
ZXF1ZW50IHBhcnRzIG9mIHRoaXMgZnVuY3Rpb24uIEkgbWlnaHQgYmUgDQptaXN1bmRlcnN0YW5k
aW5nIHlvdXIgcXVlc3Rpb24uDQoNClVubGVzcyB5b3UgbWVhbiB0aGF0IHdlIHNob3VsZCBmYWxs
YmFjayB0byBoYXZpbmcgDQp2LT5kb21haW4tPmFyY2guaHZtLmFzc2lzdGVkX3hhcGljIGRlcGVu
ZCBvbiB0aG9zZSBvdGhlciBmZWF0dXJlcy4uLj8NCj4gDQo+PiBAQCAtMTEyNCw5ICsxMTI1LDgg
QEAgdm9pZCBjcHVpZF9oeXBlcnZpc29yX2xlYXZlcyhjb25zdCBzdHJ1Y3QgdmNwdSAqdiwgdWlu
dDMyX3QgbGVhZiwNCj4+ICAgICAgICAgICAgKiBhbmQgd3Jtc3IgaW4gdGhlIGd1ZXN0IHdpbGwg
cnVuIHdpdGhvdXQgVk1FWElUcyAoc2VlDQo+PiAgICAgICAgICAgICogdm14X3ZsYXBpY19tc3Jf
Y2hhbmdlZCgpKS4NCj4+ICAgICAgICAgICAgKi8NCj4+IC0gICAgICAgIGlmICggY3B1X2hhc192
bXhfdmlydHVhbGl6ZV94MmFwaWNfbW9kZSAmJg0KPj4gLSAgICAgICAgICAgICBjcHVfaGFzX3Zt
eF9hcGljX3JlZ192aXJ0ICYmDQo+PiAtICAgICAgICAgICAgIGNwdV9oYXNfdm14X3ZpcnR1YWxf
aW50cl9kZWxpdmVyeSApDQo+PiArICAgICAgICBpZiAoIGNwdV9oYXNfdm14X2FwaWNfcmVnX3Zp
cnQgJiYgY3B1X2hhc192bXhfdmlydHVhbF9pbnRyX2RlbGl2ZXJ5ICYmDQo+PiArICAgICAgICAg
ICAgIHYtPmRvbWFpbi0+YXJjaC5odm0uYXNzaXN0ZWRfeDJhcGljICkNCj4+ICAgICAgICAgICAg
ICAgcmVzLT5hIHw9IFhFTl9IVk1fQ1BVSURfWDJBUElDX1ZJUlQ7DQo+IA0KPiBXaGlsZSB3aXRo
aW4gdGhlIDgwIGNvbHMgbGltaXQsIEkgdGhpbmsgaXQgd291bGQgaGVscCByZWFkYWJpbGl0eSBp
ZiB5b3UNCj4ga2VwdCBpdCBhdCBvbmUgc3ViLWNvbmRpdGlvbiBwZXIgbGluZS4NClN1cmUuDQoN
ClRoYW5rIHlvdSwNCg0KSmFuZS4=

