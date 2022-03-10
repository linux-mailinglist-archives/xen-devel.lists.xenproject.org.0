Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D844D4573
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 12:15:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288295.488923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSGlE-0002En-I6; Thu, 10 Mar 2022 11:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288295.488923; Thu, 10 Mar 2022 11:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSGlE-0002Cw-En; Thu, 10 Mar 2022 11:15:12 +0000
Received: by outflank-mailman (input) for mailman id 288295;
 Thu, 10 Mar 2022 11:15:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XE96=TV=citrix.com=prvs=0613c794d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nSGlC-0002Cq-Q3
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 11:15:10 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57614daa-a063-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 12:15:08 +0100 (CET)
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
X-Inumbo-ID: 57614daa-a063-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646910908;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fsFn4/7HWRrmK2KntL6x1JsamB5cP/K2bXiZo2HDF8M=;
  b=DTO0NzmL06NdB9loAijUY7n9y8f8GfItUCEufbI9Fl5FsXQXGSMDGrBq
   jKMAufYO42dCaUIx+sqdA+sfz4S6Z749Hm9L9999uxIAARwk1tfI6MPav
   JCeh1RotR2u/gqysopZDzFk+/1Z/hOZWrl2WKP1e6mmMRSDTp3Y6vkxKH
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68258845
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:L0uDHahz0xLqjh1+rw2znzZ2X161pRAKZh0ujC45NGQN5FlHY01je
 htvUG+GOKvbYGP2eI9yPoqzo01UuJTdzoRrQAporCljFiob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFrV4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YSUxJe6SmPk5bytzH39uDJRGoOOfHWfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xN2o1MUSQP0An1lE/AbwnkMqZgnnGTxp+q220nJFnyUeN01kkuFTqGIWMIYHbLSlPpW6au
 2bH8mLREhwcctuFxlKt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ydGmjmauVtQZL
 FYbkgIsp6Uv8E2gTvHmQga15nWDu3Y0QMFMGuc37AWMzKv84AuDAGUACDlbZ7QbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8jyupenYVMEs+VwQIExs02tm7/NkPkUeaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2Gz1+MWQJuIhzkCOBz/+sFslDGKwT9HwsTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/bF8r1xBGFb5JOi8BQ2Swm8zbK7onhezP
 CfuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlPZrHw3PhXIgTCz+KTJrU3ZE
 c3LGSpLJSxGYZmLMRLsH7tNuVPV7nxWKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vfyDg5B
 +13bpPQoz0GCbWWSnCOreY7cABbRVBmVMueg5EGKYa+zv9ORThJ5wn5muh6JeSIXs19y4/1w
 51KchQBmQSl2iGfd1nih7IKQOqHYKuTZEkTZEQEFV2px2IiccCo6qIefIEwZr4p6Kpoyvscc
 hXPU5jo7ihnItgfxwkgUA==
IronPort-HdrOrdr: A9a23:5tixvax1M+ykJZ7VpBbQKrPxjOskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9IYgBdpTiBUJPwJU81bfZOkMcs1MSZLXbbUQyTXcBfBOrZsnLd8kjFl9K1up
 0QC5SWZOeAb2SSyPyKnTVQcOxQgOVvkprY/ts2pk0FJWoBBsEQjDuRSDzraHGeLDM2X6bRf6
 Dsgfav0gDQAEj/Gf7LYEXtMdKzwuHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX272oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkF2nAjv0idurD
 D/mWZmAy1B0QKWQohzm2q15+DU6kdr15Yl8y7BvZKsm72jeNtwMbs+uWsQSGqp16NnhqAg7E
 sD5RPri3IcZymw7BjV9pzGUQpnmVGzpmdnmekPj2ZHWY9bc7NJq5cDlXklWqvoMRiKoLzPKt
 MeR/00JcwmBm+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljNYnahNB6Vs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOUMOm7LqZTw/LIpjdvaNaAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTXTGC0TV3Wu4hjDlhCy8vBrZbQQFi+oQoV4rmdSt0kc7nmZ8
 o=
X-IronPort-AV: E=Sophos;i="5.90,170,1643691600"; 
   d="scan'208";a="68258845"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vz8Zg5epG2gvh2ILriouUC79vEJ/GjcLXRbH6e2NOKhxRFgRC50KueEJTOnXiWJrzkw3D6W0FEGLK7MtMJ7YyOCws1va2apN1qfd3VaICajcp8CWFV7BigjiRlU5Z8EcHRMUiZS0RpvEKSKVqworHMRBdVLSQ4bdOFXnq03JtudVHZdnV6UkJUWw2fiP3Xrrfr69S2xa5T5UqxDTAflnDn/Ce5A7qMNsqJsmUyxopaNbwbYib2EO0g8bYavQGtpMo1mwxHa+/RP525eG2vzl856Zw55xxVF8seIs88zDihZ6+6CsE2U/OkhiQRFm1IhoRzOztdyzr/5uQ+AKp+qKeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsFn4/7HWRrmK2KntL6x1JsamB5cP/K2bXiZo2HDF8M=;
 b=QjKwNy6IecsmzVq/di/eQm9NKgCoPgzdB5eLzzx2U3SIQnkXeyQHDzs2yev/uTJtZrS22+dXyx75pwc1GMGUTfxehVC4MiqZ6Y4jqsA6/gnCWTuzF136DKXZJUrZUpMWmb0axW0runMUPl7Ul058KfRhJubnilUkcR80G3i96bmEEvNvO50OIbKD2qzLZkB7jvt5PgkluOk2h/kGSxa6D3RtkBU8qdj9/WbWrmTzfjfqbYMISB/q4xg/TY3bmcL+OZB812EQJm1UGaHPQYTzVQCoZCrEOq3mARKnLlmuP6J+TDR/CEm0lGoJeZZW2+/1xUzk+/hTxRQw6ih8MDZO+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsFn4/7HWRrmK2KntL6x1JsamB5cP/K2bXiZo2HDF8M=;
 b=BtrmZ8+lN3JePspdcstRHpG2QEu8PjXPREtNNivGWRvP6PO7pHQa/DENwvfj+b4srUiP5wDQquA6LkE+QNAmy7yPVXqVDXTgwORHvDwskA/qy06dRD4mwfpigqsFaWTMdQzkRqNXZbydRj3hSVGpIWo3m8lPKx8FXTsMblbLW7E=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: preparations for 4.16.1
Thread-Topic: preparations for 4.16.1
Thread-Index: AQHYNF0BmGlme94kI0WXS90UZwN5Yqy4Uf8AgAAWHACAAARJAIAACu8A
Date: Thu, 10 Mar 2022 11:14:36 +0000
Message-ID: <08075ddf-fa90-dfaa-07df-0e256fee2c41@citrix.com>
References: <b9be95eb-7a6e-9f1b-6b68-6d08d6329cd1@suse.com>
 <6f8ccbb3-d384-bedd-8fb2-18aab570b588@suse.com>
 <41020867-eaa4-839c-3380-00bd91c5299b@citrix.com>
 <cab2a003-5112-42d0-3d2c-3758c895e52a@suse.com>
In-Reply-To: <cab2a003-5112-42d0-3d2c-3758c895e52a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6546057e-303b-4dd0-ce81-08da028729bd
x-ms-traffictypediagnostic: SN6PR03MB4240:EE_
x-microsoft-antispam-prvs: <SN6PR03MB4240B792F1CB4995FA33C724BA0B9@SN6PR03MB4240.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AS2ehc7R2LRi7sbJqXiRb2e95jilEK6nn3E2uBa16BslmWoTqFbp0x5vRZo3Q2M1HUHdLVqoWOUnb7IXb8Iss+ge+iaOyBl1VbBHzTfLnFrSL9NQ59fTFpbYhcifc8TYYsm/ckHCeWZzRvVKgQlP2elota5a3Ck02j/Vl2qwmpAksAGHtW4P8enBCI85nMKmlDXUyteYZRlN4mwW1stL/e9xZYvNcTCAfVQhE178j2bnsmHC4ae1G+AJeeP2epGr57l4bPfJWBeaGXHW9ZtKR29/r92iu6oyg2NSQ5RplSvTiWHQKGzjC+zm8kZcprnhIIpXj9uICWS+tKj1hF/D8VjsEFydMyu9fggSdVrvrjBj86oOXdHeInNAj+lU9SLnwGRk8J6SoVW7ClSF26Z5oumhSW//4oEwroXhv8ujZTQFkS575oh+OXIW0WOAqxu/hzOFkTxHcZAdekvGwhFaVfPl6+BREkqQ8TdbDubv/NJJB5bfavBfVNifELmMaxmJUo3WwkEDEPw431oGBGz5KOmjFK49cZ9pd+WMwbFomR0TWItOLbyRdfoVsl9l/P2OMgSZSsrsKGTDVvzNnKtRmXmoUme5yAjkeWf4b1RCjMC30d5BxcHLd4nwiM9+nUSf2KRyFVlNZret0Er537yNqF0gJgvz6Anf/D1AQwa0zQsB8L7lcHVSR9wRzL7pjgjiTArQ7Vxixw9TLYSBucHcVXJ8lqr/AEccHH2zfDMemQePV7XBdihDYgc5evgYGQPvOHwgeqi9/GHwIvR7VWrPAg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(38070700005)(53546011)(5660300002)(71200400001)(6486002)(186003)(2906002)(2616005)(31696002)(26005)(31686004)(6512007)(6506007)(86362001)(4326008)(82960400001)(508600001)(66556008)(64756008)(66446008)(66476007)(66946007)(91956017)(8936002)(76116006)(38100700002)(54906003)(8676002)(122000001)(7116003)(6916009)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUJsZ1dvMmZJcHdrNTNnZFo2b3VXSExyeXdnaWYzejRYdDdYWmtyWmJvaHhv?=
 =?utf-8?B?SmgxaVByUVlMK3FGM2YzTGNiSm9YQ1grbENqcDBRZk9mZE55WGdaSVNLMnBI?=
 =?utf-8?B?OS8vYkE4b3g0bXNINVNwUHFtZ3RVRUxtQUNaL2lYejlFSnA2Tk41K2JHSFJE?=
 =?utf-8?B?aEE2b3FXcWd1Uy9Ib0YyZVBidU5KVE9BTFRrTCtySG5wU2p6ck5jV3VobUJp?=
 =?utf-8?B?U1V6SFZvSEFyYmFJUFplSGdrQ2VmYVRGcU5RbzlqVm9MRllUME5VN1FMRFBJ?=
 =?utf-8?B?MExIazR3amJkeE4wa00yQlRGakl5YnN4VHRDNEFMZmxJSGM2ZnBSMFhpL01i?=
 =?utf-8?B?aE56YldVRHp0blJuSmp3YThiUzArdm05ZkRhYWcrQ0piT0FLQVh3a0tpZ1Bl?=
 =?utf-8?B?eDB5NXVJNU9BRFVHUjRZczRCemhhUTc1djRoWDdUWllPN0pCRWphM09jYm5j?=
 =?utf-8?B?UHRya2pIWERYaXV3bEFld1JGTEJmS0lWQVd3L3g4Sm9IdXg2UVE4N0hlcnNP?=
 =?utf-8?B?RzB2T1RvWk5GUm5XbU5XMnh5aGV2WUx3Q1NKNWx3Q05VT2RUdU1xU2JIM0NU?=
 =?utf-8?B?NEsrcW9PM1VFa1ZTU0xuTjZoL0hpVWpuWUxEYzlHc3FrWFJyZENrU1l2cHcx?=
 =?utf-8?B?OTZhWXpweHZnVHp5bFhDblNlK2NsZmJxTkExL1lLZ0xrUVh2WEE3dmR6Tllh?=
 =?utf-8?B?a3BORTFFMkJzQUd6ak10NUlGZ0xTNlpaWkkwb2dCRmdYcjl5REZpbnVQak1a?=
 =?utf-8?B?cHNHTnI5dmRqUks5L2l2cVJVM3JNbDFKYzY0aks3Q2l5RU4yMUF0NzBvWkpT?=
 =?utf-8?B?R3RWRFYyWlExWFlYcEw5WjR0ZUNsNTNzTmt4bEJLdFBYbUQ3NjArZ1BHVXRt?=
 =?utf-8?B?VW9NaWdpSHdaQnkydGRzNXlWcmU3Q3pQV29PT2FKYzZPaWs3UTVMazRpalor?=
 =?utf-8?B?TG1XampRczl1RVhrTG03blBvSXg1cnY2ZUpFTkkvS3EyMnJveUlOSkJWM3Qz?=
 =?utf-8?B?T1Y4YXZQUGdkTDhTUTc0Nk9sQ3NVb214NGRxaHdid3ZPaDBETTJvemtVMFhu?=
 =?utf-8?B?Q1dKRVFKSW54SU82dVlCcy8vdWEyLzhaOXFpY2xQdlhkczhlcGxlSjRoQU80?=
 =?utf-8?B?OTBIN1I5NWFGK29JbEtjVFErYjdXME5ETjhkUGxhZkdZU2p1RU1OeGF5Yjd3?=
 =?utf-8?B?N2Z6Z0xpVnpJNEhxYVFicURSdTZLei92TjdnYUpFY0ZrQjlEQmJwbW1vSlJT?=
 =?utf-8?B?dDhXS0ZFNTRwOXAxTkRjSlZuSVFvLzhFK3lqQkgzUFRzR2NhM2JhaktJQjls?=
 =?utf-8?B?dTA3YmppOVAyUkowdGltcWY3RmlyN25UWXFMRVllei9mWUh3UzZrNm5ZOTBQ?=
 =?utf-8?B?VWZ6ZmV3czFLUTRmTGQ0UUQzSGNqS2JuZWtHREt0MHhmcWRXKytnTkFhdko1?=
 =?utf-8?B?OEE4NzN6eGR1UlQxNXduQm5pSFRBbEZncjBSZnBQRVFROUU1alZQNU52THVK?=
 =?utf-8?B?RlliYlZPa0pJYklLbm02ZDlCV2NKTncybzdzcTdjcDQvTnpZbmR4ZnI1R2dW?=
 =?utf-8?B?RWYxWUtUTGxlWnBzbi9pWXIwL01LSDZoVWs5aUFBVFJNM1Z0TnJYZmdrRHRZ?=
 =?utf-8?B?aGx5VWFIN0hGelNoc2VJdmk4TWZKRlNCMTBaQ0dZVVc1RFNVOUZGaTNlRjhp?=
 =?utf-8?B?cnpnd3VRYjB5WDhqT0NhRnRqN0FjdmdwMnlVQjBIZHNWN09BU0pDYnhMZmpv?=
 =?utf-8?B?YkFmM3ZzSFlEc202QkhicFpJeXpKaXVJZDhTRXhrNjFaZlVaMlNlNzk1R2tN?=
 =?utf-8?B?cG5BdmhoZDA0QlRFN3BReGMwVW1lU0UvN2RGY2JMN0VsYXYyWXA1ZDFraFhT?=
 =?utf-8?B?bjh4Q2hRb3RFL0piVzRuQWZPcXpTZmJyaXZZZjNuYzdCODBYKzdCOHh4S01B?=
 =?utf-8?B?ZUxXOWZ3b2VkRkFFV1hNSy9Ca2JvbUZFbjU3UTRnaFlUZ2FOZ3kwb0NET3Jx?=
 =?utf-8?B?L0syOTYrN0l2dit4cHdacnAxdlVzM2poeVIyMXZQeFppeXZ6NlZJRnZlN2Nw?=
 =?utf-8?B?YzBqK1hONUlSWHA4aG5hcG5WTmFlQ0k2Y1g0VHMvdmJocTRHaDMxVFNoY1BX?=
 =?utf-8?B?UW4xdzB4M3FtVUI5d0EzM05Fb3FBajNDTmlxUVVwODVEZk5oeEV4ZWM4WDEz?=
 =?utf-8?B?Sm1KV3FnU0p2ekRDdmN0eFJMODJBeFB4YVJOdGl4bjZwbzNkbE5Eb0h5UEIz?=
 =?utf-8?B?SkpGL2xjNXArUUZmeHFOVkRuNTZnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <32EE9F53CFEC12409CA397F34122035E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6546057e-303b-4dd0-ce81-08da028729bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 11:14:36.9554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JJZ1RFbYX083I+bLcW9vtNQcVQK66TBsYR/X1kWOOky5YDDrB5t+5Z+nDAUlfl/gJXOFb2xby+2M1juUlBOZc0jrfP016RfsYmVHrcoU818=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4240
X-OriginatorOrg: citrix.com

T24gMTAvMDMvMjAyMiAxMDozNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEwLjAzLjIwMjIg
MTE6MjAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxMC8wMy8yMDIyIDA5OjAxLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAxMC4wMy4yMDIyIDA5OjU3LCBKYW4gQmV1bGljaCB3cm90
ZToNCj4+Pj4gUGxlYXNlIHBvaW50IG91dCBiYWNrcG9ydHMgeW91IGZpbmQgbWlzc2luZyBmcm9t
IHRoZSByZXNwZWN0aXZlIHN0YWdpbmcNCj4+Pj4gYnJhbmNoLCBidXQgd2hpY2ggeW91IGNvbnNp
ZGVyIHJlbGV2YW50LiBPbmUgSSBoYXZlIHF1ZXVlZCBhbHJlYWR5LCBidXQNCj4+Pj4gd2hpY2gg
SSdkIGxpa2UgdG8gcHV0IGluIG9ubHkgb25jZSB0aGUgcGVuZGluZyBmaXggdG8gaXQgKCJ4ODY6
IGF2b2lkDQo+Pj4+IFNPUlRfQllfSU5JVF9QUklPUklUWSB3aXRoIG9sZCBHTlUgbGQiKSBoYXMg
YWxzbyBsYW5kZWQgaW4gc3RhZ2luZywgaXMNCj4+Pj4NCj4+Pj4gNGI3ZmQ4MTUzZGRmIHg4Njog
Zm9sZCBzZWN0aW9ucyBpbiBmaW5hbCBiaW5hcmllcw0KPj4+IEFjdHVhbGx5IHRoZSBvdGhlciBv
bmUgSSdtIGF3YXJlIG9mIGlzDQo+Pj4NCj4+PiA3ZDk1ODkyMzllYzAgeDg2L0NFVDogRml4IFMz
IHJlc3VtZSB3aXRoIHNoYWRvdyBzdGFja3MgYWN0aXZlDQo+Pj4NCj4+PiB3aGljaCBBbmRyZXcg
cHJvbWlzZWQgdG8gcHJvdmlkZSBhIHN1aXRhYmxlIGJhY2twb3J0IGZvci4NCj4+IFNvIG5vdyBY
U0EtMzk4IGlzIHB1YmxpYywgSSBjYW4gc2F5IHdoYXQgdGhhdCBzbGlnaHRseSBjcnlwdGljYWxs
eSBtZWFudC4NCj4+DQo+PiBUaGUgQ0VUIFMzIGZpeCBkZXBlbmRzIG9uIG9uZSBvZiB0aGUgY29k
ZSByZWFycmFuZ2VtZW50cyBpbnRyb2R1Y2VkIGluDQo+PiB0aGUgQ0VULUlCVCB3b3JrLsKgIFdl
IHdlcmUgaW50ZW5kaW5nIHRvIGhhdmUgQ0VULUlCVCBiYWNrcG9ydGVkIGZvciB0aGUNCj4+IHR1
ZXNkYXkgZW1iYXJnbyAoZGlkbid0IGdvIHRvIHBsYW4pLCBhZnRlciB3aGljaCB0aGUgUzMgZml4
IHdvdWxkIGJlIGENCj4+IHRyaXZpYWwgYmFja3BvcnQgdG8gNC4xNCBhbmQgbGF0ZXIuDQo+IEkg
d2FzIGluZGVlZCB3b25kZXJpbmcuIEV2ZW4gaWYgdGhpcyBkaWRuJ3Qgd29yayBvdXQgaW4gdGlt
ZSwgYWl1aSB0aGUNCj4gcGxhbiBzdGlsbCBpcyB0byBoYXZlIHRoYXQgYmFja3BvcnRlZCAod2l0
aG91dCBnb2luZyB0aGUgbWFudWFsIGFubm90YXRpb24NCj4gcm91dGUpLiBEbyB5b3UgZXhwZWN0
IHRoaXMgdG8gYmUgZmVhc2libGUgaW4gdGltZSAoYW5kIG5vdCBhdCB0aGUgbGFzdA0KPiBtaW51
dGUpIGZvciA0LjE2LjE/DQoNClRoZSBhbnN3ZXIgaXMgbGFyZ2VseSBkZXBlbmRlbnQgb24gaG93
IGxvbmcgaXQgdGFrZXMgdG8gcmVzb2x2ZSB0aGUNCnJlbWFpbmluZyBpc3N1ZXMgb24gc3RhZ2lu
ZyAoYWx0aG91Z2ggbW9zdCBhcmUgZG9uZSBub3cuwqAgSSdtIHNpZnRpbmcNCnRocm91Z2ggdGhp
bmdzIGZvciBhIGNvbW1pdCBzd2VlcCkuDQoNCkVhcmx5IG5leHQgd2VlaywgYXNzdW1pbmcgbm8g
YWRkaXRpb25hbCBmdW4gaXMgZm91bmQ/DQoNCn5BbmRyZXcNCg==

