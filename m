Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD2D4B513F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:11:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271868.466579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb8j-0006FN-0j; Mon, 14 Feb 2022 13:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271868.466579; Mon, 14 Feb 2022 13:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb8i-0006D9-Tt; Mon, 14 Feb 2022 13:11:36 +0000
Received: by outflank-mailman (input) for mailman id 271868;
 Mon, 14 Feb 2022 13:11:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5JaK=S5=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nJb8h-00054q-1x
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:11:35 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1178fde-8d97-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:11:33 +0100 (CET)
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
X-Inumbo-ID: a1178fde-8d97-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644844293;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SYyEwrO5qN+yK+owPemfrBsDCca4abNLA3jdr2ADwsA=;
  b=XvZWUY/eJC9S/G2HDYRLT3xrIxwV9P6QcjqR3QFgQIyYCd7O5O4HLHTl
   uwf9/JQMtaRXVKfRPkiiOHVq7bgZXYFmz6nuM3IWlCQAOiOsuOhIeRoiO
   WWXbrskK2axmafXmFwc7Jw1x7vnYF+GmPImCHFJGi7JwaaNk02eqikQsL
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FxfMpApnkoabecJnNbYOLIDXnoawYdNv4S7H5YpZmWLGTYZDNCUr3d9S2NSdEue7wI4EAmUjB9
 vW4LjjyMVnkfXZUKc5SzY/BzRRkd7jqmKyqm9DEEW9VbBZPyDQfx5eTFxL7WOKOTGTqlU2NvWP
 1clgq6P92xJv1XDI29GPgtnzUV1ByMlHk6JeAu9ic3dEQF+zp5IfH2W9utZdOno/maBAH8XOVP
 fesjFCNbCJnoiqUHAABTnTNJPl20sb6CvnmNbA1Bkb3NRtlOj2wF28qqoCQ/RbDpyayzE5Xud7
 YTtSdPPyydZGbHQ3V0aGlnRs
X-SBRS: 5.1
X-MesageID: 63593121
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6S7L9KCXkDqa2BVW/0Hlw5YqxClBgxIJ4kV8jS/XYbTApG5xg2APm
 mIYWziFb/2MMWakf4h1YYS39B4EuMLQyYBjQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970E47wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/pA7Qjugyj
 +12jd+WUAU4fanzid8RTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTaOBqi4IGJc3iOIoZt1lrzC3DDOZgSpfGK0nPzYEDgWZr35oXdRrYT
 8E1dAUscxnqWgdGImdICbQRl8CIoXaqJlW0r3rK/PFqsgA/1jdZ7r/pN9bEf82Qcu9clE2Yu
 2Hu8nzwB1cRM9n34SGe7numi+vLnCX6cIEfDru18rhtmlL77mYeEgEMXF235/ywkFejWsl3I
 lYRvCEpqMAa90G1T9+7QxyxplaFuAIRX5xbFOhSwAOQzOzS6gWQBGkBRxZAbsArsIk9QjlC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMt4dPuvYUyhRLnVct4Hei+ididMS706
 yCHqm45nbp7pcwW06S2+3jXjjTqoYLGJiY36R/QRXmN9R5iaciuYInA1LTAxa8edsDDFADH5
 SVa3ZjFhAwTMX2TvAO2GfQ1X/aR3M7GFiTekB1rIIga+yv4rhZPYrtsyD15IU5oNOMNdjnof
 FLftGtt2XNDAJe5RfQpOtzsUqzG2YClTI24Da6MMrKid7AsLFfvwc14WaKHM4kBemAImLp3B
 5qUeN3E4Z0yWfU+l2reqwvwPNYWKsECKYH7GMqTI/ePi+P2iJuppVAtagXmUwzBxPnYyDg5C
 v4GXydw9z1RUfflfg7c+pMJIFYBIBATXM6q95MHJrPeelM9QgnN7sM9Jpt7JeRYc1l9zL+Ur
 hlRpGcEoLYAuZE3AVrTMS0yAF8edZ1+sWg6LUQR0aWAgBAejXKUxP5HLfMfJOB/nMQ6lKIcZ
 6RVKq2oX6UUIhyaqmt1UHUIhNE7HPhdrVnVZHTNjflWV8MIejElDfe6IlqxpHFWVHLfWAlXi
 +TI6z43iKErHmxKJM3XdOiu3xW2u30ck/h1REzGPp9Yf0CEzWSgA3WZYiYfL55eJBPd6CGd0
 grKUx4UqfOU+90+8cXThLDCpICsSrMsEk1fFmjdzLC3KSiFoTbznd4eCL6FLWLHSWf52KS+f
 uEJnfvyB+IKwQRRuI1mHrc1ka9nv4nzp6VXxxhPFWnQawj5EatpJ3SLhJEdtqBEyrJDlxGxX
 0aDpotTNbmTYZu3G18NPgs1KO+E0KhMyDXV6P00JmT85TN2o+XbARkDYUHUhXUEfrVvMY4jz
 eMwg+Is6lSy2kgwL9KLriFI7GDQfHYOZLoq68MBC4jxhwt1llwbOc7ACjX76Y2kYslXNhV4O
 SedgafPiugOxkfGdHZvR3HB0fAE2MYLsRFOilQDO06IipzOgfpuhE9d9jE+TwJ0yBRb0r0sZ
 jg3ZhMtfajerS11gMVjXny3H1ATDRKUzUX91l8VmTCLVEKvTGHMcDUwNOvlEJr1KI6Akuy3J
 I2l9Vs=
IronPort-HdrOrdr: A9a23:dvBnTqkvl5DehPoCUwRrJt05lyPpDfIu3DAbv31ZSRFFG/Fxl6
 iV8sjztCWE8Qr5N0tBpTntAsW9qDbnhPtICOoqTNGftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAs9D4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="63593121"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpgTcbmaiQxoWqCJ1rvCOLm2azAe6v4Jt9Cr7iIhZFNZ2Ixlkdsn8TKHqlb8gah6akUFPGXoGN2jFSNLIV6PS0qcc2qofBQ5smGSRUE9vJa/y2FatphArviHiyEDOa8EAPycY0eFTZ2GgLLSutBfZVOimsBZZ1ktGzYeZPbFMARz7McyuLwRgUTkxlPEexcoMHG3SkV+Bg+jCEDkmQ7o37Qm2GUfUfea6DIQ7OGCjn/N6q4JFe3BLnNt49EKTIqoEkMKjFtR7M+Al58+rEyCexyooMNkFVd1v/EShAx5d/7kwZjV+gsSV5XH5cs0WFftMfZPesCy+TNDBmdH53eHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYyEwrO5qN+yK+owPemfrBsDCca4abNLA3jdr2ADwsA=;
 b=CePfLdKc0z1X+MBq8if34DpEDOcp/DnF84ZkIKlmDOb9n+g5+K36wo7ebJKgU4MMVP5hXV2FK64Ld+Dr9v2L28I/M3PmUuSeYsWxR+Nl7Nu6B2DogLidg2L4MFQN9zIMwP+KfXancPVT+G5OwcWxdLdV2LP9KXtIBrwnf1mvW9zpHwtPaK5ZPvRhfPDn744iiUn/MdtdxKdoqKt+OFXmtRn38Aw02Lq0RhlNw4pCyIDc/wcfkmZtYcdOwcTAnTd7r5cfxCz5XsVjHb8TRLYaa/vwOCW0YXbYxTi20cactRHsC/9MrgjOjl61rXLiI1CIE+aX2lwic7YfH1z+RVzfLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYyEwrO5qN+yK+owPemfrBsDCca4abNLA3jdr2ADwsA=;
 b=TCxam9rpYVpR1wu9kHcys3m81vO4ovqIUFq20BeKnAHRTZ14ithVrPt5+v3pBgnl3O/vSmJfp+4j7jAIXCoATIdwW8zuuqgkg/t6VnQ6NDxaoOXy5dG546gDYG69GLKEt1kjaZ0jvsaYFlTEhr7wp0kdLNm1u6qm/W2vGJGSqp0=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "George
 Dunlap" <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYHE+TdJl64aH33EedeR0PZ4zblKyMkj6AgAGTLwCAABdDgIAABJKAgATOw4A=
Date: Mon, 14 Feb 2022 13:11:28 +0000
Message-ID: <6c9400b8-7c76-34c8-f69e-3fad1eb53b8c@citrix.com>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-2-jane.malalane@citrix.com>
 <YgTi6bzeojtcu0xL@Air-de-Roger>
 <dff9c5c0-7bee-ce0d-3288-91255a701c99@citrix.com>
 <YgZIo9VQktcqGHTD@Air-de-Roger>
 <6d924061-f2fd-5f3d-0f98-79e76398b908@suse.com>
In-Reply-To: <6d924061-f2fd-5f3d-0f98-79e76398b908@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1c0eeed-001c-4ffa-2905-08d9efbb8312
x-ms-traffictypediagnostic: SN6PR03MB3951:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <SN6PR03MB39511A769066D39AEC3262CF81339@SN6PR03MB3951.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VyFFk7PDcVWZ8olwkePC68DrMTsqzzWWB7gUouumKsfL+4PtJ94P8ojDgHFjoXZDn0K8zV1cvtxeFpk5Bpn4toY6gjmvkJdL0/sa6sIGpcDVGOLOJKDVPeB0SBW94pkQoXG3eUSNrA+je30IZc56/e/CmH9dEOszrVEoWBdPQ3thc8LYNPmlj9Fo1zLCh6Dm+3hIYWrGpetW+ZR+flfA+pM2eUKJjp4LSviBS+dMBXlKvwEYj/g069D1C8JKpn176aWKCfbK5+cGl0u3UsgmkZ+nZU6EAjQ/zr1L9QTKt885Fxan/ZMry0rY/RoT4p/Ol0NhZ87UCpduEhQAD9UYyDhRulQk25VIyKNx2lHyTzhcQtwCz4obkLN8SvzGlevT12il/roJzjxEsQYsJTe8r3rJFXlJnl3DEUNtYuMAWVdVgnUnccDCfpGdsJgKFRfIG0diw2YhmwzrmqXNghyGaSMEfsCgVn7tGZnu3zoBBizrFCF2zNPgB6frEeVKrFiDOMghRbBLy2XOjsvsYRuCMO9sNxnnWboIygcspRURhIirlXrY+gQ/gPcL5HQ3+0p7pBDtpzrXAgaMa5RVj2onkwhAgqtByu025vIhOfE0tji1ZOY/5NvRYw/aXxA3rSNNpFSnE1srj8Q6xQPb96mWJMsU0CDecZq0kpgQUbgjle2mOnnyfx4IDAXV4pw/LRzTycvYJWRftixfI50Uurcif9CkjIGWmfUA68Ue1fwqxq7/F8vlQlT98GtGKSonlewM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(2616005)(6486002)(186003)(53546011)(31696002)(6506007)(86362001)(107886003)(508600001)(82960400001)(71200400001)(83380400001)(6512007)(8676002)(66556008)(38100700002)(122000001)(36756003)(54906003)(76116006)(64756008)(6636002)(316002)(91956017)(7416002)(2906002)(66946007)(31686004)(110136005)(66476007)(4326008)(8936002)(38070700005)(66446008)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azZCNjBtZ1hGcURJUVhLV2hmdTBRSUZMRmFCRDJ4em5VeUxMWmNjZUJWMytG?=
 =?utf-8?B?eGhJYVNBVWo2ZUZUYmNKWktjQkJCeEo3dCtzZ3F0YXNIQUVlYzQzTlVEMk5j?=
 =?utf-8?B?T1V3M0g4Sk9qL2htMGxwQXgrTlk2ZU9lR2ZTUkdNdW5xbk51Zjd6dmlkQ0pU?=
 =?utf-8?B?YTJHbHh3TEowMjVsbURRb2tyRG96S1VheTdqakZXMlMwRnZmaDRMK2VKRDEz?=
 =?utf-8?B?WHBnNk1COHBTOWhTbEF5dnR2K0xRUVNiL2xRNmF0dHpmOXl4ZGFJb0JLeVhz?=
 =?utf-8?B?OWNOc0dLVks1RkxMSHAyVkY2N2c5RVUvZTRSZmJDdW43L3JRVnFrYzRmWW9R?=
 =?utf-8?B?WitPd0RrU3Y0MU9ZWHRmTGJVamFqKy94ckRXY1RPZEYwQU5jNXFwTWNXL2I0?=
 =?utf-8?B?MDZoVE92WkxHNHdub1ZNWVJkeDNzUXFGak5GYTN6N3BzcElXTzZVbjkyOHh2?=
 =?utf-8?B?OUlUV1JVREtZcTEwNG5JRHJSMlplemgyWGQvOGFQSTV5QzZ3UU9nQU55Z2ZG?=
 =?utf-8?B?aGQ2Vkhud05xMWk3bmJUM1lsN1ErcHYyZFJXOUhrYzZqUmVJMks2M2ExM1g3?=
 =?utf-8?B?UFNRVy9jRlVKaFNKYnE0aENqR3hoMHZDUE5qcEJNaWNTSDhPVW40NUlOVUEy?=
 =?utf-8?B?NGwwc0VueFM4MUZPSklDWjVNZjlNbVJDQTdVS21FcExLQjV5Y1gyczNJcWpH?=
 =?utf-8?B?NDYrYU9PdUZhU3JqaG1ieGRUTFFFcFdzQzE2M1lOY2l6NVN5N2xQNlp3bzJQ?=
 =?utf-8?B?eGlSc3JNWWZXYmZPYU1WbnNOVUVxc0lGbS9XQnBheGwrUVJvckF0QUlIWlls?=
 =?utf-8?B?YmdQMnRFdldJR2VycVpLMHg2UXVIc3F6UDU4WnlwZ2RsN0dCRmJJWU1mK0Jl?=
 =?utf-8?B?WmlYRmxJSEQxRnY2UTZ5N08xN1laSXQxZEZPOStkZllvZk9DcFJKRDBRbnpo?=
 =?utf-8?B?bGJleWMxR21ZWi91c1ZaWGFBdVNWbXY4RmJoamR2NGt1aDJnSVBHZG1Td2NJ?=
 =?utf-8?B?U0syUG5uYUZmSm1kU0lLWkpPVTRGaFdBMlN3YytVYmc1aXhSa0VrR0VVWkts?=
 =?utf-8?B?di81K3QrNjFleHJ0bk8yUmRUbGJvS24wRGRwQm9SSDdHTFhaUTFRbEVBTGF3?=
 =?utf-8?B?dDkwb3lDOE1oSFhMUlNZdFVqRTJ0UGtxaDdkejNMclVmbExOak5LN1MvTE1u?=
 =?utf-8?B?K1R0WHpBdkVCTnlBZTVxRnc5dzlYSVVXNnlyUHRYUHdWU1VBelBBMkwwU25L?=
 =?utf-8?B?SzFGbU1FNU5qVDY3OW1pb2l0NUZCRGdZU3poN1BYZkx2WFk5eWhJQlZyRzBN?=
 =?utf-8?B?MWREMUhWbjIvTnpGWkFFSHI4UUlpMTZlRzNra3JDTEhWbTlRRHF1aEFjVjJi?=
 =?utf-8?B?NlhZK25xWm1nQVN1YXFjTXZxeDdzNldqMTlGWkJmTi9ROFl1VVpZMElmb3FU?=
 =?utf-8?B?Wm9CaU83ZFJmbVdCRE0zcWxPZkJPeUhlR1FyL3lxekE3TGJFaUNKd0FzUjRl?=
 =?utf-8?B?Z1didDF6Rm90ckc0bThLK2YraU9Cam9pakVnSkRTRzBzMFlweVRtN0NnR2lK?=
 =?utf-8?B?Uzg3L3RrNmkwWnZIMys2MjJNRWdDTnd1Vkt0WC9OOGVvQUJTU3crWTNrc0hI?=
 =?utf-8?B?akd1bDhremxNbzl2M25pdjJyNFNvY1B0ejR4bmdZeDArQmx4K2JIQlMrYmJW?=
 =?utf-8?B?TXVTSHFyT0JsV3FQV2s4L3BZMG1helJ3S0tLUjVoQ3RKQlc5WkJTUW1Xa1dT?=
 =?utf-8?B?akVJRk9ZNUJSd0JPTUFMWERLQW82dXZManljV1U1YXh2Mk16YmJqc24yZnpn?=
 =?utf-8?B?TUMvcVJnV0FyYlh6aXZPRGdSMDhoNjl0ck1vWmhPRGN6bEMwYXhyRHN2cTdx?=
 =?utf-8?B?enZ0cFYyclF1RW93b1lRdVoyckh2dFMxOW8zNWxpSzZVeFpKNC93QVVBTFpn?=
 =?utf-8?B?a3U4KzV1cGVWc2JJK2hxbjN0dTZIOGZqaUNtRm9pTTR6NzdoR3FNQldGRUdZ?=
 =?utf-8?B?R0U4YW1kM1R3eFNLOVMyUjJBOU1rcTZmU3E3cHZMTGQra3dOMTdseVpnN2xa?=
 =?utf-8?B?WEMxZXhnbGdTdDVvVG5iSG5pL09EWnRWc3JvYWVSaWNIWnhYV2V4d0tadENa?=
 =?utf-8?B?M1FBdmx6a2UzQmtISTdYTnh0c0t2eExqWGZwMGFwTE8rNFlydlVJbEdDckV2?=
 =?utf-8?B?dk9PVkVxVGhpckdUYlM2anB5TU83WERtaGpTVW1yL3g3aHRqUXhRZFBoQ2t2?=
 =?utf-8?Q?i8QoVm7e2x5dcIddIUW6rD6+hXMPD4X30g321JBJzo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DC4424001B43747BAE928CEBE694BB4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c0eeed-001c-4ffa-2905-08d9efbb8312
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 13:11:28.6095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BBFMx+Wlo6eQDKlA0O2mpy8QaoRLf3I6vdQQXLTMkx1PQ39YixA7zQe/Oj6GM0rakFTKAB+GsQzeJvgcV0m6TMEEo76hYGNdQc86mldLgAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3951
X-OriginatorOrg: citrix.com

T24gMTEvMDIvMjAyMiAxMTo0NiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFtDQVVUSU9OIC0gRVhU
RVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IE9uIDExLjAyLjIwMjIgMTI6MjksIFJvZ2VyIFBhdSBNb25uw6kg
d3JvdGU6DQo+PiBPbiBGcmksIEZlYiAxMSwgMjAyMiBhdCAxMDowNjo0OEFNICswMDAwLCBKYW5l
IE1hbGFsYW5lIHdyb3RlOg0KPj4+IE9uIDEwLzAyLzIwMjIgMTA6MDMsIFJvZ2VyIFBhdSBNb25u
w6kgd3JvdGU6DQo+Pj4+IE9uIE1vbiwgRmViIDA3LCAyMDIyIGF0IDA2OjIxOjAwUE0gKzAwMDAs
IEphbmUgTWFsYWxhbmUgd3JvdGU6DQo+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2
bS92bXgvdm1jcy5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jDQo+Pj4+PiBpbmRleCA3
YWIxNWUwN2EwLi40MDYwYWVmMWJkIDEwMDY0NA0KPj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2
bS92bXgvdm1jcy5jDQo+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMNCj4+
Pj4+IEBAIC0zNDMsNiArMzQzLDE1IEBAIHN0YXRpYyBpbnQgdm14X2luaXRfdm1jc19jb25maWco
Ym9vbCBic3ApDQo+Pj4+PiAgICAgICAgICAgICAgICBNU1JfSUEzMl9WTVhfUFJPQ0JBU0VEX0NU
TFMyLCAmbWlzbWF0Y2gpOw0KPj4+Pj4gICAgICAgIH0NCj4+Pj4+ICAgIA0KPj4+Pj4gKyAgICAv
KiBDaGVjayB3aGV0aGVyIGhhcmR3YXJlIHN1cHBvcnRzIGFjY2VsZXJhdGVkIHhhcGljIGFuZCB4
MmFwaWMuICovDQo+Pj4+PiArICAgIGlmICggYnNwICkNCj4+Pj4+ICsgICAgew0KPj4+Pj4gKyAg
ICAgICAgYXNzaXN0ZWRfeGFwaWNfYXZhaWxhYmxlID0gY3B1X2hhc192bXhfdmlydHVhbGl6ZV9h
cGljX2FjY2Vzc2VzOw0KPj4+Pj4gKyAgICAgICAgYXNzaXN0ZWRfeDJhcGljX2F2YWlsYWJsZSA9
IChjcHVfaGFzX3ZteF9hcGljX3JlZ192aXJ0IHx8DQo+Pj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNwdV9oYXNfdm14X3ZpcnR1YWxfaW50cl9kZWxpdmVyeSkgJiYN
Cj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjcHVfaGFzX3ZteF92
aXJ0dWFsaXplX3gyYXBpY19tb2RlOw0KPj4+Pg0KPj4+PiBJJ3ZlIGJlZW4gdGhpbmsgYWJvdXQg
dGhpcywgYW5kIGl0IHNlZW1zIGtpbmQgb2YgYXN5bW1ldHJpYyB0aGF0IGZvcg0KPj4+PiB4QVBJ
QyBtb2RlIHdlIHJlcG9ydCBodyBhc3Npc3RlZCBzdXBwb3J0IG9ubHkgd2l0aA0KPj4+PiB2aXJ0
dWFsaXplX2FwaWNfYWNjZXNzZXMgYXZhaWxhYmxlLCB3aGlsZSBmb3IgeDJBUElDIHdlIHJlcXVp
cmUNCj4+Pj4gdmlydHVhbGl6ZV94MmFwaWNfbW9kZSBwbHVzIGVpdGhlciBhcGljX3JlZ192aXJ0
IG9yDQo+Pj4+IHZpcnR1YWxfaW50cl9kZWxpdmVyeS4NCj4+Pj4NCj4+Pj4gSSB0aGluayB3ZSBs
aWtlbHkgbmVlZCB0byBiZSBtb3JlIGNvbnNpc3RlbnQgaGVyZSwgYW5kIHJlcG9ydCBodw0KPj4+
PiBhc3Npc3RlZCB4MkFQSUMgc3VwcG9ydCBhcyBsb25nIGFzIHZpcnR1YWxpemVfeDJhcGljX21v
ZGUgaXMNCj4+Pj4gYXZhaWxhYmxlLg0KPj4+Pg0KPj4+PiBUaGlzIHdpbGwgbGlrZWx5IGhhdmUg
c29tZSBlZmZlY3Qgb24gcGF0Y2ggMiBhbHNvLCBhcyB5b3Ugd2lsbCBoYXZlIHRvDQo+Pj4+IGFk
anVzdCB2bXhfdmxhcGljX21zcl9jaGFuZ2VkLg0KPj4+Pg0KPj4+PiBUaGFua3MsIFJvZ2VyLg0K
Pj4+DQo+Pj4gQW55IG90aGVyIHRob3VnaHRzIG9uIHRoaXM/IEFzIG9uIG9uZSBoYW5kIGl0IGlz
IGFzeW1tZXRyaWMgYnV0IGFsc28NCj4+PiB0aGVyZSBpc24ndCBtdWNoIGFzc2lzdGFuY2Ugd2l0
aCBvbmx5IHZpcnR1YWxpemVfeDJhcGljX21vZGUgc2V0IGFzLCBpbg0KPj4+IHRoaXMgY2FzZSwg
YSBWTSBleGl0IHdpbGwgYmUgYXZvaWRlZCBvbmx5IHdoZW4gdHJ5aW5nIHRvIGFjY2VzcyB0aGUg
VFBSDQo+Pj4gcmVnaXN0ZXIuDQo+Pg0KPj4gSSd2ZSBiZWVuIHRoaW5raW5nIGFib3V0IHRoaXMs
IGFuZCByZXBvcnRpbmcgaGFyZHdhcmUgYXNzaXN0ZWQNCj4+IHh7Mn1BUElDIHZpcnR1YWxpemF0
aW9uIHdpdGgganVzdA0KPj4gU0VDT05EQVJZX0VYRUNfVklSVFVBTElaRV9BUElDX0FDQ0VTU0VT
IG9yDQo+PiBTRUNPTkRBUllfRVhFQ19WSVJUVUFMSVpFX1gyQVBJQ19NT0RFIGRvZXNuJ3Qgc2Vl
bSB2ZXJ5IGhlbHBmdWwuIFdoaWxlDQo+PiB0aG9zZSBwcm92aWRlIHNvbWUgYXNzaXN0YW5jZSB0
byB0aGUgVk1NIGluIG9yZGVyIHRvIGhhbmRsZSBBUElDDQo+PiBhY2Nlc3NlcywgaXQgd2lsbCBz
dGlsbCByZXF1aXJlIGEgdHJhcCBpbnRvIHRoZSBoeXBlcnZpc29yIHRvIGhhbmRsZQ0KPj4gbW9z
dCBvZiB0aGUgYWNjZXNzZXMuDQo+Pg0KPj4gU28gbWF5YmUgd2Ugc2hvdWxkIG9ubHkgcmVwb3J0
IGhhcmR3YXJlIGFzc2lzdGVkIHN1cHBvcnQgd2hlbiB0aGUNCj4+IG1lbnRpb25lZCBmZWF0dXJl
cyBhcmUgcHJlc2VudCB0b2dldGhlciB3aXRoDQo+PiBTRUNPTkRBUllfRVhFQ19BUElDX1JFR0lT
VEVSX1ZJUlQ/DQo+IA0KPiBOb3Qgc3VyZSAtICJzb21lIGFzc2lzdGFuY2UiIHNlZW1zIHN0aWxs
IGEgbGl0dGxlIGJldHRlciB0aGFuIG5vbmUgYXQgYWxsLg0KPiBXaGljaCByb3V0ZSB0byBnbyBk
ZXBlbmRzIG9uIHdoYXQgZXhhY3RseSB3ZSBpbnRlbmQgdGhlIGJpdCB0byBiZSB1c2VkIGZvci4N
Cj4gDQo+IEphbg0KPiANClRydWUuIEkgaW50ZW5kZWQgdGhpcyBiaXQgdG8gYmUgc3BlY2lmaWNh
bGx5IGZvciBlbmFibGluZyANCmFzc2lzdGVkX3h7Mn1hcGljLiBTbywgd291bGQgaXQgYmUgaW5j
b25zaXN0ZW50IHRvIHJlcG9ydCBoYXJkd2FyZSANCmFzc2lzdGFuY2Ugd2l0aCBqdXN0IFZJUlRV
QUxJWkVfQVBJQ19BQ0NFU1NFUyBvciBWSVJUVUFMSVpFX1gyQVBJQ19NT0RFIA0KYnV0IHN0aWxs
IGNsYWltIHRoYXQgeHsyfWFwaWMgaXMgdmlydHVhbGl6ZWQgaWYgbm8gTVNSIGFjY2Vzc2VzIGFy
ZSANCmludGVyY2VwdGVkIHdpdGggWEVOX0hWTV9DUFVJRF9YMkFQSUNfVklSVCAoaW4gdHJhcHMu
Yykgc28gdGhhdCwgYXMgeW91IA0Kc2F5LCB0aGUgZ3Vlc3QgZ2V0cyBhdCBsZWFzdCAic29tZSBh
c3Npc3RhbmNlIiBpbnN0ZWFkIG9mIG5vbmUgYnV0IHdlIA0Kc3RpbGwgY2xhaW0geHsyfWFwaWMg
dmlydHVhbGl6YXRpb24gd2hlbiBpdCBpcyBhY3R1YWxseSBjb21wbGV0ZT8gTWF5YmUgDQpJIGNv
dWxkIGFsc28gYWRkIGEgY29tbWVudCBhbGx1ZGluZyB0byB0aGlzIGluIHRoZSB4bCBkb2N1bWVu
dGF0aW9uLg0KDQpUaGFua3MsDQoNCkphbmUu

