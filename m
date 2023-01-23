Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA19677AE3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 13:25:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482814.748529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJvt2-0002WB-26; Mon, 23 Jan 2023 12:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482814.748529; Mon, 23 Jan 2023 12:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJvt1-0002Tm-VK; Mon, 23 Jan 2023 12:25:19 +0000
Received: by outflank-mailman (input) for mailman id 482814;
 Mon, 23 Jan 2023 12:25:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTo8=5U=citrix.com=prvs=380e0b34c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pJvsz-0002Tg-Vh
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 12:25:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc649b21-9b18-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 13:25:15 +0100 (CET)
Received: from mail-bn8nam04lp2042.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jan 2023 07:25:11 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5771.namprd03.prod.outlook.com (2603:10b6:806:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 12:25:09 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 12:25:09 +0000
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
X-Inumbo-ID: fc649b21-9b18-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674476714;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tc1YmgXbYpKbeyJj17ADgPXtFAEmUBock6Dh2MfcGqg=;
  b=IgwtgrCjJ2QGULyhfG1XkT+7dwWlMGxhBDin1VhFC00MKt1UgHLkQiZR
   CFqciJGjmVVNsqgSCkQ8VZFDF/qH/fniemabKfKjOpA9fEfA2LonZUEQh
   ND3EC2kLpVs/RnE7LBIytP2SBWzhpMnRTE7rwoMkO3omULFrF2FQSIIEb
   Q=;
X-IronPort-RemoteIP: 104.47.74.42
X-IronPort-MID: 94222697
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wSk+qqvxP/Hvcbq6Krg0pNGwiOfnVOVfMUV32f8akzHdYApBsoF/q
 tZmKTqGMv+DZWvzeIt/admz8EhTsZDWx4QxTFY6rnszFSkR+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AaEzCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBm01VVeIgbqK+vG0dbBUppgNB+uyI9ZK0p1g5Wmx4fcOZ7nmG/mPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0oujP6xarI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6ReHirKQ00QL7Kmo7GhAtTFqjh/+FoG2UVtd0C
 mMvyy5/sv1nnKCsZpynN/Gim1aDuhMfQNtRVe4n8gaGyqnTywmcD2kACDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65vX6GDj2x
 y2BpQAkhqsUls8N3OOw+lWvqzirrJLYQxU14gjSV2SN4QZwZYrjbIutgXDS6fdbMI+YVB+Pp
 nECkMmFxP8CBteGkynlaO4KGreu5fqMLjzHqVFqFpglsT+q/haLd4da6iA4KVxpNssBcDnBb
 0rauAcX75hWVEZGdodyaoO1Ts4sna7pEIy5UuiONoYUJJ9saAWA4SdiI1aK2Hzgm1Qtlqd5P
 oqHdcGrDjARDqEPICeKetrxGIQDnkgWrV4/j7iip/h7+dJyvEKodIo=
IronPort-HdrOrdr: A9a23:Jzad5KwXU3PjvC8DeRE3KrPw671zdoMgy1knxilNoRw8SL3/qy
 nOppQmPHrP4wr5N0tApTntAtjkfZq+z+8N3WByB8bbYOCOggLBQ+9fBOPZskbd8kbFh4pgPM
 lbAs9DIey1IGJWyeDdy2CDf+rIxuPszImYwd3z9TNGayZES49d1C9FKiC9VndbeWB9dPkEPa
 vZ6cpDqyChangMB/7XOlAOQ/LfodnGj7LKCCR2ZSIa1A==
X-IronPort-AV: E=Sophos;i="5.97,239,1669093200"; 
   d="scan'208";a="94222697"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSTyCrUK8CPHIAF4XFlOV9N+spO7Cfr9rk+fAnqxzMfDJrA1ytp3RNmaq3ljzJFUiEigdk4MWKk/cV0qbVZvpqmSXAmK3Aok0W0DBy9PV9mCcQnEPd2WhczFMGgqii51rRiA06w/eDihYJo2GMew6pfvsNcZhC4iTZxELeT2iynXfINqgwi/zP20pbHdz67Dil2QZMl3ZClCjMvG99Yhrp8i1F2U3uq+k9Buz/iIKf2FIU2rZVWJN0e/AYLTsQZSrzyIJdopHs0EGCcN1U05ohstMqvAvgry+VTs7FbslVGCoDJrSVM13iahFyRPrbg9NGclkApL8OBC+tZ3ZeIEbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tc1YmgXbYpKbeyJj17ADgPXtFAEmUBock6Dh2MfcGqg=;
 b=AzFaSAcntHrGq0b71rie+eq+vXaXQ3wUz6OAGUWG2X6DS12SAuSQxHReystPzn14y6fhmNjxz+9i1k3CNuuUbKsodMxEdf+CGePRdqRmjxS06StAAf+WpNrQyYiPDmT3b4l2iIJK4iZPBazwyX33DInMz2OBbFGlZGLFnT/dM4b6jUQAhhzkfq4vP3XPschXAA4545bkSiIgV+nzNuh8EdbAMZ9qLoGm2CtMKQDSTkDMKrvZriE0Hz5dOWXynX+4QdDEESn4g16ifqnNNe9eQIyEd0NK6Dik/EitlopqPhxuk4dDUt6HvK2W9CDMQb+x3MEcb/I6c5kBB2CW7oZxPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tc1YmgXbYpKbeyJj17ADgPXtFAEmUBock6Dh2MfcGqg=;
 b=Slf3A9so/C/DeS1VAr6fw2qjdjGy6n8E4ZGx/prO0KV26TOW7NWj7WwypgRJpCeVn8Giu3YjkaQgYHPlOrds+cG1lKXfBiKUfZhTjUsJUklxt2XLmrVbuEse+dqpzqk3ilqowRQyFsBf62Zua6vf1oGyrJUDWGUBTjNVaYE1vDo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii <oleksii.kurochko@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
	Bobby Eshleman <bobby.eshleman@gmail.com>
Subject: Re: [PATCH v1 06/14] xen/riscv: introduce exception context
Thread-Topic: [PATCH v1 06/14] xen/riscv: introduce exception context
Thread-Index: AQHZLOAEizmhskK0b0Wez8lGfG74vK6ndUcAgAR2eoCAAAX1gA==
Date: Mon, 23 Jan 2023 12:25:09 +0000
Message-ID: <94e29752-ee20-2268-7701-9976c93c2882@citrix.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <00ecc26833738377003ad21603c198ae4278cfd3.1674226563.git.oleksii.kurochko@gmail.com>
 <fd276566-6b7d-ea64-a90a-a0c198ccf36c@citrix.com>
 <bb6b85f147d5d7933532fb27f78fa93ce6209b22.camel@gmail.com>
In-Reply-To: <bb6b85f147d5d7933532fb27f78fa93ce6209b22.camel@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA2PR03MB5771:EE_
x-ms-office365-filtering-correlation-id: aba698d6-e654-4fa6-01eb-08dafd3cde3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ASUpxq9HnHKsnh4dq41hPgPwLFzWoufIlbh0AB23dZLDeJAfiOaDOa/9XeTkm43fc08v9HTUoZFDitmHzWKCXPo7GBNw9IN6rhgtb07goZA6jHqYOegoZljlXaLfQPqi6SOVhalQPsG+0E17UaZ9vn4aUN3/8CcJBGkgJNkJOJj1jTpCbUI3nJYVdZiCH6n8WNwYom1bUQr0ncbSFHpJCGKOUO5QCCJ5P1Bg6DoRXZKzbNpGV4lMOp/K5bdbcHYIzd4HaSiI+MbILvHaA4hVsjn+ck2Vt5CrCuj6QVW92KvCdq+Egv2xI8JstwwK1WgjYS9mf7ussVRPhYP5Un4rqjzdg1hXXapoqndPfvwISRL1+bGH7ukqjZXwCdt2qKcNCr1mGWVZgmladVVLywUjrg3vyeHlMwMVLpZ+qqg66S59ba0A9PwZSTLZEczcjlBq/cEYhNffQgQphq4+Z2bVavAEXdwrPj/oVEAmLYwLSZz9w3JiEJQ6jf5n0zMBtL6QX0SQ7xicqjW8N1v/QTrwi9f6sHIJ4MyCbcIy94hG6o1yGCoq8gge1EYbom+7ElxfBuXz3dXB/KsK6xMYBpBYYEDWEC0sg8tBku3Mk6nJtyLAyS2l56foXPIkr5POIjqiRhBuNcEWvk8/W3V7I14tp9NK0g4XF9Yog/hUz+ns2waCkvF6wtPq0kBvEeq00YU+ov5EkvkTzL6qzWfWIgendEsOu4qx7KDqRQL33XWuLqImo6HsiOoYaU8JfMPrx6qBc1jkCGdqU65MysBFeYmfGQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199015)(38100700002)(122000001)(38070700005)(82960400001)(5660300002)(31696002)(86362001)(2906002)(4744005)(41300700001)(4326008)(8936002)(6512007)(186003)(6506007)(8676002)(53546011)(26005)(316002)(66946007)(2616005)(76116006)(54906003)(66556008)(66476007)(66446008)(64756008)(110136005)(91956017)(6486002)(478600001)(71200400001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V2JvYUgrS3kwWmFqeGx5SEdaS0xpTlViR0g5TXYxYlVTY2xZbGdCTUpFc0lF?=
 =?utf-8?B?Q0g4ZU9QUGdpeE5nWVdCcDhVUGxOUDJLSWlsK3IxemV3SGhmLzBQSU5BQkVh?=
 =?utf-8?B?S1pGM2pkNVErL3hGUVJMclZ3ZzNkUzV3b2FlMlRWRzhoT3hiUkFIOG80TkpL?=
 =?utf-8?B?ZzQ4SlliWEdTNTZxMTE5TWRqdDNILzNJNHhBS2x4aWlua3dUUXVqWFI2OFcr?=
 =?utf-8?B?MEZkY01sTEh5ZlpCUU1CY1hXeVZ2aUxrdC85eWJ4SVZUeE1COCtQOWF6TmVa?=
 =?utf-8?B?eFh0Q1RraGdaMGdvcDdZVG5xN0R0dldWSURDRkNBSzRvTTdlcmVtVndPbmNX?=
 =?utf-8?B?L2JOaVczM0pSRWdYUmZDeUkwNTU3blZkYmRNRXJ2OFRMT1Uzblo4MTRZWkR5?=
 =?utf-8?B?d2M5bXZmMFRwM1hwcC9uRFRhUHNQSDEyVThXWFVHQ0doUUNrQ0g4bHhKeUZT?=
 =?utf-8?B?R3A1REJxNm1uZHhoMUVkVk9EVkNybUpHbU5aT3cyTHZJWDcyL05Wb1huOGRV?=
 =?utf-8?B?SlFwQzFLczJ3cllPSnFiaEJsV252eG81QXZIT3ErTE5lYk92eTd2cnY0dWJJ?=
 =?utf-8?B?VEpMdGE0VDhwcXlxaFBYTDZCM3YrT2M2NlVNdlZDR3Jvc0Q2U3dNSk10SW9X?=
 =?utf-8?B?NG9Ka1dPNGFJUEVGOGxUbjREak5Lc0cvUmJ5YW9vY1lLOEZCUzBCNTRIWXZk?=
 =?utf-8?B?dzBsaVpCazR6clIrcE5mZjJCUEpYZ1lwMk1IK1huN0dJRU9KK2ZyUTFVbUti?=
 =?utf-8?B?N1ZsSzlnSlFTR3ZJeTZyZ0xqL0I0SFJhOFdkd2xrcE1UVEZJKzlVUVZ1b1py?=
 =?utf-8?B?WjRLWExTM2h5cTIrOFlwYTNnVzRaM2ZUZyt4cFUrbkY5SFhkVktkcy8ybE94?=
 =?utf-8?B?K3hSRkoxckp1TFFOMzJQcTlKWjh3SEJIcnQ0YUlTYzhWOXBDSzN4eW5YN0pk?=
 =?utf-8?B?N0RTUkExNFY4TTdTQnpDcVdXOHEzV001T2NrbWd1b1V1OXRIR1R2M08xYTN4?=
 =?utf-8?B?emNkZlhNVVhqQ2xna0taUGJUK0FmN0hCM3VqTVZiMkVqNHA0U3plOXM1RUZr?=
 =?utf-8?B?QW1zT3A0R1VuVFo5RVFOSXZBc1haVXowQVNWZUtZekQ2QWVocHFXR25qREhD?=
 =?utf-8?B?VXJ6N2JWSWtIUG9PVUhhKzE1VFBsbzRIVmlGSkpsc3JtVWg5YmhCRmgrUG5N?=
 =?utf-8?B?ZWltYUYwUHhIMW9XV1hxYkU0cExNemdSTjdFWGV4dC8yMzQ4SjcvVnJMRjNl?=
 =?utf-8?B?ZndqYjBIUDloL2NhYUY3NFJBblhJcGkxWWlhbEN6SzZQVHphdUM3UHY2OVBm?=
 =?utf-8?B?L0hHeHlDK2NablZJV0FEMDNMSDMzR1krb29KK3FBUTBVNGFxcjhKN1RDODYy?=
 =?utf-8?B?MjZhM0YwaVNLaDBkeklpT0V6SkpvZm5NenU5cXNkVEExZUY2dzRTenJaUWJM?=
 =?utf-8?B?TDF4TUZkeGFRU3hpTitXNWhUbHZlWi9aREFzeFBFYVV2VC9Ud2UyYjZhcWFL?=
 =?utf-8?B?dFV5N0VMdVdldEpHdloxZXprNjNqeFlEWFVmSzUyNDJsK00yQnZ4SVNRcUE4?=
 =?utf-8?B?OHJ3M1FoNGpvMGVwRmJ2NDgxa2hqUTNObGE0SkdIeElVRU8zTk5lV2xKK3lQ?=
 =?utf-8?B?a2VmTW15TkZXa0NQSUVLNWsxU0xZRFJwNVNSY3NrRjB6ODBNKzA4cGtuWGFY?=
 =?utf-8?B?Q0dsNmc2c1Jub0lCbHVnazZwNGpXcGJXS3hhVVVkMTFoc2kwenc5T1QzK2h5?=
 =?utf-8?B?TnBKQmFUQ3F1V0lMZjdCK09vMDZGcktFc05lUVQvZ201WUFqS3M2U0hkY05t?=
 =?utf-8?B?bk9Eb29DWUtlMlEyd01aSEF3M2J0QVBqK0RMSHp3Uk1yUWJhVGNML3VUOVh4?=
 =?utf-8?B?U1FrbG5Qd21NQjFOVTBtRWRHY0dGZkN1WGpLcTJVdzZ6RjNDL2xxMjFqMjFW?=
 =?utf-8?B?ay8vTWZYdi9aM2l3YWxwLzdoR1MxWlpWZ25vN1EyOW5RcG5neGJiQnZjL0VQ?=
 =?utf-8?B?ZUZjRGxFRUFieGFpWFJGMHJjc3p3ZUtybEhOR0ZhVzlWWGxIK0IydHBTa2Ft?=
 =?utf-8?B?S09Ub05SWE5uRDVqa2ZIbU1nVDNua3VvREpBcDBKLzF2LzJNYm03QXh0a3Fx?=
 =?utf-8?Q?hLnJ+AU5rPQWvbflZSezcelc5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B45BF90510D5D64593EFE42C19AAC0B9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KyZU3LW1BC2rNEw7unru2e0cCOb/cVyuFIFqUY6ilzI1dvqDcF5a3CizqD+uz+EoXbPZKjNvflZ8zu32waqpers97DcMKABF+mYVU5/ajpM3qSBd4ORUAWFb9+1YUryY7vswmJjR5RGayqoltvDoiZ2cExoNQrbYHruWRGw2S8vOdKxa6cXdyIQ6kpXmFGUmalrPqb3abEAHXnQO45CYYX4qGf1eVqFDz8MV/5+nW2QIUkn4drmQRYibGQZ2FLe0tz7QScVYnapkvCWxPiMaSjBkTk0k1OMRztADqjqRVsFNf39GhPRPM+OXLcQwcYCoQ4NRs/PgUQB9JZuHw7HhSeHbjxqSmbP05AVGV606hF3OvwH4j4LL/nDe6YqzBeA3XRhWcU+PTCVwlR1hczpSmqH2YNLCXnOcmmtCx/I6x3R1QuOn9VyrxNCQC6CwjCdwbiqUc4/oOGX89kABf9Scdko0M0t2A5+/sF4tKbz5aYX3SLXXZi7/4zImXgSOU9m/GlPNaoaeOiQLKx91wfBF4eTX2cVddLHVYMp36sdfrDOHSmOSWB2odsoMzCivAUserW3AMsCBpqXqwMQAmnk2kr7f0nyqbm3TnqT2P1MhNZgHM57hpPsisnW4hCQmCEtdzWUvLwTAYkb+yM2ZtQT8lNnwEn9rZizH2k2LRhq2JlTY66EkFe/fKFjeT259OSuM/xIqmUbA+ucmcjQdnuL6YArmk6ofTSHmVBHx1M6XZbSQssR2b0xWYqglc8E8uduq72t/KLTO8eGS81yvHYckNvV79dWN9DGO1onwWPBHONb33CCxB0RaVpLttNl/gByUKpY7xPraa1qxxyHGmQVZ/7mw+z2VakxwZu0pVeipFTuLxqoJXXBT2vYvk/GgMvsLPy1w8yGs7wSHGOzcChWJRQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aba698d6-e654-4fa6-01eb-08dafd3cde3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 12:25:09.4126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JhcD1CUJSF2bXVopSM7Vfh4XgHc3xcX5OFP6y8g4+HgCundfDhM2GkxUp5yIavoaBHpO4WOFV8W+V3HDkc53KQ3BMbQhvc5Q+BbkABrfbuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5771

T24gMjMvMDEvMjAyMyAxMjowMyBwbSwgT2xla3NpaSB3cm90ZToNCj4gT24gRnJpLCAyMDIzLTAx
LTIwIGF0IDE1OjU0ICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gT24gMjAvMDEvMjAy
MyAyOjU5IHBtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPj4+ICsNCj4+PiArI2RlZmluZSBS
SVNDVl9DUFVfVVNFUl9SRUdTX09GRlNFVCh4KcKgwqAgKChSSVNDVl9DUFVfVVNFUl9SRUdTXyMj
eCkNCj4+PiAqIF9fU0laRU9GX1BPSU5URVJfXykNCj4+PiArI2RlZmluZSBSSVNDVl9DUFVfVVNF
Ul9SRUdTX1NJWkXCoMKgwqDCoMKgwqDCoA0KPj4+IFJJU0NWX0NQVV9VU0VSX1JFR1NfT0ZGU0VU
KGxhc3QpDQo+Pj4gKw0KPj4+ICsjaWZuZGVmIF9fQVNTRU1CTFlfXw0KPj4+ICsNCj4+PiArLyog
T24gc3RhY2sgVkNQVSBzdGF0ZSAqLw0KPj4+ICtzdHJ1Y3QgY3B1X3VzZXJfcmVncw0KPj4+ICt7
DQo+Pj4gK8KgwqDCoCByZWdpc3Rlcl90IHplcm87DQo+PiB1bnNpZ25lZCBsb25nLg0KPiBXaHkg
aXMgaXQgYmV0dGVyIHRvIGRlZmluZSB0aGVtIGFzIFx1bnNpZ25lZCBsb25nJyBpbnN0ZWFkIG9m
DQo+IHJlZ2lzdGVyX3Q/DQoNCkJlY2F1c2UgdGhlcmUgaXMgYSBtYXRlcmlhbCBjb3N0IHRvIGRl
bGliZXJhdGVseSBoaWRpbmcgdGhlIHR5cGUsIGluDQp0ZXJtcyBvZiBjb2RlIGNsYXJpdHkgYW5k
IGxlZ2liaWxpdHkuDQoNClRoaW5ncyBsaWtlIHJlZ2lzdGVyX3QgYW5kIHZhZGRyX3QgYXJlIG5v
bnNlbnNlIGluIGEgUE9TSVgteSBidWlsZA0KZW52aXJvbm1lbnQgd2hlcmUgdGhlc2UgdGhpbmdz
IGFyZSBzcGVsbGVkICJ1bnNpZ25lZCBsb25nIiwgbm90IHRvDQptZW50aW9uIHRoYXQgdGhlIGFz
c29jaWF0ZWQgaW5mcmFzdHJ1Y3R1cmUgaXMgbG9uZ2VyIHRoYW4gdGhlDQpub24tb2JmdXNjYXRl
ZCBmb3JtLg0KDQp+QW5kcmV3DQo=

