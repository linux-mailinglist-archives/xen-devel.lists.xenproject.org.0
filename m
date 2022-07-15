Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FC1575DF1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 11:01:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368020.599202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCHCD-0006ly-TL; Fri, 15 Jul 2022 09:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368020.599202; Fri, 15 Jul 2022 09:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCHCD-0006g0-N5; Fri, 15 Jul 2022 09:01:13 +0000
Received: by outflank-mailman (input) for mailman id 368020;
 Fri, 15 Jul 2022 09:01:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0DhQ=XU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oCHCC-0006c5-2s
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 09:01:12 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70055.outbound.protection.outlook.com [40.107.7.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9e049c7-041c-11ed-bd2d-47488cf2e6aa;
 Fri, 15 Jul 2022 11:01:09 +0200 (CEST)
Received: from AS9PR06CA0409.eurprd06.prod.outlook.com (2603:10a6:20b:461::18)
 by HE1PR0801MB1817.eurprd08.prod.outlook.com (2603:10a6:3:84::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Fri, 15 Jul
 2022 09:01:05 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::d2) by AS9PR06CA0409.outlook.office365.com
 (2603:10a6:20b:461::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17 via Frontend
 Transport; Fri, 15 Jul 2022 09:01:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 09:01:04 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Fri, 15 Jul 2022 09:01:04 +0000
Received: from 806764d8dfed.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1AA9892D-36EB-4F67-97DC-865A2DAEEE2E.1; 
 Fri, 15 Jul 2022 09:00:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 806764d8dfed.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Jul 2022 09:00:56 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB7202.eurprd08.prod.outlook.com (2603:10a6:102:209::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 15 Jul
 2022 09:00:55 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5417.026; Fri, 15 Jul 2022
 09:00:55 +0000
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
X-Inumbo-ID: a9e049c7-041c-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EWTJJoJOTTWwus+6eufr4rhBofDBCzYw8+JcZId3CfKVG5kwnjl7WE604l2jAZTz3vvBGqLzcHq816/JFRjlI+xCySwcpzrrXrx6PSHcEIlkd/7zY0CefX2dVX00L2b4hAiENyKCS3mU5BF5Oys5LABxUPLJzUGSjCidMWZgREDYkQqZefcTzhhl+8GIlWVTLXmkzBya6uEDbZGsos/orrNbYccF6yIZAI9TH9kDF/247WcFMkw/ZQx79oNY57vRemOR+ugJL1hIVflqfdbhAk1BBZTCfqoh0X8E/sJx5BKVieVpB8GWdDLM/gIyDmcnqxRBVU8CQqCVC4A9h+DMqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cU56CzXIptzU7NuE6EUpd+7li5NbOLKM3g4lCKJKIYU=;
 b=L0UbEbYKFH+W4vj1jJ2NMxFH00yDNzgbcIGU32CEPXhjdILGGAYsqUsNjHhgHGVfJ5DtrEdhuQKDQZ02yQmh0rfNYy1jfpyYz33YkeZH54VubpuQMpwhZRJvqIup836GYe8VkElgciXDqFbKSIGP1C8niUGrHYDZ7MRuDOrJKAUu9bJMwrRmGh/GiJ9yntSdIRYNAkccoFM93ivg/3m3br3vIMtXJWpNOfxsIFNPHjLMYW3dVZk9MicrhiYbnrLs+UukU+VnDEQg6S/xNmH19hrRlWKxn191nIhT+Re9AtIQVGsdkFqBgpcNQDTnp747FCzSU76Qx7QgII3vmFcy6g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cU56CzXIptzU7NuE6EUpd+7li5NbOLKM3g4lCKJKIYU=;
 b=96ndREOJyUfLINQx56xARBJhSVWfJGNfgu+dbF4l+/Gxqx8GzT80mYrbnfkn6oiJl+zFnrfH/ZjMr7+o8D/x+tSnzsk6vIW7vj26xeCO1pp7bobmga14MgE3Cg9czGMuvDRG9DC02luoqIm+jC0ytZCJ67U8ieJCJC9V+PAlMVY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8296eb58a26565a3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHgqKdUu7b7ZmrdTqAPwsGGCyBc65pHvyd0QgWu/08QdsL+6CmH7yQ/3DcRt13kp3GhCSrnFYnaC4WAIQBWzxQutYgArEpGP/DKY/wSasOvXnfGQvHYnYO1rCQhiC8heWtH0vytazh+nDGeyf974uyjNbyvPgjfbEA2O9uW75HZa91mThI1cWn87V7/j4t1yzSmTVo/3rlSmRT76UPrgsc6oO/JOBOSJw0AFpPZ2mP6r6lAoyFPl7Bh57LHtSWlksPNzclYDTZ1e3IVp3yVFxFDZpIIJEj4SFAerFz+4ViSUZgojAvC+JbpXOEv+tpgx9cqJucpruzNR7eEbbXZnFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cU56CzXIptzU7NuE6EUpd+7li5NbOLKM3g4lCKJKIYU=;
 b=H9D6nEDzRtRb5duiHADECM8lobKIcgn2cZUHKGTQR9dBqA8WI2CuSWVe3WQHKxi42xsM5xUwoGbpQDu/TxZUS/F4q5vF38koVu1U/tLvvt909ozf8eyiR3mWLLU4hvSWyfMf+up1nvGH3gr0aZ4Vy+3+Fej0WHxAWNvuRaUyvouS+mOcklCluhzBqv+tCAqzBUpBr/YkYbzLE4rHzqp7slnCto7oa+D44kNY0SvhGGOTpB0ybymUpXm6IDP8j0PFK9yDp9BA1KAXf0nEccobWftfrTL0R4O9AKMhH5bLS+GCtQM7Iur+EF84IhtVSwGu/1cZJLeL50+uetMMEK7THQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cU56CzXIptzU7NuE6EUpd+7li5NbOLKM3g4lCKJKIYU=;
 b=96ndREOJyUfLINQx56xARBJhSVWfJGNfgu+dbF4l+/Gxqx8GzT80mYrbnfkn6oiJl+zFnrfH/ZjMr7+o8D/x+tSnzsk6vIW7vj26xeCO1pp7bobmga14MgE3Cg9czGMuvDRG9DC02luoqIm+jC0ytZCJ67U8ieJCJC9V+PAlMVY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mathieu Tarral <mathieu.tarral@protonmail.com>,
	"marc.ungeschikts@vates.fr" <marc.ungeschikts@vates.fr>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Xen-users <xen-users@lists.xenproject.org>, Roger Pau
 Monne <roger.pau@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>,
	Henry Wang <Henry.Wang@arm.com>, Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: make debball fails on Ubuntu 20.04: More valid-addrs than
 all-addrs
Thread-Topic: make debball fails on Ubuntu 20.04: More valid-addrs than
 all-addrs
Thread-Index:
 AQHYlsicqOth5aGebEinuouQN8xr5618caEAgAAKCYCAAPuhAIAAJpSAgAAJHQCAAAWjAIAAAbIAgAAHvICAAW0PgIAAAhoA
Date: Fri, 15 Jul 2022 09:00:54 +0000
Message-ID: <88D45FB0-5036-4B02-8C0E-77EF04D2C14A@arm.com>
References:
 <okFlqhJjn071_UXGT4dzMfI03eqFRtlDcnSyS_QtHFu3vZVCdTTKkvZS1ApPFXEN65mcnhOc2g-9HjZmTGYMyV1OOzrv_PkCzdo4KNKICf4=@protonmail.com>
 <5952497A-CB6F-4C66-8FA9-8EF9A1A08B5E@arm.com>
 <9gC8biTj2pIJoXJRy4N2I6nsOUEUjYsbIAj0XZsWdAwiwzXpgBBeBrLFB0bAC7LjVmKwPvzufWHPSVYaWuMl33lKHKbzChEgW4R9QBwJZJk=@protonmail.com>
 <F18A101C-ED4C-44DA-AB2C-15E79620A692@arm.com>
 <13TmiNmQ9iXXKyshVeCbt4ul_jYjdNejXrqhIJK7CioLQRgpSITJX1Ik0jNEZZDTUIXs9OvM0qjZJeqRhQl1oKU9IdiZ3W-Ajsqp3sYgt6Y=@protonmail.com>
 <F1773D90-2760-4098-BF08-4D4125D349DF@arm.com>
 <a3de7469-9b75-ea19-4ce7-ce80e737806f@citrix.com>
 <2fad8072-e5f1-2302-f01d-82f744606d9b@suse.com>
 <2e761a65-f24b-edb5-6a7f-cebf47d51c68@citrix.com>
 <8xw3d1YneEfFrFwF4YmilgJ0_F-AsJxCZMUFdsGm_TJOKc7q1IzeQ33kC0XKLdfRGRWQLJ1vUfIa7tNDnHxjN9Bb9g5PJlJ_TO22uT25OO8=@protonmail.com>
In-Reply-To:
 <8xw3d1YneEfFrFwF4YmilgJ0_F-AsJxCZMUFdsGm_TJOKc7q1IzeQ33kC0XKLdfRGRWQLJ1vUfIa7tNDnHxjN9Bb9g5PJlJ_TO22uT25OO8=@protonmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 766a2b0a-76bb-4b33-2345-08da66408c4a
x-ms-traffictypediagnostic:
	PAXPR08MB7202:EE_|AM5EUR03FT033:EE_|HE1PR0801MB1817:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QLAVgnm7qqxGn74va3zLriCzBlcoT/nZDmPTE7zetm2r6SAE/4ZLZ2RQMMoLyPgYtnIxMOC56nw0OUEmUs4BdxuZvP5bBxNQp9wU8QPhkdhyR+2KbwItEZXK72iQ/vSit6TdqPR7qOESS683y6iyoViD34VvNHMAwTAICUTWGhTEFHu+SuwKuZep878SC9ibBogp/0gPJRBPYMXS9aLCxOggOXyPQVgvU/VCm/xDY/TBxLtlBNZr5z5eWKfWnWVjh+2JlMtDcsrrSnyaZ/oX3jpKS0bIzm19FTgmBRfHhO7Mn7NkRU39cP1F67Z9v0qBZmx2kP1BofLVizkG707uVNKmvJSOcQshdlG5zB//SxBISIUuUT0NXGed00p78guXCjzfnxTz/PLrhz7+I/gUNDKTAp45C/OyM0ZxW2cjEeB/zpzvHBrgxHu+8iKHtRY8QlVfXVV3g5tKIDTXKS3ZxjJEjI7LVdWRqaMllau91r7sgQVbM9k36de+KEqLX2TdAfhbe77xHM/pe8nDrCe/jVSM5Vvsaw0k6v3wZf1mLYwCzXKAFIWdbidNOV1LDLs02QQO3VdgDbjIdfz7o+OIZLBCeVFSr+32HgiYqMGsivnjNm/xSL2ZIxqvJxrdNPksjQBuTY+1oPCACNZW+XRlmnOnEjczCYV2EJgPlgsm3b2KMR6xqz6f5G4Bjpzq/UlN1cPtYmazEJNqda5VkSVHtKA62M+kfvs4y3X0jwAyEdh2VbcTf5vCeK37ZLrMbT7cl1pIOFJHNlIYI7krUhjxvqoN/ufUyXFE16AhYQgwWkbKepsKdUgAYczJX0O4SUH/TP7LzWPzbm7IwqJnzEEqsi05hG/+b/1NSz0DBar1BMx8cOkxbZPzfggj+VYuj52PqAx88x0U+/tRXOW/ylOQowo7NII5tNZe84wdnqS7oG0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(83380400001)(38070700005)(33656002)(8936002)(5660300002)(86362001)(122000001)(38100700002)(478600001)(36756003)(71200400001)(53546011)(54906003)(966005)(41300700001)(6506007)(4744005)(316002)(110136005)(66556008)(66946007)(91956017)(4326008)(26005)(8676002)(66476007)(186003)(6512007)(76116006)(2906002)(2616005)(66446008)(64756008)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AD30F925271FDE4AA6B4697A1F9C0FE8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7202
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	82ab4198-4961-4635-bbd5-08da664086b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JnMN0xdXx/hgrmOOKp6RZbV9CgZ/Na+FZm0P342vG9N8Zcjklccj2exMNFAq48CQyx5Kv3MITMP51q/M0dNCpGk6PccWXNHbbhftw+ufCHEgReuV1Rq12pvrWBpu/3hIRmRNUWMoaOiP9xQV3xlIvLDSkIGKrvL+i+5Z+20MAMIOjqXeidhPLuAaksRqnERA9FikEXMEyO6jRHJfR9FJThCrtv/d+rpSL4+yOw7TB0QHgYwIa0UtdocfBAQY1wsYs5V8vyVnXLOkECR7orj7N7rairFWO8G3rWejHhSSpwQRjMB7Wy/Bcu7OgRD2YgpgQweeqbQ4gtlDCFXGeZOnu3T42ubT5kCR34tdUe0SdBdqijFuRO1tH4M/Vp/UKPR0uWVsDo6S6LgwpZcKaZogbYHsbucAduRYrnvWkGdbKlf3JrTKzbiokbe1yyRk3KATMbWpDQTmpUOoNEIqfobAw3j43jci2CZGHgLLZhJiv7O3XzLCuJGbZjPi1P5CFujLqo0cCw4foXlQX1TLPdb/w7cBzQDVvQIJafDSrLoWBriIXLq3WGwLvuIRXjYooYLp25xsy2nRCXQTqbdipfp8nUFJlxFQY212ULjbVeTntv4UAtOo1crTkR4cm3pSmO2vF2Cz+9q2mGmglGwehFgHJ1IUfdQMDVyPV761kW4v1t1McP9bYzxgSwOJPQv1xY/jglgKRLF9ul76rfoUGfI1RsliM1585oV0JyIY2yetbGJ4/IX48NtB+OdkgRCFEt1lDrOm+KrMVsvqfyL30s5TygenKqisFugGskU1vLP7omCwmel82IqhOXAA3z0dLmQSzjVRJPhn97zh+AjHbE7bamuJhb2ROOgX424xRzh1yGON+Mlqt9WjTmPApqE7Z100cTwW/+UiA+Hv0+PgtSB8kw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966006)(40470700004)(36840700001)(81166007)(6486002)(82740400003)(966005)(6506007)(2616005)(336012)(47076005)(41300700001)(356005)(53546011)(478600001)(26005)(36860700001)(83380400001)(186003)(6512007)(33656002)(5660300002)(4744005)(40480700001)(2906002)(8936002)(82310400005)(36756003)(70206006)(8676002)(110136005)(86362001)(54906003)(40460700003)(316002)(70586007)(450100002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 09:01:04.3018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 766a2b0a-76bb-4b33-2345-08da66408c4a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1817

Hi Matthieu,

> On 15 Jul 2022, at 09:53, Mathieu Tarral <mathieu.tarral@protonmail.com> =
wrote:
>=20
>>>> (We're trying some new project management tools.) Can you try opening =
a
>>>> bug here: https://gitlab.com/xen-project/xen/-/issues about the
>>>> check-endbr.sh issue?
>=20
> I'm getting a Gitlab 404 page when trying to access this link.
> Are there access restrictions in place ?
>=20
> And same for:
> https://gitlab.com/xen-project/xen/-/issues/26

Yes there are at the moment.
@marc: is there a way to let everybody read the tickets ?

Cheers
Bertrand

>=20
> I see the fix is already on its way !
> Thank you for the great support.
>=20
> Mathieu
>=20


