Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BB57B1012
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 02:34:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609217.948171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qleyJ-0005so-At; Thu, 28 Sep 2023 00:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609217.948171; Thu, 28 Sep 2023 00:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qleyJ-0005qK-6Z; Thu, 28 Sep 2023 00:33:39 +0000
Received: by outflank-mailman (input) for mailman id 609217;
 Thu, 28 Sep 2023 00:33:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OL7R=FM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qleyH-0005ou-A4
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 00:33:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a888211e-5d96-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 02:33:34 +0200 (CEST)
Received: from AM0PR10CA0094.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::47)
 by PA4PR08MB7481.eurprd08.prod.outlook.com (2603:10a6:102:2a5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 00:33:31 +0000
Received: from AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:15:cafe::16) by AM0PR10CA0094.outlook.office365.com
 (2603:10a6:208:15::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21 via Frontend
 Transport; Thu, 28 Sep 2023 00:33:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT035.mail.protection.outlook.com (100.127.141.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Thu, 28 Sep 2023 00:33:31 +0000
Received: ("Tessian outbound 9aeaca65ec26:v211");
 Thu, 28 Sep 2023 00:33:30 +0000
Received: from 3de3e2841157.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EF12595A-E193-489D-B593-530B5E5FD98E.1; 
 Thu, 28 Sep 2023 00:33:23 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3de3e2841157.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 Sep 2023 00:33:23 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB7331.eurprd08.prod.outlook.com (2603:10a6:150:1e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Thu, 28 Sep
 2023 00:33:19 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 00:33:19 +0000
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
X-Inumbo-ID: a888211e-5d96-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcuuJuvaqAUuWv16bW0td/B6blOy9u1DhFo24UzzdIE=;
 b=Q8Mp+GEL6OhjzpcT0+eLuupVh6Pm/j23berBdlbEU7NcnW0dFdkBcj2wsOkCIDNWZEsKRC255O6aB82PECRQMPqBtqqupwmlGvgOvPtAjj+q/+7g9WcwFERDe++qTJ2uqV+/Dw+ttguvis39dn5K3VfWTZAArzaAiKANrIxJkqk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9c6dcce1f2514d39
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncY1WRhNJf7jmqOGvBZnW9ouJsHgG+CaPf5CwJOi/IkXCnPHVp6vYgNeif7ZyUFjp/dIhY6W2U41KxeDQmkjK2JbtEyhto2fNsoDoMK+sAaR7xsjtaJkbKUjoVOAOHOBGrCn09zJ1PR63aeDjLE0QS6SP44jmN0X/2YXuTHXahIs0+ScWfsBmIPmaj0vmfe8PvtlHK2F8hsPlhQ/p+d/XyFew1D26sXX+s0a2sFMgCng574icd3oERqcJirdSPLxbW8gJJe1C+s6XR9NWy8Dp1v9LkhSJ3DPO8+AZcjiAJqtU4jRGSltLupDeSTQX4pBSJF0yRzGM5DENmCv+uqEbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcuuJuvaqAUuWv16bW0td/B6blOy9u1DhFo24UzzdIE=;
 b=Pnp7JQdSpQpLh14mAlXk4JYmKzQVcTyWOiG/RnMlbHW6Cgm4NNp6WZfei5u3KiJaxn8wxlFNzAgAxC2v28Y6+vqrPip+KYCR2IxTJOm7rETR9WYe+WRTBjJU2jBtbFBar5o+WZ83cBmlqaR17Fh419lD1u7ZzHFtIZHL/XXJBiWNo2Dz1rfOxf0QXURhG2OTtOvSlkcg548yRgTUdeN29/8sLxb/5LoPgtatXGVzlgjk6Ql/riJPH8VoZc/wO/skRxj0p2Tq42vSvtFqQYCwtrt4/+NtSkGlXuOmehwi42mnGjBHfbVbiiJ9gOFMj4/4t2mJ0OWmtxPapnElTNGqvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcuuJuvaqAUuWv16bW0td/B6blOy9u1DhFo24UzzdIE=;
 b=Q8Mp+GEL6OhjzpcT0+eLuupVh6Pm/j23berBdlbEU7NcnW0dFdkBcj2wsOkCIDNWZEsKRC255O6aB82PECRQMPqBtqqupwmlGvgOvPtAjj+q/+7g9WcwFERDe++qTJ2uqV+/Dw+ttguvis39dn5K3VfWTZAArzaAiKANrIxJkqk=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "julien@xen.org" <julien@xen.org>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "roberto.bagnara@bugseng.com"
	<roberto.bagnara@bugseng.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: Re: [PATCH] docs/misra: add rule 11.9
Thread-Topic: [PATCH] docs/misra: add rule 11.9
Thread-Index: AQHZ8N7MEETcH3eGqk6AvXqds6kzgbAuVA8AgAEN4wCAAAMBgA==
Date: Thu, 28 Sep 2023 00:33:16 +0000
Message-ID: <D38F282B-27C9-48B9-85A7-24A9D0858FCF@arm.com>
References: <20230927010538.1778201-1-sstabellini@kernel.org>
 <068B9E0E-8EC1-47AC-9D24-64ACD9994013@arm.com>
 <alpine.DEB.2.22.394.2309271721482.1403502@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2309271721482.1403502@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB7331:EE_|AM7EUR03FT035:EE_|PA4PR08MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e2cc68-0572-464c-8ef6-08dbbfba8a74
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7pyzGKpppCST8QU/pVJj28YNbY6My3AIvjGJO5pgkgWbjQg6VfZJ7wcAoRJfv21rQEMnvkA9ZAfy1ypqrPyBz4SlWSya96Ost6HqHbI+efkcs2vAJfm8Qumyok0/NOmZtvM3O55nZeT5I0L5nNdKvxzl7LnezwFqcwvloKxNA/7mijIWU8cZUXLfe78SStAzrY0wMevEbQ1W+Rf5pdka1SM7yETUg9f8D2Doonrpbj07/0OpThntHZpdACi8Fo/DI/dPwjOf970EENxI9Ls4cMDaswBQeUliryvb6UGI4+EggZesHMVvQxfALNblmEsRMZRcNUJsNR7Te8/dbi0U+pZ/hUnyrN7cBMWFObrJcUrILkHe5NsREcw3nwHQOmh1amTpZiI2853Xte6FDsl0ZLMzyXZtV/T0hu83pdoNXLszAJxgN7MDYoTtL+1zfMGHkTEmzvhimYDkuoGRxTP/7DrAAXzpKxfFlLugQ41qnPtm3S5dYR36H9e0gGblitacDE4wEgoLrgTQWPEsOUgJUKqy7BGbw1CgweC2lVrzcPwgpKecpHtBNFKYJBIYBzE3BrAak9XsgMfCTxTyx8vhFn+lX15UZP4NUpEJfVhlGsZdu9V/k2WDIDWEJsBtjTuCgbVt/w6d7RHiav2dVgVWlddIQdq4q1Te8ET4gQ7e0SsuRG3ppPYpGMnsLbfiitxp7DejRJuK5tulvvzgjoyVeZAyNzv0upJTnoVtUhs7IjE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(136003)(376002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(91956017)(2906002)(76116006)(316002)(26005)(2616005)(66446008)(54906003)(64756008)(66946007)(6916009)(66476007)(66556008)(41300700001)(71200400001)(6666004)(8936002)(4326008)(6512007)(8676002)(478600001)(6506007)(6486002)(53546011)(33656002)(86362001)(36756003)(122000001)(38070700005)(38100700002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6EFFDBB79E5FCC448B223120BFA8FA71@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7331
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a08d870f-5146-4d2f-f9ec-08dbbfba81b9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mhNZXTMLreylY2DIoX7gAtycTe6cxeS4YRrTqkrBwMOIpKtFphAJo7kYFlkGyupxPfSh/3s7wMp9rEx+W9Zp+C3nibqfSYwMqTdJS5xxQ/nxLkqKhRFN63KMebDGZI11APfYqfbtCD2L3aa93BKBW7ba2Iw8izeiVocCj+Qhdo4dow2rvYqo/6AqS4/+bc0hjXOgQD9r8rcichLClWX+4/XifRs9LHkYf7oigIxBnS6cuuKWS/K6wuunQyiJq+MHa+xZoCzVKraffdKMY71tgMix8+qwsQLCMF0ptEyBMfz26PdhncoWkZdMMB+z4bACueqVITNKVjuZF6EPXYdnK0HzXsZb8oYrskXqpHl2mo+5kukLlPkgz98bwCW+lBmKod4vLTv0PMZ90Kvgpi/xXHgHVSgS3wFs0E2COCXfZxkOEzsx0Ekk8hRFlWyf9OweddqISatCxh1yke8uBRNhoffnpLFn9NvIm3ozjFtbRlsg6Jo9blwfHDWyGzJeUYX9mzhA1xB5vfKwHCM0fMVlKx9vWPSaw6D7uw/dS0vxzyCml7dBQLqs4+dQ3Evpg/oxG6+4wmqho1oB+hKy2kO84geDXUcigGS0j6n+PSi9l6XZzqyfTdFFiMUF6CT6kE7YIt380abyimX53fV1NR3FGsxbu5L3PDXGpV5oqt9nqYhwWDfvVzVuM+XGFad1EAF6kvrAClAizM/hqtUUULzE9jhDK+KfAsl0VJJZH2b/fSXsNGz9WSzDE8DlEvoIlpW1AspZ92g+l5gVkGinz5bXaw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(82310400011)(64100799003)(186009)(1800799009)(451199024)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(47076005)(356005)(36860700001)(82740400003)(6506007)(81166007)(70586007)(53546011)(54906003)(6512007)(6486002)(5660300002)(26005)(4326008)(70206006)(478600001)(8936002)(336012)(6666004)(2906002)(8676002)(41300700001)(6862004)(2616005)(316002)(36756003)(86362001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 00:33:31.0149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e2cc68-0572-464c-8ef6-08dbbfba8a74
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7481

Hi Stefano,

> On Sep 28, 2023, at 08:22, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> Hi Henry, since we are doing doc changes, would you also agree on this
> one?
>=20

Yes, same as the last patch that I just release acked.

Kind regards,
Henry


>=20
> On Wed, 27 Sep 2023, Bertrand Marquis wrote:
>> Hi Stefano,
>>=20
>>> On 27 Sep 2023, at 03:05, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>>>=20
>>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>>=20
>>> Following up from the MISRA C group discussion, add Rule 11.9 to
>>> docs/misra/rules.rst.
>>>=20
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>=20
>> I agree with Jan on dropping the "integer" word here.
>>=20
>> With that done:
>> Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>=20
>> Cheers
>> Bertrand
>>=20
>>> ---
>>> Rule 13.1 also discussed but it is already in docs/misra/rules.rst
>>> ---
>>> docs/misra/rules.rst | 5 +++++
>>> 1 file changed, 5 insertions(+)
>>>=20
>>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>>> index 8e7d17d242..28dc3a4d66 100644
>>> --- a/docs/misra/rules.rst
>>> +++ b/docs/misra/rules.rst
>>> @@ -373,6 +373,11 @@ maintainers if you want to suggest a change.
>>>     - A cast shall not remove any const or volatile qualification from =
the type pointed to by a pointer
>>>     -
>>>=20
>>> +   * - `Rule 11.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Examp=
le-Suite/-/blob/master/R_11_09.c>`_
>>> +     - Required
>>> +     - The macro NULL shall be the only permitted form of integer null=
 pointer constant
>>> +     -
>>> +
>>>   * - `Rule 12.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_12_05.c>`_
>>>     - Mandatory
>>>     - The sizeof operator shall not have an operand which is a function
>>> --=20
>>> 2.25.1
>>>=20
>>=20
>>=20
>=20


