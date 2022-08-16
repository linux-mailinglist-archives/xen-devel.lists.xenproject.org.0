Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E165957D0
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 12:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388198.624802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNtcO-0006Y5-A0; Tue, 16 Aug 2022 10:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388198.624802; Tue, 16 Aug 2022 10:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNtcO-0006Ve-77; Tue, 16 Aug 2022 10:16:16 +0000
Received: by outflank-mailman (input) for mailman id 388198;
 Tue, 16 Aug 2022 10:16:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q2cu=YU=citrix.com=prvs=2209968cd=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1oNtcM-0006VW-L1
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 10:16:14 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73a544c3-1d4c-11ed-9250-1f966e50362f;
 Tue, 16 Aug 2022 12:16:13 +0200 (CEST)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Aug 2022 06:16:04 -0400
Received: from DM5PR03MB3386.namprd03.prod.outlook.com (2603:10b6:4:46::36) by
 SA1PR03MB6388.namprd03.prod.outlook.com (2603:10b6:806:1c3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Tue, 16 Aug
 2022 10:16:02 +0000
Received: from DM5PR03MB3386.namprd03.prod.outlook.com
 ([fe80::81f3:95a3:4853:a11f]) by DM5PR03MB3386.namprd03.prod.outlook.com
 ([fe80::81f3:95a3:4853:a11f%7]) with mapi id 15.20.5504.028; Tue, 16 Aug 2022
 10:16:01 +0000
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
X-Inumbo-ID: 73a544c3-1d4c-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660644973;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EK2XNmUVALpfgvKkGoF4lSj8egYU2wJe1cZ+o5AYVLA=;
  b=fnWyNm4hnjILUgbPjuIJ2mTHUJn1V2wsMPGfI/0Jx49kUaJIeZ9Kkl/t
   WacVtncACWjUoEfWee7qBWuBizOzN5+m/X2w4yh8htt2ZcO7fiEVR6GSj
   1AbnIYnOnKf8fvg5q6lDVPCEmQTu7q+C8NO+V3A45mClabOeiuKHjTttO
   E=;
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 80736191
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZhHj9KN88vgKWGDvrR1jlsFynXyQoLVcMsEvi/4bfWQNrUorhWRTy
 TQZXj+EPa7ZZjP1eopwaoy+9k4Cup6Ax4VnTQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMu/vd8EoHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFP87O1MIVkcY7YY+9R4LTANz
 uUpdRIkO0Xra+KemNpXS8FKr+F6dozHGd1avXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rr5wCCgKVW0q3rMzUYzy0raygE39bHpOd7cfNGiTsRJhEeI4
 GnB+gwVBzlKbIPEl2PUqxpAgMfuzCLdCKIJS4GzzaF2hn23z2giBgUvAA7TTf6RzxTWt8hkA
 04e9zcqrKMy3Fe2VdS7VBq9yFaGoxodVtx4A+A8rgaXxcL8+B2FD2IJSjpAbt0Ot8IsQzEuk
 FiTkLvBGjhHoLCTD3WH+d+8vT60fCQYM2IGTSsFVhcepcnuppkpiRDCRcolF7S65uAZAhn1y
 jGO6SQ72bMaiJdR073hpA+dxTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTUKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:P3aAd6uMBXcCupk5f815029a7skC2oMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTP2ftXrdyRGVxeZZnMbfKlzbambDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjKzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIA/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfoWG0hYczDgNkGmpDs1L8Yqq
 iIn/7mBbU215rlRBD3nfIq4Xim7N9h0Q6l9bbSuwqfnSWwfkNHNyMGv/MXTvKR0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59ks5Vza/prVFZql/1pwGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlLhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OEDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowFLau3iee/Fm8Kc7gywlGl/NIwgF4vsul6RRq/n7WKfhNzGFRRQnj9agys9vcfHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.93,240,1654574400"; 
   d="scan'208";a="80736191"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9+qI3AZYtobN7JrqI3htKai6/k2022B3glcTfku5laVHAXNNKLOt5koz2zPqcky9ThWHEmCkrkdddROb8UK3OXE1duP2S90pm1U0ELia8P8BLZx8GTDogO8xOnJFCD5fNqmHGL+BvyFdIcBCF96ObhgfqK4XkicvHtBpiGaLzgvj12sW/AOGvKG6Ogq82FrPuXU/07DuYcLC5EkbTJ7jz8GccTcikwFZFx/7uCNNG0UQF/xw+UsIPWaErn4LNzBbZJT1I+CoWUIFjGSpl3/luu1qU/YWWcRwOTqURy8Qqe2AH0+YHPJbFd/aSJTZbRVq7/tOS4e4PzUdbeBinnE+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EK2XNmUVALpfgvKkGoF4lSj8egYU2wJe1cZ+o5AYVLA=;
 b=MMdtL5Z0AzJ9Jr4P4uwPuV9iKkaBNyG9z5wVooXpKFWBXKV4kLigNq3+guZXeY8zu8WL4XFDQ8Ed/+rNnvxq+Uv0tlVauYdKHKvUSaLzgdONbwYM0EFGt63GhguCiq55U5u+aMESkk/Yj/Z4EoD6r9CWjLRNLxHt2f7rC/QVisdyaoBDdS7AvRS2xTqGHQBgew0fClHF7Vfz7Z6ZIZPgcaZBDtlBWcE0Vr0d+lcVZvIOaNMDTqgZMdufOK/sVrRV03O8N3FqT8+ijfItopu4ljkGtI8HX75+bCytltvpYLXidIvDZz3kpWw0juxZsLs7cfd6dUiuoBwNeIEj06/4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EK2XNmUVALpfgvKkGoF4lSj8egYU2wJe1cZ+o5AYVLA=;
 b=f96EIsjzjRYMuEG1oaxVlPBcXFo44FliOZ4F4riKst/N/MCLtOtOKR8CEPVi2MwRMeAQkeAG6crgODtgnP/MFbdaKU5atywR0ZZkwQlHXJubwZ/8QDHvuOUjtNG7tTXXjIkxqenEE/H9fda+UNTuaxJuDFF9UdIIWOUJoFz9Q10=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/4] xen: Port linkage.h from kernel code
Thread-Topic: [PATCH 2/4] xen: Port linkage.h from kernel code
Thread-Index: AQHYqBOcTorV7/AaXU+jvacxRyO/Ya2gCkGAgBFX74A=
Date: Tue, 16 Aug 2022 10:16:01 +0000
Message-ID: <a9a16f4f-a891-0801-69f9-5ce66acbc672@citrix.com>
References: <20220804150424.17584-1-jane.malalane@citrix.com>
 <20220804150424.17584-3-jane.malalane@citrix.com>
 <2bd30d03-1918-02c7-02b2-cff8d58c99b0@suse.com>
In-Reply-To: <2bd30d03-1918-02c7-02b2-cff8d58c99b0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9eb7c0c-041b-41da-b32e-08da7f70523f
x-ms-traffictypediagnostic: SA1PR03MB6388:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8nqT9uQeyaL4KiznPWGcwKrEb1hvdJmZ67OCE3uGiNkvaW3p9CQp0byB7+0ZUWuCmeedSXimqcbAdC17wyA7AABIhwQ1IoaXU8HYmpQclFa13Rtuh4bEXoV/UFQM0UBt+LicCDHw5zI2axh4P0IYpi/HBM9NWzCW2tyGzCC+K1W4nK/qmLq12pYL3ttUYSr3Ee7o7BBI1R0ZH/I6ZvOF3Iuaey5QqmCrXkwn81HBsJGGUDZFcT2nZBGyo749MgtFBDlfY+s+WvqUr4GTO5lurEJ2lKIpBKHw4LQsWIbSKtmfgkKtpAZ6nfDMDUW38KtEgyxSqIIEXVj5ahayLP8w8NAxcuiGFFuPC4W2nsJRsQ/vQJs9NX37yGLIyA5/E48Ji37BxNTiUEGKkqnf02mQgBEUmJytfre/ynLOKPVhKz9f8sNlao4qW2jHawTDRfGK/JCQBDGipENxLPuWcRB/+1LU0QJYQ595EIteA0PgHHLsP8VasycKTQaXfVhjIQJdNFVwptIv+yrF9JtFBHr7oIOYoeJI/vpUe97fpe29ub3nmeh6huZSceN5TnGyImMhcy6064cXv6iMfGrvzJHT0GmSGvi9tNF4T/zPQok638xDTv0Lg+DhXvt942MXlGmv/0p0adFdDfgGvWfC4JAN0YqXzLZmLLnE0C2kdhKonxc9/xtexKqNsik1coxrvzrC/2u+FkxBeMUSBQTfuQbSQSwmijeubgmUl6tYmbJYYidUR8uUoEoor0PK1EQB8/xwnWqP5nnyfHqhUnDxm/QSac2jKWM5oQZyDPFp8QyfrAXkMtScyOaEQVNsbCO3s46cUetJux0dbKBdnIkZ/hHF8w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(6916009)(186003)(83380400001)(66946007)(64756008)(2616005)(38070700005)(478600001)(66446008)(8676002)(316002)(6486002)(4326008)(71200400001)(66556008)(91956017)(36756003)(66476007)(54906003)(38100700002)(122000001)(76116006)(86362001)(31696002)(8936002)(5660300002)(6512007)(26005)(82960400001)(6506007)(41300700001)(55236004)(2906002)(53546011)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bWVjMy9zWGhXS1IrWUMrempBUXpaTGFZZWZTb3BRTStrNExpK3c0Zm9yaUE5?=
 =?utf-8?B?YmswckVZQ0pDSGZLdGcrTFdNdGVaMGdKWmdlNVdKandXa0JEcjdrWmlPN1gr?=
 =?utf-8?B?TS9xMC9pSUlnV2E5MGJwUHR0bTNyNFZWK0NjYW1TblVsN01WM3ZiVTY0NENZ?=
 =?utf-8?B?YWJGdGMwaU1QV3l2bnJCd0dCcVlHZUtUNDNjejhoTkxIWVBaWWR6bmgrMDhT?=
 =?utf-8?B?VHF5azZTKzZaM25wUFFvK1B0aXFoTHlZeVJnTS9ZOXhUUUFBTjVZVHJpaEsx?=
 =?utf-8?B?OXN0eXR0eEVpL1NSd3FtOXh5b2ZwaHVjQ3pqbmxWa3BUZ2tRdFFQeHZpR3Bj?=
 =?utf-8?B?SVhQenJiWXh2cmQvUllOdFJKWUJPanNiYnArUUh4N1NYTjBXWXBjS2ZVek8w?=
 =?utf-8?B?WFRDRDFVYmNYYU1IM090VFRaUDltU0NTVlB4K1BDQXFGU0FiVmkzRFVTcm1X?=
 =?utf-8?B?MzlXc0lMQmI2ZisvaHVCalZwZXlORmY5aGpEMUhVWDB6ZGhmdEg1Q2lhMnhl?=
 =?utf-8?B?OFFYN3FtVUVIcG1GYkRLeXNOek45djhPRmdMWGdDTFR6RXBZc3BvajBXcUdB?=
 =?utf-8?B?c3B5VUlCZVN4Q1h0R2J5M3BDSnhFaElab1loZEpjYTQzb1ZLVjVycU00R2VT?=
 =?utf-8?B?SFQ5TzM1Y1hHQ2p3aUljQTBpQUh6cENwZFRlandmRkRJVVlKZUY1TDZSazlE?=
 =?utf-8?B?S1o3MVEvT0ZJdEUrYTU2aHUzY0JBUnpPaGgzeDNmUWhMcStWMkM2cCtFWE1Y?=
 =?utf-8?B?NDBDOWVwekxlRGxvSnFZc2FlNjM2RUx2QjdXZzk2WWZTeFdLbDZvYXdTamd4?=
 =?utf-8?B?eW80YnRwczB3UEFmNlpyUitrL0N5Z2dvd0VWN0ZnSkh1cjAydFgwMUVZN1ZD?=
 =?utf-8?B?Z3ptSmRmS1NTZkVoRVptZ0J1dkE0LzhvNkFLRlNEMjZDVzhYWmFuUjNUT1pv?=
 =?utf-8?B?Z0xra2hsMmp0NXpIZTg3VytLd1hWKzFEZWRxTGo3aExEcXcvTmdnQVBraFZG?=
 =?utf-8?B?a29nUWk5amRYZ3ZyclpkdHViT2JnRlBMalNab3ZWTEZLak5jQTEweUlsSDdm?=
 =?utf-8?B?MmhmZUptU1ZxWnVobHg3bi9LNGcrQzFlSGlBaHhpVHpDY0VudjJoVkVXYWlj?=
 =?utf-8?B?MU1zdTVwTjRRY0FGcXlnQ0hpV25HQjZ3ek1HaThDYk5ZSzU0QzdMd2ZXNWdi?=
 =?utf-8?B?N2w4YkxPN2htazRCVk9oYmhBSUc0Z2F2dG1RVzRVbFBWVXE2Wm9FS00xVXZx?=
 =?utf-8?B?WjQ0d2VQRFBiU1Z0bTJKamlXeTFZcDd6M3ZpMFdpenRZR0JKdW5OdlFEQUhI?=
 =?utf-8?B?cWhYMnc5Zkx4dG9UR2o4SzBZUEtUZUwraU5lWG9pakoyZnZBckl3dWxnblBo?=
 =?utf-8?B?ZXdiK3FSUGhOcmoyUXBMV3V1WlVhMHJhMTJNSlhFbjJCMHlXYUlOQisrRnN6?=
 =?utf-8?B?MDN2ZmZhRyt2eXhzdVNsQU0wakdRWGhxQ3dGOVdBWkFqSE9KSjV5eVlxOEJU?=
 =?utf-8?B?QmpQeGd5Mm5jeWNzR1V6bHg1cWd3UzZRa1ZBOXdUVjVkYWlLdHZLVElFYVNS?=
 =?utf-8?B?VjRyZkg3dGtiVHJNQ0dUK2dNQnJ5OUpuSVdWbCtDUWVHQzJnQ0VraHFudDQw?=
 =?utf-8?B?UXQ2WUw1UDU2ZzJkNzVwejF2RDJla0VmTkhzMWR0U2ZzUkxTTTExdFowOUN2?=
 =?utf-8?B?UTVGQTd0UmpLMEVoTmVacFdBMmw2N0JnV3ZYamFrSUdVbjY2bmttYjZDcitl?=
 =?utf-8?B?K0xtSVhkSTNaa0ZCTGZUbFRFbVZVajQ3aE1Jd2RXYWY5UUplQW1RdXZSbjBT?=
 =?utf-8?B?T2UwZ2gybDlQQXNvek1tSVROZnk2UnNSd1Yzd2N2WUU2U2Z5eWxkZXZ0TFBF?=
 =?utf-8?B?NS9lWUd5eE14dXNFQU9tQ1hXZmN2cjFqeDVhWjdtQjVpSGUrMndVRjEyNzBF?=
 =?utf-8?B?ajczTE1NQnh3cVlveXZjcTR5WW5FR2o1czkrcks4TDJhR1FtZWx5TFFNOGZh?=
 =?utf-8?B?WDRJaEs5eGZVemNlckZZcnNocjgxbk9URVA1TkRacGJNK05haFJ6UFBNTm5T?=
 =?utf-8?B?UldyNnlTbHgxUDZYQWJ1Tmlldk84dk1UNDA2QWZHSzFRU0JFU0FXZWNQM3ZJ?=
 =?utf-8?B?QUFjeXZpUlpTM0VjYkR6R055a284LzJPL1JzV1l4WG04bE1wWTVoYTJPZko4?=
 =?utf-8?B?Z0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <475E2ADF090EB24B9EB6817F6B6B900A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9eb7c0c-041b-41da-b32e-08da7f70523f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 10:16:01.9005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dpo/gQkmZlbm6PNUkMWzyOw21X8GMYEDHaU8W946Y6kEU9ljFSr8mPB6NiWw34qJ8TeQiNqSYtdxi0e3Enz+j1jQ8ax62oo5dgKbwYKuCWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6388

T24gMDUvMDgvMjAyMiAxMDoyNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA0LjA4LjIwMjIg
MTc6MDQsIEphbmUgTWFsYWxhbmUgd3JvdGU6DQo+PiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYW5lIE1h
bGFsYW5lIDxqYW5lLm1hbGFsYW5lQGNpdHJpeC5jb20+DQo+IA0KPiBJbiB0aGUgdGl0bGUgeW91
IHNheSAicG9ydCIsIGJ1dCB0aGVuIHlvdSBkb24ndCBzYXkgd2hhdCBjdXN0b21pemF0aW9uDQo+
IHlvdSd2ZSBkb25lIGJleW9uZCB0aGUgb2J2aW91cyBhZGp1c3RtZW50IG9mIGluY2x1c2lvbiBn
dWFyZCBhbmQNCj4gYWRqdXN0bWVudCAoYWN0dWFsbHkgcmVtb3ZhbCkgb2YgI2luY2x1ZGUtcy4g
SG93IG11Y2ggY3VzdG9taXphdGlvbiB3ZQ0KPiB3YW50IHRvIGRvIGlzIGltcG9ydGFudCBoZXJl
LCBhZnRlciBhbGwuIEkgbm90aWNlIHlvdSBkaWQsIGZvciBleGFtcGxlLA0KPiBhZGQgbmV3IGZs
YXZvcnMgb2YgU1lNX0lOTkVSX0xBQkVMLCBidXQgdGhlbiB5b3UgZGlkbid0IGFkZCBhbnl0aGlu
ZyB0bw0KPiB1c2UgLmhpZGRlbiAod2hpY2ggSSBoYXZlIHF1ZXVlZCBhcyBhIG5ldyBwYXRjaCBv
biB0b3Agb2YgYSBzdXBwb3NlZCB2Mg0KPiBvZiAieDg2OiBhbm5vdGF0ZSBlbnRyeSBwb2ludHMg
d2l0aCB0eXBlIGFuZCBzaXplIikuIEF0IHRoZSBzYW1lIHRpbWUNCj4geW91J3ZlIGxlZnQgaW4g
b2JqdG9vbCByZWxhdGVkIGNvbW1lbnRhcnksIHdoZW4gd2UgZG9uJ3QgdXNlIHRoYXQgdG9vbA0K
PiAoYW5kIG5vLW9uZSBrbm93cyBpZiB3ZSBldmVyIHdpbGwpLg0KPiANCj4gSSdtIGZ1cnRoZXIg
bm90IHN1cmUgSSBhZ3JlZSB3aXRoIHRoZSBuYW1pbmcgb2Ygc29tZSBvZiB5b3VyIGFkZGl0aW9u
cywNCj4gYXMgdGhleSBhcHBlYXIgdG8gbm90IHJlYWxseSBmaXQgd2l0aCB0aGUgbmFtaW5nIG1v
ZGVsIHVzZWQgZWxzZXdoZXJlLg0KPiBZb3VyIGFkZGl0aW9ucyBhbHNvIGxvb2sgdG8gbm90IGFs
d2F5cyBtYXRjaCBzdHlsZSB1c2VkIGVsc2V3aGVyZSBpbg0KPiB0aGlzIGZpbGUuDQo+IA0KPiBZ
b3UgZnVydGhlciB3YW50IHRvIG1lbnRpb24gd2hhdCBMaW51eCB2ZXJzaW9uIHRoaXMgd2FzIGRl
cml2ZWQgZnJvbSwNCj4gdG8gbWFrZSBpdCBlYXNpZXIgdG8gZGV0ZXJtaW5lIHdoYXQgaW5jcmVt
ZW50YWwgY2hhbmdlcyB0byBwb3J0IG92ZXINCj4gc3Vic2VxdWVudGx5Lg0KPiANCj4gT3ZlcmFs
bCBJJ20gbm90IGNvbnZpbmNlZCB0aGlzIGlzIGEgbW9kZWwgd2Ugd2FudCB0byBnbyB3aXRoLCBm
aXJzdA0KPiBhbmQgZm9yZW1vc3QgYmVjYXVzZSB0aGUgY29tbW9ubHkgdXNlZCBtYWNybyBuYW1l
cyBhcmUgdG9vIGxvbmcgZm9yDQo+IG15IHRhc3RlLiBXaGF0J3Mgd3Jvbmcgd2l0aCBFTlRSWSgp
IGFuZCBFTkRQUk9DKCkgLyBFTkREQVRBKCk/DQpIaSBKYW4sDQoNClNpbmNlIEkgaGF2ZSBubyBw
YXJ0aWN1bGFyIG9waW5pb24gb24gdGhpcyBJIHdlbnQgdGhyb3VnaCB0aGUgZGlzY3Vzc2lvbiAN
CnRoYXQgdG9vayBwbGFjZSBiZWZvcmUgdGhvc2UgbWFjcm9zIHdlcmUgaW50cm9kdWNlZCBpbiBM
aW51eC4gT25lIG9mIHRoZSANCnBvaW50cyBtYWRlIHdhcyB0aGF0IFBST0Mgd2FzIGFuIGFtYmln
dW91cyB0ZXJtIHRvIHVzZSwgc2luY2UgQyANCmZ1bmN0aW9ucyBhcmUgbm90IGFjdHVhbGx5IHBy
b2NlZHVyZXMsIGF0IGxlYXN0IG5vdCBhbGwuIFRoZSBvdGhlciB3YXMgDQp0aGF0IHVzaW5nIFNU
QVJUL0VORCBtYXJrZXJzIG1ha2UgaXQgZWFzaWVyIGZvciBhIGRldmVsb3BlciB0byByZW1lbWJl
ciANCnRvIGFkZCB0aGUgRU5EIG1hcmtlciwgYW5kIGV2ZW50aG91Z2ggeW91IHN1Z2dlc3QgdXNp
bmcgRU5UUlkgYW5kIG5vdCANCmp1c3QgUFJPQyBhcyB0aGUgc3RhcnQgbWFya2VyLCBTVEFSVCBt
aWdodCBzdGlsbCBiZSBjbGVhcmVyLg0KDQpJIHdlbGNvbWUgb3RoZXIgaW5wdXQuDQoNClRoYW5r
IHlvdSBmb3IgeW91ciByZXZpZXcsDQoNCkphbmUu

