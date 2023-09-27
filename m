Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1460D7B0FB5
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 01:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609197.948141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlePa-0004s8-R6; Wed, 27 Sep 2023 23:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609197.948141; Wed, 27 Sep 2023 23:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlePa-0004om-NW; Wed, 27 Sep 2023 23:57:46 +0000
Received: by outflank-mailman (input) for mailman id 609197;
 Wed, 27 Sep 2023 23:57:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x8T5=FL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qlePY-0004og-Fr
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 23:57:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a54b9c95-5d91-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 01:57:42 +0200 (CEST)
Received: from AS9PR06CA0632.eurprd06.prod.outlook.com (2603:10a6:20b:46f::6)
 by VI1PR08MB10123.eurprd08.prod.outlook.com (2603:10a6:800:1c7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 23:57:03 +0000
Received: from AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46f:cafe::d4) by AS9PR06CA0632.outlook.office365.com
 (2603:10a6:20b:46f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21 via Frontend
 Transport; Wed, 27 Sep 2023 23:57:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT040.mail.protection.outlook.com (100.127.140.128) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Wed, 27 Sep 2023 23:57:02 +0000
Received: ("Tessian outbound ab4fc72d2cd4:v211");
 Wed, 27 Sep 2023 23:57:02 +0000
Received: from 74008df298ac.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D6078077-EF64-4ABD-8B14-7F06238428F9.1; 
 Wed, 27 Sep 2023 23:56:50 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 74008df298ac.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Sep 2023 23:56:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB6105.eurprd08.prod.outlook.com (2603:10a6:10:20d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 23:56:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 23:56:47 +0000
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
X-Inumbo-ID: a54b9c95-5d91-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtCkp7ugLd4B/i5tixAu80fbaUEAWEUh/fHUs/BFhYc=;
 b=0v6sN2BnU4X+tbIaN5Vgf9oT+XIQTmG56uA/2PNNP9mWnMww2KFuBQWEMP90IHLrIyMDFJuc2kqTgU3dOYtQfZBu8DW12l/bp3IVV4OBFo6J6x7bwYDUa7RseGhH8w/cxpvs+uogg1DDtVb/RPjubFPvWKAdcQydgfuppEoyShk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cfd6e7def60a48df
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4qgoDKE4/Visj0j7e1V9GE1kWf1XrEJayxrTzxpH7Uhrni8eZv1Q3bnOlWZoL7rmjLTMzouFXJ9WTotciWCsS1n0Sx21V5wA8/RSpZbO7LyOzL0citaL6N/vEyKicZFvGWa1ow4DPcXkmS4vxw9xubklarBbmpWGseCYiq83d8nUOXUzL3dU4SlZDVzEZw4spZ38jgKBkseu2UcRCJbiXIxhmPIpqxJrLK9iAQznpx1SKNCPr9Zn/CoVyJQo+FYkattm9tubnsPtaM1KliuMn4TWtB3xxGjUOUmygMJ6bLVyIVhW3fYsNsNdIhkCKhnq74X4kZfvtq1SG7X8mwviQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtCkp7ugLd4B/i5tixAu80fbaUEAWEUh/fHUs/BFhYc=;
 b=TwOUgBa6w/lzZ4afgOayLKvNQt0SOAqpCxSmeUQuZzNeMYfIXc4cp35Pwe1JiNAWGWcykveI+m3QA0zaSdoy0MzyRFsfBK5JneZSopln1VDpkYbehBHhSOgTTkp8C+/HFLcGZWspXz9oNPMVsiPZnkhSyAq0KjSmxHXPaY2aAYMpifAnOb2I9g+gA2/i8FxA+e5FOb+AgNMS5XuCu2A9aNn/QvmmYWmP9/e6UHlgbB7fZ0pN9+jEewUOZzcG4jrsWJP3dVBgyQBKbcSrqWhbIi6zep6lWszQdh+uD9DtVc8QlE94Q2RtqsE+bdJg0cyLMDv1JkUKHoJ+plde+BvSqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtCkp7ugLd4B/i5tixAu80fbaUEAWEUh/fHUs/BFhYc=;
 b=0v6sN2BnU4X+tbIaN5Vgf9oT+XIQTmG56uA/2PNNP9mWnMww2KFuBQWEMP90IHLrIyMDFJuc2kqTgU3dOYtQfZBu8DW12l/bp3IVV4OBFo6J6x7bwYDUa7RseGhH8w/cxpvs+uogg1DDtVb/RPjubFPvWKAdcQydgfuppEoyShk=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, "julien@xen.org"
	<julien@xen.org>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, "roberto.bagnara@bugseng.com"
	<roberto.bagnara@bugseng.com>, "nicola.vetrini@bugseng.com"
	<nicola.vetrini@bugseng.com>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v3] docs/misra: add 14.3
Thread-Topic: [PATCH v3] docs/misra: add 14.3
Thread-Index: AQHZ4pLvPiwH8j4chkujiNUVRiOVPbAvdj0AgAAAPYCAAADfAA==
Date: Wed, 27 Sep 2023 23:56:47 +0000
Message-ID: <56C2CF5B-0021-4F22-80A3-3EB1F2BC6756@arm.com>
References: <20230908202723.1641469-1-sstabellini@kernel.org>
 <alpine.DEB.2.22.394.2309271649120.1403502@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2309271653110.1403502@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2309271653110.1403502@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBBPR08MB6105:EE_|AM7EUR03FT040:EE_|VI1PR08MB10123:EE_
X-MS-Office365-Filtering-Correlation-Id: c8102ea0-c4e2-4424-bf14-08dbbfb5723d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mQ5sWzgMxyYOQUFTdF/FzBjbg9R7eZvvFrgkYyTqyodVUvuSNr6smlPfUZt+6fheQ+YWTLXk6ggzERtP7oCj8hIDeu/foQYHXzNyMQrwfJTI3zz72c4WTYCR1Ag2/CpCpZsNvRowHxNy6DJfxPD/egs4lPnqJ8lYOb0v/tWN3vgnCSnY0TA58lDiX1M5zf4jrZIp8Z+ocvJjjJatI8sHoSX/8fTPJNoErgHeaXL9Yt7m9v79PhGGRn6h8kDNtczF3bQCl2IFrgEPZ565EqoSYPWouyTrCyt+b12W/x6ep0eq1KJqfM8h13lX0sncARlY44rz+AY95AGmo6+PT26EdSuKzdgqszPwCwQCQtuGZJkBGXtU/+ZVyLbPIzrJd4Tt5qDrZ1IzwcwBSHlb2JAKa4+fAS/u3QQTK9KT4y+IQirf+dcpf03Xaf0b6BQq3R6HbNck7ErY7pZC8PJ/9f0kcko23JfHjaWcgsrbl0KfmpdvyK1js77EDt9wWTJAAZqnjD2U5caYiKqfr0ica+ILqtTXLA4kE/ik46qZWVp+tO1zajzeKVJZcpU3HIAT+5mkUI3ZMkT1u+hn3R3XP+fgFL/gfqiXPfmBjY3gormiybslUDRTxOjZS4ZJl2Az3JTZSwikbk6jk9u26c4hewXts8LNgyDZKXTm7tABE1vhXk1N1yHETs8AfVnrea0wbTeM
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(366004)(346002)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(7416002)(8676002)(4326008)(8936002)(5660300002)(86362001)(122000001)(2906002)(38100700002)(38070700005)(71200400001)(53546011)(83380400001)(6512007)(6486002)(6506007)(478600001)(2616005)(26005)(36756003)(76116006)(91956017)(64756008)(66446008)(54906003)(66476007)(6916009)(41300700001)(316002)(33656002)(66946007)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5D5BBDA1254B354EA8504BF97094EF53@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6105
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b024110-20f2-456b-00e6-08dbbfb568e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rTnjDmXRU4AcBDfvKxd9JCqezcsi9VHrZYAOJ3C7aeuOv7TpjX81BRJ16MUvFeGi2F+14H3TZ3lhzRHYc3XileLRqMbYEZ78Yn8S+/BMTaMwQtd8luTfjWBbq2vD65OIqS6/5lEjPpN1Wt5dW+Lk8TDmtuVoIngokxaPI5S7GKw/JlzvCXAnLcmzQU7gmohLh3bvaq8MzlcytJV+gaN2jJVDHyTHaX1CRdSjnG53FG9UkeqVrxpHamHPZxaPeDCbe406gQpaRI6GjVUoxVAaBgF9LN5kMs/bHI5L/aewOyOgcrRBGTBdyVe8mkPeJ0mahj4WA023w6PrqTghpwo6YSU+Jmvn+4BGcoDNzWDjDy+NNr91peDUfxpqP0voM73JmftoAznnPp5w8p/d4uZfH3hnG0POQJzVuokCsDEXpFdhWdtl0UcY78tBskYz/ijCnBJaGVA5iIaUCqzjuzAs4do80fQyJdAtwiF62g2falkO65Gkl5ZmPAr9h9839lTdbN9bFdNm2NNtR5iORGnM+JarIuuQ1oPLdwflD3J9Ypi65Hn40yIqKjBSDfhQ+xIyjCQGQw95o93fNmO8ZxZgbXizmy/sVBGyLFgtcwHZcJphqKz9T+SPAG8Dx+Ig730btbT48cpZMsw0gP3nERF/ftoG+Wl92QWzO0nPxEzlY+Sv2qv5YfXdHY48/PoQlBLxcYmEOFoK2j43N0fEjxCPhgX6jG/TZ9kUWY/dtrbnoMdgfmw8/Lw8HaMJ6vMEFXhmo+yipJLqk/XHNScWthr3xA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(136003)(39860400002)(230922051799003)(82310400011)(1800799009)(186009)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(40480700001)(6506007)(82740400003)(47076005)(2906002)(356005)(6486002)(40460700003)(83380400001)(81166007)(36860700001)(6512007)(54906003)(70586007)(26005)(5660300002)(53546011)(478600001)(8936002)(41300700001)(336012)(70206006)(4326008)(8676002)(316002)(6862004)(2616005)(36756003)(86362001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 23:57:02.9067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8102ea0-c4e2-4424-bf14-08dbbfb5723d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10123

Hi Stefano,

> On Sep 28, 2023, at 07:53, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> Actually adding Henry
>=20
> On Wed, 27 Sep 2023, Stefano Stabellini wrote:
>> Hi Henry,
>>=20
>> This patch is now acked. Should it go in 4.18?

Sure, a doc change should be harmless so:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


>>=20
>> In terms of risk of breaking, it is zero as nothing builds or runs based
>> on this document.
>>=20
>> At the same time, the benefit is also low because the main value of this
>> document is for future coding changes that would be too late now for
>> 4.18. So the benefits of committing it now are ease of keeping track of
>> the change and positive PR when we make the 4.18 release and we talk
>> about the total number of MISRA C rules we adopted.
>>=20
>>=20
>>=20
>> On Fri, 8 Sep 2023, Stefano Stabellini wrote:
>>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>>=20
>>> Add 14.3, with project-wide deviations.
>>>=20
>>> Also take the opportunity to clarify that parameters of function pointe=
r
>>> types are expected to have names (Rule 8.2).
>>>=20
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>> ---
>>> Changes in v3:
>>> - add ,
>>> - add switch(sizeof(...)) and switch(offsetof(...))
>>> ---
>>> docs/misra/rules.rst | 15 ++++++++++++++-
>>> 1 file changed, 14 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>>> index 34916e266a..ac76e20a9c 100644
>>> --- a/docs/misra/rules.rst
>>> +++ b/docs/misra/rules.rst
>>> @@ -234,7 +234,8 @@ maintainers if you want to suggest a change.
>>>    * - `Rule 8.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_08_02.c>`_
>>>      - Required
>>>      - Function types shall be in prototype form with named parameters
>>> -     -
>>> +     - Clarification: both function and function pointers types shall
>>> +       have named parameters.
>>>=20
>>>    * - `Rule 8.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_08_03.c>`_
>>>      - Required
>>> @@ -385,6 +386,18 @@ maintainers if you want to suggest a change.
>>>      - A loop counter shall not have essentially floating type
>>>      -
>>>=20
>>> +   * - `Rule 14.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Examp=
le-Suite/-/blob/master/R_14_03.c>`_
>>> +     - Required
>>> +     - Controlling expressions shall not be invariant
>>> +     - Due to the extensive usage of IS_ENABLED, sizeof compile-time
>>> +       checks, and other constructs that are detected as errors by MIS=
RA
>>> +       C scanners, managing the configuration of a MISRA C scanner for
>>> +       this rule would be unmanageable. Thus, this rule is adopted wit=
h
>>> +       a project-wide deviation on if, ?:, switch(sizeof(...)), and
>>> +       switch(offsetof(...)) statements.
>>> +
>>> +       while(0) and while(1) and alike are allowed.
>>> +
>>>    * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Exampl=
e-Suite/-/blob/master/R_16_07.c>`_
>>>      - Required
>>>      - A switch-expression shall not have essentially Boolean type
>>> --=20
>>> 2.25.1
>>>=20
>>=20


