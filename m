Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4AC7D1059
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 15:16:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619770.965383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtpKd-00053v-GJ; Fri, 20 Oct 2023 13:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619770.965383; Fri, 20 Oct 2023 13:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtpKd-00051m-Dd; Fri, 20 Oct 2023 13:14:27 +0000
Received: by outflank-mailman (input) for mailman id 619770;
 Fri, 20 Oct 2023 13:14:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NyWa=GC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qtpKb-00051g-O4
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 13:14:25 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96a42b06-6f4a-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 15:14:24 +0200 (CEST)
Received: from AS9P251CA0002.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::10)
 by PAXPR08MB7333.eurprd08.prod.outlook.com (2603:10a6:102:230::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 13:14:13 +0000
Received: from AMS0EPF000001A8.eurprd05.prod.outlook.com
 (2603:10a6:20b:50f:cafe::68) by AS9P251CA0002.outlook.office365.com
 (2603:10a6:20b:50f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Fri, 20 Oct 2023 13:14:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A8.mail.protection.outlook.com (10.167.16.148) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.23 via Frontend Transport; Fri, 20 Oct 2023 13:14:12 +0000
Received: ("Tessian outbound d1b3e404ba03:v215");
 Fri, 20 Oct 2023 13:14:12 +0000
Received: from cb7aeb85453a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EE56D482-564E-472C-8048-66ADAB30721C.1; 
 Fri, 20 Oct 2023 13:13:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb7aeb85453a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Oct 2023 13:13:31 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by DB9PR08MB6441.eurprd08.prod.outlook.com (2603:10a6:10:252::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 13:13:27 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::7d2f:80d6:9244:3266]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::7d2f:80d6:9244:3266%7]) with mapi id 15.20.6907.021; Fri, 20 Oct 2023
 13:13:27 +0000
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
X-Inumbo-ID: 96a42b06-6f4a-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERDxOXiZz7Oa2qagXONdttbfInGFqIn9hprZgcUwVak=;
 b=r3sApzFyZSg+Bv9pojbmBnDQC7KsEQzc0SIp1tLoqzi0w+8hQOppvkibdPNjDiZwwKPaLD50X8CK0RqWSPkuegxodeJLWeyIf5mrQpKQSORjN+sMdryUWgz/gKltvxCV1OJHGsfMGpnydl/etkiak9/VJ5jtK8YLAuOQvhGzfSs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f6b136b397fd3479
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNObe2IMXUBDmlAQaPDqCoo8EdyUgpfwg+2L9nts5jvvVmVllsrFTfDcDaklreczLkX6Iztft2AntguC8WSb/5+gzGwjvLQwWq6UI/P6KKbXPvSEQ8hiXXyqoNLCofmU9ccdbthzkLvhkNEqiOXBlNdlnd3Z8gH8tvjHyORbiO/Zd5wO+MNqx9nvmkvtCs1p2wpf5xOlRfTEVGK/UR9/Ugm+Sr9cHI2HxWRqn6T6rTTMLc1Fyds5VmTzsMNye9SoWws92AmJLRAWxHXZGFgN+eo6h6CjgSnW/Lpk19WaNgXbF72OIQwl6G5Xi3bbXBQxBy3bCd16/flp6AJLIQOfzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERDxOXiZz7Oa2qagXONdttbfInGFqIn9hprZgcUwVak=;
 b=Rntxf1eAfs/1wovpQbNBqiseULumFn19XydQSKTd8yWUm7jg1rD17Lh23nRO8nhiF3k1SDCbO4jexm7HgMLw7x2cywKbl9pOcsZyjRt4eCnUz4JSWatmjl9B1DPMOh2Aqh1Sr3GaH6hwEbfy3ABfI0YFkdO1CeXtBQkRSzRDtSffC1luKU4Bqe0OJ6BELrtb9LXWFMktlcsS00yhSsCu4LZfUCLgVhV9S1LvQJUIJxdMacem8pjoWXMAYUz6Btabsuypu3hetPK7v09Akia68dNf3vsIyX2YiMWvOvDcA53/wukIV8ZOJGLvvqSgy6f75OsYyFW2ezw2j2l0IZlRcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERDxOXiZz7Oa2qagXONdttbfInGFqIn9hprZgcUwVak=;
 b=r3sApzFyZSg+Bv9pojbmBnDQC7KsEQzc0SIp1tLoqzi0w+8hQOppvkibdPNjDiZwwKPaLD50X8CK0RqWSPkuegxodeJLWeyIf5mrQpKQSORjN+sMdryUWgz/gKltvxCV1OJHGsfMGpnydl/etkiak9/VJ5jtK8YLAuOQvhGzfSs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Jan Beulich
	<jbeulich@suse.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, Simone Ballarin
	<simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH][for-next][for-4.19 v2 1/8] xen/include: add macro
 LOWEST_BIT
Thread-Topic: [XEN PATCH][for-next][for-4.19 v2 1/8] xen/include: add macro
 LOWEST_BIT
Thread-Index: AQHaAsacg3neJ95wsUGZXLbST/LDOrBSqNIA
Date: Fri, 20 Oct 2023 13:13:27 +0000
Message-ID: <93F0B739-367C-4DFA-9F53-0C2C58FCD756@arm.com>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com>
 <93408661-721b-c4b3-d504-e65142bbdaea@suse.com>
 <42ee4de54f6d9bd80fb50db3545cbaf4@bugseng.com>
 <08286993-6a83-b928-6398-e129397927a0@suse.com>
 <9002a10f872fccc5217faab2f20ad5ba@bugseng.com>
 <alpine.DEB.2.22.394.2310191253440.2099202@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310191253440.2099202@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|DB9PR08MB6441:EE_|AMS0EPF000001A8:EE_|PAXPR08MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: 4842f9ef-2039-4334-722a-08dbd16e7432
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 s7kCMHgMC2QWXbGR4w03g7EO2Odzi7BJN3I2gdvOlrmnwTK3Jc+mGfE5IB7pNhRYtgBqh0bSHFzI3vWaNnT/PWS/w3s8R++mDBk6MYl7BLQD/qGaenqJvq7rUsYZlb9oAX6Y1UyiyF/HoME8uK9l7xAImiQjhr/eWYwzOMT8rdiQlyZMZ+cZBmuiA7iOFgjbzrwLV23+TJzPMEdah9ZYhrw+IgDA73mAcBD9NPzPEi9S1zFJMdlvrjf6p96R99GIwR1pybzIq/t8xxIkJUoTOVJ3jKDR5F31YNhRBU61bNDUor8/LN7zqxibmte54MUYhGngdWKs8V20HzLA4MKREPUGb4mDXT63nxWoDlF3quD6dhUiQX8M2/DxSzmHydOl8cIf3RylIRsXZFU8mu88eyyGTzh4D1tvFcoQHGDz8N6a2rHkXL6jS0r54HxH+qLymkg8saybpdODDhy5LAOfZb7+7n+6CfTyAzQbrLcqhIh2cJW4YzeLr9s/if7/Rsi8ZcmzH3GJbaDZxQNwdGg/8Wvqf1CSIoBNf6GVO/NSK58PHUTGFXaRaYTHM8M+is3ths7V9aTekghtSnr3Uk8EHW7oxFqXbcgpfQIPrqcVMmPpNqcJgdxgy3RioGZ23y7RbJj6rsfQGmUQb7MBCy4spQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(7416002)(8936002)(8676002)(4326008)(5660300002)(2906002)(86362001)(64756008)(33656002)(76116006)(122000001)(66946007)(38070700009)(66446008)(66476007)(91956017)(66556008)(6916009)(54906003)(316002)(41300700001)(38100700002)(36756003)(6486002)(478600001)(71200400001)(6512007)(6506007)(2616005)(26005)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <170F6BE1852B7442B72B11DECDB15860@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6441
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	84991359-43f9-4740-f3f6-08dbd16e58e3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PdMVRCMEGh6RvcqFMe4sQU3IS169qA3JzgZ75WmZ5jxedpn2Iu4PdnGtHv1Vqa4G8qoKsoLmENwltzf/0OZ8NX4mKS7wr/0TdkImRGxZlwDxwjIydoYnC4sAsN2FvQj662DevYhqi5T+77UTCqNRhbL5ZCKLP8l1x8dj6uNuZZHjC+IlDslM04hb8n1ifZwhDnowknEp7rntdp9K2EBmYYpXqw0hJwHjmkF9Za5JbVG/LUWWaw6ijUVR0YIxU2re0qo/TmQkT8RUFmK2d1xMbSMM3WhEXX4kEzhSTff1c5LjebEEFJgPj5bBY2Mkkdmn/ikl3Ebzal5kS4jgZ/pAuWILYWzbXYCjhoGC1S+aCSboZYeAOqDLfTqSP+Y6Yq3kpOmInfxD3Kw+tVRupPtfHmMUwHEWdwlGoB3B9f+uWZnt2Z5nQrjhnEsPpd0MMpnspnjdwSREIde9QfzGvlSfZlf2ALZyA6aj76VLKE/JTCbk7169EbJoO2o8v1lzY2eNp+mX6sY1S5N8wASZCaTMKbBeoHMZJuS8gTmBrsPqJH9Wjpp6wSdZlDY8GGYiQP9q4dUrXYizBHfWgeQ1Vw9JETNorHIVP+0lxW++rgf2xvrEhSdoV8MLtTRYBgcU4PkpLQZ10/DC1VNfVII5DXYWr5I0/PMLfI/MneVoiwGtks2i40ZcBSYK5Xwh/Jvy2yCm5Z6HQ6mu3IfBQBoldPPyUatryw0kL0fR9t4+t9RSifDZrJuSq3R4hano+h4PSQqH
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(82310400011)(46966006)(36840700001)(40470700004)(6512007)(6506007)(53546011)(2616005)(478600001)(6486002)(40480700001)(47076005)(336012)(26005)(2906002)(41300700001)(70586007)(70206006)(54906003)(316002)(4326008)(5660300002)(6862004)(8676002)(8936002)(40460700003)(36860700001)(36756003)(33656002)(82740400003)(86362001)(356005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 13:14:12.8659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4842f9ef-2039-4334-722a-08dbd16e7432
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7333



> On 19 Oct 2023, at 20:58, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> +Luca
>=20
>>>>>> --- a/xen/include/xen/macros.h
>>>>>> +++ b/xen/include/xen/macros.h
>>>>>> @@ -8,8 +8,10 @@
>>>>>> #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>>>>> #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>>>>>>=20
>>>>>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>>>>>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>>>>>=20
>>>>> a SAF-<n>-safe comment here?
>>>>>=20
>>>>=20
>>>> One reason is that now that violations only belonging to tool
>>>> configurations
>>>> and similar are documented in docs/misra/deviations.rst (committed in
>>>> Stefano's
>>>> branch for-4.19 [1]).
>>>=20
>>> But tool configuration means every analysis tool needs configuring
>>> separately. That's why the comment tagging scheme was decided to be
>>> preferred, iirc.
>>>=20
>>>> Also, there were disagreements on the SAF naming
>>>> scheme, and
>>>> patches like those would not be accepted at the moment.
>>>=20
>>> Well, that needs resolving. The naming there shouldn't lead to patches
>>> being accepted that later may need redoing.
>>>=20
>>> Jan
>>=20
>> While this is true, in this case I'm not willing to deviate with a SAF, =
given
>> that
>> some ECLAIR-specific configuration would be needed anyways, given that I=
'm
>> deviating a macro definition, rather than the line where it's actually u=
sed
>> (and maybe other tools would need
>> that as well).
>=20
> Did I get it right that the problem with using SAF in this case is that
> it wouldn't be sufficient to add a SAF comment on top of the MACRO
> definition, but we would need a SAF comment on top of every MACRO
> invocation?
>=20
> If so, then not just for this MACRO but in general basically we have to
> use deviations.rst.
>=20
> Luca, do you know what would be the behavior for cppcheck and/or
> Coverity? I imagine it will be the same and they would also need a
> deviation at every MACRO invocation, not just the definition?

Seems that cppcheck reports at the macro definition, instead Coverity repor=
ts
at the macro invocation.




