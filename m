Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4402B401809
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 10:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179476.325759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNA29-0004WK-Ie; Mon, 06 Sep 2021 08:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179476.325759; Mon, 06 Sep 2021 08:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNA29-0004Tz-FH; Mon, 06 Sep 2021 08:31:17 +0000
Received: by outflank-mailman (input) for mailman id 179476;
 Mon, 06 Sep 2021 08:31:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxtw=N4=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mNA27-0004Tt-3W
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 08:31:15 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::62b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d188a28c-ef78-4998-8dea-688d24e0d721;
 Mon, 06 Sep 2021 08:31:13 +0000 (UTC)
Received: from DB9PR05CA0023.eurprd05.prod.outlook.com (2603:10a6:10:1da::28)
 by DB8PR08MB4955.eurprd08.prod.outlook.com (2603:10a6:10:38::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 6 Sep
 2021 08:31:07 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::9e) by DB9PR05CA0023.outlook.office365.com
 (2603:10a6:10:1da::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Mon, 6 Sep 2021 08:31:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 08:31:07 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103");
 Mon, 06 Sep 2021 08:31:07 +0000
Received: from 2ae092774d4a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B08C1D8F-5A14-4DF5-8735-7D1A131F7C4D.1; 
 Mon, 06 Sep 2021 08:30:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2ae092774d4a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Sep 2021 08:30:59 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PR3PR08MB5788.eurprd08.prod.outlook.com (2603:10a6:102:8b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 08:30:57 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 08:30:56 +0000
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
X-Inumbo-ID: d188a28c-ef78-4998-8dea-688d24e0d721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aXBdmofQAsnNEK7ex5fwtBRjD0v15b+Jrmhf2x2xRg=;
 b=zSXe527rxXA/jU5csRzONoV3jFb+ms7GOEmXE4UGkGhAiOvRJfOHWet8JEihUl01agm55hJJ2a5b1TWzdjOIGttJXPIwaQgwDpwhO3xAVFo/9TCFksuZ6x+EXccRIK+OS79jD224VhG1N4JEidDWWgbU9hBYIajwDFhngs+rtL4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 55ccc14e93903f37
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bi9vdWf6Ov5vRQAnSVzECFRi4N7Z9i2F5SS47UpfJCmS/LZ6Z3oz1kN/k4PDlpPzmkVEN0ry2cnRCGN5CZGidk0Otj3zpZtYb9zDn8i3uwMHcGwFg5zR4Jg8GZjzTSwsle98SNKumfHf/gR13ImI+NAn2HoL2DVAGzzNTvTLROgDv42xE07YGglSmUuL/5XfHw0oUWGa8SlUAQsQxZxkrtdlV/KxvO7PkbY6jSB3NSh9wNaY1Fis9mMnpFvuvHmWo/KOPWBTjmCEGj4qZoPjrVHiDnkMdILXnBU5K97uJnDTQ6PQgcgwDWMkb7Ue2yHufC+HaWE8GztMuPP/KiyJrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9aXBdmofQAsnNEK7ex5fwtBRjD0v15b+Jrmhf2x2xRg=;
 b=Jrl3DPwPhNUFpzLuD9/TynUeyHLAJVkbo4yCMVVFpBWMiY2n2NhfUo2FOk1/Syr49CrUuSyLGWlNcecu2NDdq1kNH3a4QodoCwvejupt3dQjDKSUmycHz5tRsZAxe+QfR+FMudne0H1oWoo+skt7LGdx/Ux5vcFLArmHcSFh/tR+fpMhY4Q+HXMMD4a+6H5soOOL+cJwAa3Zb1KhMICizw1oRFO/SQ5GrfropCK0BpXwW3QkmTb8L/dVvYYBRp0E8vxFGsAlicb5hb+5YD3rsPB2wa834ZY0DWpH2Z/81T1wTpo41GRWDYmLNZTH9mic8Mq7mfgt3v5vM4F88Fc1OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aXBdmofQAsnNEK7ex5fwtBRjD0v15b+Jrmhf2x2xRg=;
 b=zSXe527rxXA/jU5csRzONoV3jFb+ms7GOEmXE4UGkGhAiOvRJfOHWet8JEihUl01agm55hJJ2a5b1TWzdjOIGttJXPIwaQgwDpwhO3xAVFo/9TCFksuZ6x+EXccRIK+OS79jD224VhG1N4JEidDWWgbU9hBYIajwDFhngs+rtL4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: Re: Crash when using cpupools
Thread-Topic: Crash when using cpupools
Thread-Index: AQHXoNo0twqKn1RLAkCotEsfXja8k6uWr0+AgAACAYA=
Date: Mon, 6 Sep 2021 08:30:56 +0000
Message-ID: <626655D0-D7C5-457D-A99E-EF5CEDFD188D@arm.com>
References: <FBF65354-8C41-41B4-8A24-BA1485CAE073@arm.com>
 <5b0a4530-72df-a186-9bd5-50759b3dd151@suse.com>
In-Reply-To: <5b0a4530-72df-a186-9bd5-50759b3dd151@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 996d2d14-9b48-4b1a-2c2b-08d97110ac47
x-ms-traffictypediagnostic: PR3PR08MB5788:|DB8PR08MB4955:
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB49554A1BE605964897960EE39DD29@DB8PR08MB4955.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 N8woIjHFwJGhpXrfpGLmo9p40k/Okp0NOcelnIhi1S2atsc+3L0fw1Xk+7UxbVtp4tYOQFfJrCKFzZPMPyN6MweW1ad+bT9LOZOm+4ECPt3PwUGD8QJ6WHzcNmpfHwy+UT7ADUmbep984RnDjStLHX2TlwCmlRNY7h2YY87rNQh5OqC+UkP+KR+Ao8RGjfMan7AqXFRQwpryRk5WA2WJtutyJupYJba6OTiLz5rLkUMXiP8y2yZ7dgN2R5pfmkQUbKUoeL2xkJaW25a99kKE3isLVxc8EMxqNmmWGArM1GOo8+W3mpso2/fAxSuenLDbqN5vZtv8panOwLnOTJMee43jV/Z3nr26pCqGf+gvNYjk8Ong5HdNsN9tx5gGjAhsDKBbyQnxxEdNupUGPKwKjYj59inq1e8vyDVGAMBiYOIS0ThYUekdSAzD1jipFb0PFQe1zCFKgVAFTQHB8/J/d0TVNdwNNEqRt2VUTVD2N4/lJc6V3el8uRAM9D1GPub8mjvTFE+newU/KUvF6WXBcwzB+tdbfHlMFJbTaJR+XdHGhyg6SxFyRyJdpe84HPnNpo2U1NAdha43oaKSq5hYrcf0y8bje6w8W1Jxl8eiYNHHeQlNB5ByXU14LaCQrU/yF5AeHVprspLWLLLkSMoem3NszZxu+Qbf4FB3mrncZo1O2XM4RWTgxBsevZmP1F+LZganvlwEhBiUZgKfopF5UR00mDOo8y7uJXcRjiF+Hu6F3HZvusa0YgjVHWhntu0M
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(71200400001)(6916009)(186003)(4326008)(33656002)(26005)(86362001)(3480700007)(478600001)(36756003)(6512007)(6486002)(2616005)(316002)(5660300002)(54906003)(122000001)(38070700005)(2906002)(83380400001)(8676002)(8936002)(38100700002)(66556008)(66476007)(6506007)(66446008)(64756008)(66946007)(53546011)(91956017)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NjZkd2UvMW04ZUFEOTE2cHFLREtJTWpVTkxpTnVPMDVUMEwzZHFuSzliMFdn?=
 =?utf-8?B?U1BGVWlFR28vMXMrMXBLUkFaeFpHaDRrOFR0U3Y0VldJQlRmYUNmZDZ0M1Ix?=
 =?utf-8?B?bXUrK3ZQVTB4bnpDbEh4RTBybVVnQklFTzVnZ3VDZ2poaE1IQTZjemdUbnR3?=
 =?utf-8?B?T2xUbnJ6VmFBQ3ZwMGtod004cjdraFcyeEpFZGs5eWJxOStmalpzcHo0eVl6?=
 =?utf-8?B?SnNKcXNLOUVoUWc2Uzl5b2NFaS96TlVpSFg5dUNWTmNHbWRNbkRIL3o5dW1j?=
 =?utf-8?B?S1o3Qk9QVWtUNTNvOUZ1dEpCOTl4RWh6OVRHd3FRWDh3Z1Z0SFZqTjEwZENn?=
 =?utf-8?B?SEd6cXB6b28vTU1PeUI4MVVvV2JCZnRVaTBxZGhUaEI4MkprbFZLQzYyNnFl?=
 =?utf-8?B?MGVlRTM5Q3BaM3hJMDJqS2RsRWRwM1lFbGM5YnpIclFtYUVaZzRvQytiZ0la?=
 =?utf-8?B?RjE5M3hSZmxVc29LRHltek42WWNraFBBbUE2c0cwWW9BdFBLRVFMdnZncHFi?=
 =?utf-8?B?WEtVZGlXZUpLWkxPRmppY0UrRHRQbzd2cHptYlZWeUQ2MjBRQnZ1dktobmJB?=
 =?utf-8?B?ODFCNUdSY0ZJYXFUeXN4KzBvMTE5UUNUYWVMcVVCcU16WTBkN2RidXVjSlQ2?=
 =?utf-8?B?eVdkbTlhUUVnVGJzMHptNUNlbkR5dW9uTEVTL3Z3Z2V1V0IxYjJsUWx0TS9p?=
 =?utf-8?B?ODI0L1pSM0lrVzl3a2tKMUkya20xNDVtZTJYcWZYOUVlNzVyOTBZYkJoRWJt?=
 =?utf-8?B?MGN2THBTUVhqNDR2akc2SWxaOXprVnRXQjA1bGJrbWI2Vll1VktTY2VLelNE?=
 =?utf-8?B?V1dJMU9aMk9DM2dmRWcyOVFPd3JFdGVrNld5RTRKZ0J2WGNSYlRQK1RoRVNT?=
 =?utf-8?B?MlMrK3RmckZxaU0zQTMxUzF4dTg1bkpTZnlQdTQ3T2NPQzloaytIa29uT3Fz?=
 =?utf-8?B?ZThid1RxUVNaTnppSUNabmJUUi9SSUFWWDI4SVdVOUxZbk1QVndIWmVIQnB6?=
 =?utf-8?B?Z3RJN2RqWGk2aUNDTmNUQTcxbFJoVHkrQzc5cUZQN3JVcVFDNHhkS2l3WHBj?=
 =?utf-8?B?dit4ZG1Ka3lxZTQraGFyeWpxSUd3YWxtTHYrYmtWMm5LRm1yNFZZN01Ob2RI?=
 =?utf-8?B?N0x0WDJmeWV0MDRxeWUwelhuY1EvalFzUnpiWTdvaWtoeFl6US9DQlpZQ3h1?=
 =?utf-8?B?K2ZYOVZzUEZqd292cTIxZTA2RWJiZ1lUeHNCanhsM0ZnU0FGandML0MvemFC?=
 =?utf-8?B?OGFPZlVjNjBSTTY3b1BaK0MwUjY4Zkh0RGNySHlHOG5EQUh1eko2NTA2d3Rm?=
 =?utf-8?B?TDBGRUNmbDkzU2ZoZHJ6Zy9Jd2U3WURoeVQ4UXU0dng4emVmQmxZa0VCODEz?=
 =?utf-8?B?WnFLVTRJbW5rQnFLV3NmcDBWMkZIOXV6VGlPYXJpNGE4Z3V6ZVRnakpvRU5O?=
 =?utf-8?B?SWI3MDFEeGY4U0pJQmI4NkhSOUlsb2dDWkNMZFZuemVNMjhGTVJuKzYrM1FN?=
 =?utf-8?B?S3VSUVFmVE1maE9MeTdVUGRKY2xHR1hvWDJvZzZYR2FrYldDa21uMDhGeXdI?=
 =?utf-8?B?MmVMdk92bk1KdGFnSndydnNKcGpwQVhxL3dqUWxYNm9BQjlUbGpTWkdHSHZU?=
 =?utf-8?B?ZEt1Y1FkVHBWdnord0lPenBuaXpMK0U0c0hwRnRpd3ZRVzZnQ2JyTndpODRF?=
 =?utf-8?B?d3BscEpHRUhqZ1B4cWVFMW9SUW5tRGkwNWpJVld2QXBuUjlEaXBsNmpvWnA5?=
 =?utf-8?Q?lkoLZ0LAJwJ+LwXb2Olp5aRnNUnCL4UbFqc2AUt?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDCDDF354BC77945A912FA8F623F67D8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5788
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f67df28d-40af-495d-791f-08d97110a61a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9K++IhcLfoof8o5dj2M2RwbKrPwZc+98zGvANYHwyIYUKlBBR3Fa2QON5gW/+s49ACthN8KLHPGiWyxy15J8b7s3TmguHXSci05aRAKULNHPIRVWh5wqvJYVn/2SQoUp8xTxD6y3r92iEaiUEAjwpnVPRExShdPgJMTbpdHZEIuMvVQhCGJnekwn+DfAQBmCD8fDVHgkwOUAHdC6e4bio72EBNDnLfinbmY4b0k+Ig4OLjCdxBMTeBCDZom0+gnoPZHXYWYGEPhHqEYJ512RQccS4vvyPh2YhQqeg9HOxzc3Msd36hbQ5gWFQJMfHQkiOubrEl0ptRm/7oGv8VNt5ZW78D/zclB5uR1wIPeZUbtwaG7BUme2DXq4EVPaAumd9YW4YwUfNP/ZmAuF3AplCW4D7oqfDhb471DVabd2e8qFeE3LOePUBDRXTeJmsXB8+pCLlc4Msivk8uWwreS+eyEujRZONWUcjlFtKrjVqPSUg4uPSyESY6vILV2VsoePUAlVcxNj0cld/0jQ89tkEseih/A4c4GjV0LLydi1QHemxCqoWQoSJtzA+tJm9X7OCRAtamscgb35wZqCsPvgpJPNjkr312kfLMvlm5qBmeLPSI0RDWHi+GYo4TCOq860xm3RmBmE77Y72HKOJidyWZ0uhDa4FluATPDqaEh/oT3zhjpEsaeYHbXhTl7E0lvtJqj64Nq4c9HCrwCQx0dDUQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966006)(36840700001)(26005)(478600001)(70206006)(86362001)(356005)(6506007)(6862004)(316002)(53546011)(54906003)(82310400003)(36756003)(81166007)(82740400003)(47076005)(107886003)(3480700007)(2616005)(83380400001)(2906002)(6512007)(36860700001)(6486002)(8936002)(8676002)(5660300002)(186003)(33656002)(336012)(70586007)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 08:31:07.3206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 996d2d14-9b48-4b1a-2c2b-08d97110ac47
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4955

SGkgSnVlcmdlbiwNCg0KPiBPbiA2IFNlcCAyMDIxLCBhdCAwOToyMywgSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDAzLjA5LjIxIDE3OjQxLCBCZXJ0cmFu
ZCBNYXJxdWlzIHdyb3RlOg0KPj4gSGksDQo+PiBXaGlsZSBkb2luZyBzb21lIGludmVzdGlnYXRp
b24gd2l0aCBjcHVwb29scyBJIGVuY291bnRlcmVkIGEgY3Jhc2ggd2hlbiB0cnlpbmcgdG8gaXNv
bGF0ZSBhIGd1ZXN0IHRvIGl0cyBvd24gcGh5c2ljYWwgY3B1Lg0KPj4gSSBhbSB1c2luZyBjdXJy
ZW50IHN0YWdpbmcgc3RhdHVzLg0KPj4gSSBkaWQgdGhlIGZvbGxvd2luZyAob24gRlZQIHdpdGgg
OCBjb3Jlcyk6DQo+PiAtIHN0YXJ0IGRvbTAgd2l0aCBkb20wX21heF92Y3B1cz0xDQo+PiAtIHJl
bW92ZSBjb3JlIDEgZnJvbSBkb20wIGNwdXBvb2w6IHhsIGNwdXBvb2wtY3B1LXJlbW92ZSBQb29s
LTAgMQ0KPj4gLSBjcmVhdGUgYSBuZXcgcG9vbDogeGwgY3B1cG9vbC1jcmVhdGUgbmFtZT1cIk5l
dFBvb2xc4oCdDQo+PiAtIGFkZCBjb3JlIDEgdG8gdGhlIHBvb2w6IHhsIGNwdXBvb2wtY3B1LWFk
ZCBOZXRQb29sIDENCj4+IC0gY3JlYXRlIGEgZ3Vlc3QgaW4gTmV0UG9vbCB1c2luZyB0aGUgZm9s
bG93aW5nIGluIHRoZSBndWVzdCBjb25maWc6IHBvb2w94oCcTmV0UG9vbCINCj4+IEkgZW5kIHdp
dGggYSBjcmFzaCB3aXRoIHRoZSBmb2xsb3dpbmcgY2FsbCB0cmFjZSBkdXJpbmcgZ3Vlc3QgY3Jl
YXRpb246DQo+PiAoWEVOKSBYZW4gY2FsbCB0cmFjZToNCj4+IChYRU4pICAgIFs8MDAwMDAwMDAw
MDIzNGNiMD5dIGNyZWRpdDIuYyNjc2NoZWQyX2FsbG9jX3VkYXRhKzB4NTgvMHhmYyAoUEMpDQo+
PiAoWEVOKSAgICBbPDAwMDAwMDAwMDAyMzRjODA+XSBjcmVkaXQyLmMjY3NjaGVkMl9hbGxvY191
ZGF0YSsweDI4LzB4ZmMgKExSKQ0KPj4gKFhFTikgICAgWzwwMDAwMDAwMDAwMjQyZDM4Pl0gc2No
ZWRfbW92ZV9kb21haW4rMHgxNDQvMHg2YzANCj4+IChYRU4pICAgIFs8MDAwMDAwMDAwMDIyZGQx
OD5dIGNwdXBvb2wuYyNjcHVwb29sX21vdmVfZG9tYWluX2xvY2tlZCsweDM4LzB4NzANCj4+IChY
RU4pICAgIFs8MDAwMDAwMDAwMDIyZmFkYz5dIGNwdXBvb2xfZG9fc3lzY3RsKzB4NzNjLzB4Nzgw
DQo+PiAoWEVOKSAgICBbPDAwMDAwMDAwMDAyMmQ4ZTA+XSBkb19zeXNjdGwrMHg3ODgvMHhhNTgN
Cj4+IChYRU4pICAgIFs8MDAwMDAwMDAwMDI3M2I2OD5dIHRyYXBzLmMjZG9fdHJhcF9oeXBlcmNh
bGwrMHg3OC8weDE3MA0KPj4gKFhFTikgICAgWzwwMDAwMDAwMDAwMjc0ZjcwPl0gZG9fdHJhcF9n
dWVzdF9zeW5jKzB4MTM4LzB4NjE4DQo+PiAoWEVOKSAgICBbPDAwMDAwMDAwMDAyNjA0NTg+XSBl
bnRyeS5vI2d1ZXN0X3N5bmNfc2xvd3BhdGgrMHhhNC8weGQ0DQo+PiBBZnRlciBzb21lIGRlYnVn
Z2luZyBJIGZvdW5kIG91dCB0aGF0IHVuaXQtPnZjcHVfbGlzdCBpcyBOVUxMIGFmdGVyIHVuaXQt
PnZjcHVfbGlzdCA9IGQtPnZjcHVbdW5pdC0+dW5pdF9pZF07IHdpdGggdW5pdF9pZCAwIGluIGNv
bW1vbi9zY2hlZC9jb3JlLmM6Njg4DQo+PiBUaGlzIG1ha2VzIHRoZSBjYWxsIHRvIGlzX2lkbGVf
dW5pdCh1bml0KSBpbiBjc2NoZWQyX2FsbG9jX3VkYXRhIHRyaWdnZXIgdGhlIGNyYXNoLg0KPiAN
Cj4gU28gdGhlcmUgaXMgbm8gdmNwdSAwIGluIHRoYXQgZG9tYWluPyBIb3cgaXMgdGhpcyBwb3Nz
aWJsZT8NCg0KTm8gaWRlYSwgSSB3aWxsIG5lZWQgdG8gZGlnIGRlZXBlciBhcyB0aGUgc3RhdGUg
SSBjb21lIHRvIGRvZXMgbm90IG1ha2Ugc2Vuc2UuDQoNCkNvdWxkIHlvdSBqdXN0IGNvbmZpcm0g
dGhhdCBteSBvcGVyYXRpb25zIGFyZSByaWdodCBhbmQgdGhpcyBzaG91bGQgd29yayBiZWZvcmUg
SSBzdGFydCBkaWdnaW5nID8NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiANCj4gSnVlcmdl
bg0KPiA8T3BlblBHUF8weEIwREU5REQ2MjhCRjEzMkYuYXNjPg0KDQo=

