Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A8C6E74E0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 10:21:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523244.813116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp33h-0000bw-Ql; Wed, 19 Apr 2023 08:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523244.813116; Wed, 19 Apr 2023 08:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp33h-0000a7-Mb; Wed, 19 Apr 2023 08:20:57 +0000
Received: by outflank-mailman (input) for mailman id 523244;
 Wed, 19 Apr 2023 08:20:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUCI=AK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pp33f-0000Zq-QE
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 08:20:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19ecdd46-de8b-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 10:20:53 +0200 (CEST)
Received: from AS9PR06CA0498.eurprd06.prod.outlook.com (2603:10a6:20b:49b::24)
 by AS8PR08MB9148.eurprd08.prod.outlook.com (2603:10a6:20b:57f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Wed, 19 Apr
 2023 08:20:50 +0000
Received: from AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49b:cafe::68) by AS9PR06CA0498.outlook.office365.com
 (2603:10a6:20b:49b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22 via Frontend
 Transport; Wed, 19 Apr 2023 08:20:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT045.mail.protection.outlook.com (100.127.140.150) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22 via Frontend Transport; Wed, 19 Apr 2023 08:20:50 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Wed, 19 Apr 2023 08:20:49 +0000
Received: from 5d26f3ffca9f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9A6A76D4-8C8D-43F4-AC6E-0582F8A18CDB.1; 
 Wed, 19 Apr 2023 08:20:39 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5d26f3ffca9f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Apr 2023 08:20:39 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6278.eurprd08.prod.outlook.com (2603:10a6:20b:29a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Wed, 19 Apr
 2023 08:20:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 08:20:35 +0000
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
X-Inumbo-ID: 19ecdd46-de8b-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnIlT5mr9sMgHW/Ip/R/sIvrNzIy+ngtAL3XaHMdcGA=;
 b=TXa+nlplVHZHiVUu749g98IdIeb2j0qMFS/WbhyuRHivzc0odC9priKpLozUQDTEPKNcLt/YkfwHUd4D+ibsT6VdVGJKyc2kgyuq/3q8GRfld1ulgyLWBA5tzEcgkg49FhaXDO2TlmQghaGrsasHy+1HRY7iVst2DoEgjlOdHi0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 51d15056cb0db813
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ek8v7+Sl0YOlOLRAy1aNwA1FoxJbyLzRFCFmOcwiHLjpbps0uzvUSFVIq5qaao29WJsxKNSwck1GkmfL9rM0fiqzv7xkM7+cle5H/94sDiKgOnAKcp/fyLrTbMn48XNR+Lq2JLTVZDQKvqD8vcZPP5IP5WKix5mTTENRL3oSDHZsne5Tbssu1q1q77uDkeYOtjLH2WJwgYtI8c7ZFEPQ44bcrF/iEyqjLq+qQ8iCD/0jen6G/5uGhlehO398/IW3vfdEMWZ/uXeNBukKxBuuD4/YsvK57mS9qYQcxlLFCMGVQl2WzvKHsqgpKB195UfrJ6BRh/Erc7gtoitI3vH6uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnIlT5mr9sMgHW/Ip/R/sIvrNzIy+ngtAL3XaHMdcGA=;
 b=XN/EdtSY1Lj0o9MVurYYh3zxRux/G0xHGn259EhNWQySsOteYWFunhNA7A8UAcghyj1nE+Fq5IQfGdf5dLTFVIK+28PZ29oeRFUu4byFn14HiNkCpEmFBMRhPHmgVcmSZBSFOLcAB13EE+325B0waSwYtusV9kDuduCphl+Z2NGURKAPtyFMPjNjJOYKtrBix34bGFuEe6Vajdh+qX7YuHMILWPLEuAuz0srpQ3WeesYhVairkcdg4IDrCv/I6PzdaOCsBrFYwmdqwDH6PKXnj6u6ex3cT1MlFxCSowEoLqo1vZkO/GiK6jEtyBa4NThsTc4a0/jLItRR6pp9qB6eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnIlT5mr9sMgHW/Ip/R/sIvrNzIy+ngtAL3XaHMdcGA=;
 b=TXa+nlplVHZHiVUu749g98IdIeb2j0qMFS/WbhyuRHivzc0odC9priKpLozUQDTEPKNcLt/YkfwHUd4D+ibsT6VdVGJKyc2kgyuq/3q8GRfld1ulgyLWBA5tzEcgkg49FhaXDO2TlmQghaGrsasHy+1HRY7iVst2DoEgjlOdHi0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>,
	Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>, Community
 Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v5 00/12] SVE feature for arm guests
Thread-Topic: [PATCH v5 00/12] SVE feature for arm guests
Thread-Index:
 AQHZbSQqKlfgrZX3xkqta7+H+1gq3K8xFMoAgAAUHYCAAQ0QAIAAEaQAgAAGAICAAAewAA==
Date: Wed, 19 Apr 2023 08:20:35 +0000
Message-ID: <7614AE25-F59D-430A-9C3E-30B1CE0E1580@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <08BE4F94-C4B5-4B05-AD92-61C5C5D24F39@arm.com>
 <bdb1b5e3-c3d9-1c39-f7f7-8f48157ba7b3@xen.org>
 <4cbaaf12-bd11-ca04-eed1-f8848290a692@suse.com>
 <C21BD176-AD46-4379-947F-4271D3EE05A1@arm.com>
 <5f5b65eb-d1fc-271a-02db-aa347cc708e9@suse.com>
In-Reply-To: <5f5b65eb-d1fc-271a-02db-aa347cc708e9@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB6278:EE_|AM7EUR03FT045:EE_|AS8PR08MB9148:EE_
X-MS-Office365-Filtering-Correlation-Id: ea619a0e-4007-48af-86f8-08db40aefc34
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4Jt6+F+NIuby9q9uW5hsoJYySaZB3uW/6kOL7c2snW6OX/UoPMBYv8YO6GVc+cHWIGIlg/FeBqCu4ZFszDzfx6l3ha+9bWbJSx1wsUQi6U5T45j9g5z6cF90T2mnmx9oMz/xy/3xlLGcLar04di3HpwSm/FZE77EElY+AOke57LjjDOX87DORwHUmcnmGfkvrDZuwXTllbYGRPiqOEqToupRpNXWo6URdBrZYfD9l8NKDFX59i7wJHYGKQmu+ypXAj6lG8abS0A0ng6ENRZR0Z4pzr2S248+vovyjzUuunQ1MErlnjNWIhPmbcR57uEBQ6YCxaoHCgDHmqoKDM4Jlr+dpXN3vQ1igDg0K0GTrGLYn8ohJwEXWROt1JO13LzpwWMoeneXYO9UgAzNy02olZB9H3Nkx71RIoy5uHpuaIwVRmFJg+TTyj7KUrK9PTpKDiHirIHVu68rbjldl3PIhL1e5tgB4WGyMxYQegaPIyuZ3btwqGhtn8ebDxR7g070XV8F21TAXOJ2bu1/jml6ThVNTGQHegbYBygCRJp+eG+6wGwMJzT897ITevyR6cHp1jUwBJItojxflKfIJxd6U7oW4ZyunO9qZesZLfgclG1XCPceXnvN84DNLFLvluTqy1393wGbV17eTmm7q5ITvQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199021)(53546011)(71200400001)(54906003)(2906002)(76116006)(91956017)(86362001)(2616005)(66446008)(66946007)(64756008)(66476007)(66556008)(4326008)(33656002)(36756003)(38100700002)(6916009)(316002)(6486002)(8936002)(8676002)(186003)(7416002)(6512007)(6506007)(478600001)(38070700005)(5660300002)(41300700001)(122000001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <40008235A1FC8C41BA2F653D45952279@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6278
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a46fecea-3b9b-4197-b727-08db40aef330
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sczSuQIWEj/eRNK6OJ0milWoovWbbS2pk0j4hLOo4Z2qJLdmW7abVo6gjrPk3RJwCsK/0QbxCoFBpDtA9nr0vwj2i4FaPcwNGR78zJC5qosDPN7kpkT4AaGNuyraZrzIZvCP0K8e++uu5BNOBUwYD49svhL13S3scKgY9KTEDml0fmX/TgqrzqbMJEK5QtZVvfa8wO/a8xA1XHIV7dOflAacECXh7zTCwcuJoEeFrecnFxsOg1tkR3qIuA5a0SUDG6jIz2IcWD2nNdK6cL+HERfuKnEn63UCPNP9WV3k9fAk+n57noss+36cY6D0kkNlgN+gtPNO4H1JfFkUM5aKR8wmREFcIp5iHxueXd/8N5riXrFQZgqy9NPcFTEi98s1gMTVtZn5X6PSXB0Xtz6jC9r6ZtW+Zv2bg5lChHINEVcNY3i2INKM+JiIVwG6sn2wdT8vywaGNQVdwvlBPilLKs0anL0tEC6E9eQIZiJXMCBWY5hboy1VPicy4Xo98s5oxwRZr3mgYOz5CuWq2j8rghGqSreWpGs38FYjjoJy19Y1cxVhKXIOuE2u/VoMt49dn31/riBtJSTSM4RaWENuNB8dlLQz9KiM0hOd7HfMRmYH9JHqID+hPg+8fF+EY8a3kiTA33ev16TdS+BIuXL9ykjxgpVSf9z+BS1S+GfqfRrfnjNMxhQcbZuGgvZCalpRo/1YxHEUk1H9hOtZDGydIA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(40470700004)(36840700001)(46966006)(2906002)(478600001)(6486002)(54906003)(8936002)(8676002)(6862004)(53546011)(5660300002)(186003)(70206006)(70586007)(6512007)(6506007)(4326008)(26005)(82740400003)(316002)(81166007)(41300700001)(356005)(86362001)(36756003)(82310400005)(33656002)(83380400001)(40460700003)(40480700001)(47076005)(336012)(2616005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 08:20:50.2063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea619a0e-4007-48af-86f8-08db40aefc34
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9148

Hi Jan,

> On 19 Apr 2023, at 09:52, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 19.04.2023 09:31, Bertrand Marquis wrote:
>> Hi Jan,
>>=20
>>> On 19 Apr 2023, at 08:28, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 18.04.2023 16:25, Julien Grall wrote:
>>>> On 18/04/2023 14:13, Bertrand Marquis wrote:
>>>>> On this serie I would like to open a discussion on how to handle the =
vector size
>>>>> and the corresponding command line / configuration / device tree para=
meters.
>>>>>=20
>>>>> In general the user must either give a vector size it wants or has a =
solution to
>>>>> just request the maximum supported size.
>>>>>=20
>>>>> In the current implementation if a size bigger than the supported one=
 is provided:
>>>>> - we silently disable SVE for dom0
>>>>> - we silently disable SVE for dom0less
>>>>> - we do not create a guest when done through tools
>>>>>=20
>>>>> This is not completely coherent and i think we should aim for a coher=
ent behaviour
>>>>> unless we have arguments for this status.
>>>>=20
>>>> +1.
>>>>=20
>>>>> Is there any good reason to silently disable for Dom0 and dom0less on=
ly ?
>>>>>=20
>>>>> I see some possible solutions here:
>>>>>=20
>>>>> - modify parameter behaviour to use the supported size if parameter i=
s bigger than
>>>>> it. This would at least keep SVE enabled if a VM depends on it and co=
uld simplify
>>>>> some of the handling by using 2048 to use the maximum supported size.
>>>>=20
>>>> My concern with this approach and the third one is the user may take=20
>>>> some time to realize the problem in the xl.cfg. So...
>>>>=20
>>>>>=20
>>>>> - coherently stop if the parameter value is not supported (including =
if sve is
>>>>> not supported)
>>>>=20
>>>> ... this is my preferred approach because it would be clear that the=20
>>>> value passed to Xen is bogus.
>>>=20
>>> I did say earlier on that this comes with its own downside of preventin=
g
>>> boot to complete for no real reason. It's all Arm code, so you're fine
>>> to ignore me, but in similar situations elsewhere (sorry, don't recall =
a
>>> concrete example off the top of my head) we've aimed to allow the syste=
m
>>> to boot, for the admin to then take corrective action if/as needed.
>>=20
>> But a guest depending on the feature will just crash later when booting.
>> This is making the assumption that guests are all able to properly adapt
>> to different hardware possibilities.=20
>> This might be the case when you have a full Linux but if you consider an
>> embedded use case, if something is activated due to command line paramet=
ers
>> or configuration ones, it should not be expected that those are ignored =
I think.
>>=20
>> There are definitely 2 different needs here, maybe we need to have somet=
hing
>> like a "strict" switch to allow both use cases ?
>=20
> Possibly. Yet along what I've said before - would you then also mean that=
 to
> fail boot upon encountering entirely unknown command line options?

I think this should depend:
- completely unknow: we can ignore
- not supported (sve while sve is not supported by the platform or Xen): we=
 should not ignore

I agree that one could use custom command line arguments for lots of reason=
s
(in linux you can do that and get them back from /proc for example) but sil=
ently
ignoring a parameter that is known to Xen i do not think we should do.

I think in most cases, one could think its system is correctly running but =
could get
problems later (or in some cases even not have any) so having a clear error=
 at the
beginning is a lot more clear.

Bertrand


