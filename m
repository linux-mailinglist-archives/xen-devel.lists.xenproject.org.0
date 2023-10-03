Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DB47B6F63
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 19:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612300.952166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnizO-00042F-Ne; Tue, 03 Oct 2023 17:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612300.952166; Tue, 03 Oct 2023 17:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnizO-00040X-Kt; Tue, 03 Oct 2023 17:15:18 +0000
Received: by outflank-mailman (input) for mailman id 612300;
 Tue, 03 Oct 2023 17:15:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hNjg=FR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qnizN-00040P-Ow
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 17:15:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a5df698-6210-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 19:15:14 +0200 (CEST)
Received: from AS9PR04CA0166.eurprd04.prod.outlook.com (2603:10a6:20b:530::27)
 by PAVPR08MB9650.eurprd08.prod.outlook.com (2603:10a6:102:31a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Tue, 3 Oct
 2023 17:15:10 +0000
Received: from AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:530:cafe::f) by AS9PR04CA0166.outlook.office365.com
 (2603:10a6:20b:530::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Tue, 3 Oct 2023 17:15:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT023.mail.protection.outlook.com (100.127.140.73) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.24 via Frontend Transport; Tue, 3 Oct 2023 17:15:09 +0000
Received: ("Tessian outbound 9aeaca65ec26:v211");
 Tue, 03 Oct 2023 17:15:09 +0000
Received: from 9c77728c0184.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CE99DE7B-C24E-4F4D-AC9D-33FD4AF58AF6.1; 
 Tue, 03 Oct 2023 17:14:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9c77728c0184.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 Oct 2023 17:14:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS4PR08MB7654.eurprd08.prod.outlook.com (2603:10a6:20b:4f0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Tue, 3 Oct
 2023 17:14:28 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404%4]) with mapi id 15.20.6838.024; Tue, 3 Oct 2023
 17:14:28 +0000
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
X-Inumbo-ID: 6a5df698-6210-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxUv3krlITL9EK8xxRsTN+CqaSO146fvJEvl0o/jJ9c=;
 b=FukzL57ujueXOd3RmgIlpro/dA+FCRdRpgUf5dwHmX4KPi9/hqqbguQ7q2fPRcI6s9gG3Vr/m0anmSNiiwPHVofCUQRq8nhdb2Vjo7tYESzg7A64E7xLwmkAJTgQudKhP/mQvkpPwxlW6ByBprr0Hg652X51uR6rjqe1U7ZWXHI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b265c519d0c537ae
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/3oJy36jHBkeVqr9k2mwBaXnNowtF5jpLC+Pz9gQKF2WTI0TuAgsA2VmHctUBtAygzf/uSPJpw4szQyMrPrKJmcKWBS6bL+QM+1cQ+QDco9cWULsCezwteDDQw0KEBl5vFT7PV5ywR4yDACZ7iye14TdsjYbPWhP7K9g1fW56G/hosnWdZBddSDax6dBXuDO/gon4fjHfCIdQdutEnQEcPOon2AJW1UQdRCW/CDwtCqEOHZAVPEl1gEazhcTwYCFMgmXFqKSQxMNXJGn/wqaYtL+ODSixhjfoRbpwuu9jY/Ja4HByUqbZu3Su7dDsRhn8DfXa4CvbKjFqEy0pEKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxUv3krlITL9EK8xxRsTN+CqaSO146fvJEvl0o/jJ9c=;
 b=Pmkr8mfRYEk43L8YE6Snc9m9qAkAOvTgQzRE6d2xq4G+opGllatp3jfwEqODbzc939k/E58JgW6/8GGyUfPXABhQUXgZ6CMRkNZ4RvWsQWbZp++AkEuAxpmuwlH6DlzWPYo9ucfJmk9UQUflV4KjgKmvlZywIsKJcLCZ3DNs7tE22dwoOjqHPOzyVXVHbAoTJRCyZE95K0cEVpT0dW7bOAdzTx0iK28VUMYWIe2ukWQCLsHCj8FgAgH0qFMAf4TaGrg5FIx18y1Zvjwga+B9jsC6J6AqospvzxBOiUC1Kw39GtKaVP9lrzr0XdBc/NAQqya4fmu9XOgS8g8R9CDlOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxUv3krlITL9EK8xxRsTN+CqaSO146fvJEvl0o/jJ9c=;
 b=FukzL57ujueXOd3RmgIlpro/dA+FCRdRpgUf5dwHmX4KPi9/hqqbguQ7q2fPRcI6s9gG3Vr/m0anmSNiiwPHVofCUQRq8nhdb2Vjo7tYESzg7A64E7xLwmkAJTgQudKhP/mQvkpPwxlW6ByBprr0Hg652X51uR6rjqe1U7ZWXHI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>, Henry
 Wang <Henry.Wang@arm.com>, Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Thread-Topic: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Thread-Index: AQHZ9g+v7vFsnMRst0ybMa+ffKOLU7A4PhuAgAAP1gA=
Date: Tue, 3 Oct 2023 17:14:25 +0000
Message-ID: <58213BE0-ADC4-47A0-B169-2E2E3B76D9C3@arm.com>
References:
 <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
 <1f271e93-7409-4a8d-9841-368722d6aa43@citrix.com>
In-Reply-To: <1f271e93-7409-4a8d-9841-368722d6aa43@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS4PR08MB7654:EE_|AM7EUR03FT023:EE_|PAVPR08MB9650:EE_
X-MS-Office365-Filtering-Correlation-Id: 503af4ab-a751-4f81-6411-08dbc4344c48
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0IPKqMFRA0WY5p8HkSsbQUx9xhNEEQ34HDllpDJSUQhe3FRbyG+rvvYJeOV35zvJEUARX8wDERHXX1Z+sXbasi1A3iE3e9FFJNkIF1iEHlwUnn4x8iZRQoN3wPJfqFRDkeLX5XpOTksK+zl1w5VhgxBrS9Z3ITys3+QqmnlZ94Th/Km23qXmonajv2Am2DMdVQiAZTtaZSiqwCK9vBsWRFx33wf4nfcDuGws+Ws6wdKWpytpLDNFLBrrV4QRytBNqnup0PsSHlFyRBoZgS95+MehAdwnQSudAF1PHSZDCyIL0+1/rZV/QXOZtpyQRmHW3Bdd71rSLyg5m9QImZSS6U4ejWFAynSk2jcH7pCpFNVme/4VY9eY2no3KJ66DYl/TtZI86ONYdEDtqbaCHGVO44Mr3QVTzm5ezVDlIqFTH8zRi3jQJ6lxw0/qruSwv5H1oj4LbCBghSTS4laIYnd4WnqXuTvzh8DmeRj3ps4zUS1KKgE5TiUd9RLezQ2kR3/ISChrZwjXIA1YfIu70kUhpBIOGAl5PKBLKC5jKfYXf+Pad/vihzmoQmJFy7o3BmXvbZR0yZFm4CSV2Le3eUcQDHduWIi+a696QPSXP6VO41QwCr8WypqTX4OpxaPzJpQbtwErXsiOioDoLR9/f9IaA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(366004)(376002)(396003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6486002)(6506007)(53546011)(6666004)(478600001)(76116006)(83380400001)(26005)(86362001)(6512007)(2616005)(66446008)(7416002)(33656002)(316002)(91956017)(4326008)(66946007)(8936002)(54906003)(5660300002)(64756008)(6916009)(8676002)(41300700001)(66476007)(66556008)(36756003)(122000001)(38070700005)(2906002)(38100700002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0B0CAC9342ABD248A5D0FCF40B3B0C41@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7654
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	061a234f-9b58-4aee-fa1f-08dbc43431a0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rFXjEt+ZcVWAovziAex5/SqnGrDENtLz5G14UpsOY4rssJ3qdcEFCEVZ/eQsX4UMLzuhCiqumZHRiNVU8rysclewr01aYx1FfmSk1oEx88IGPZ3znC8WBiceb0uZB7KaR2uMC4h6zHzfP86aGlTzhrO0uY2oiqfTdnSNNBsPrMpTTWw5twMitYkniw61tJXdQRqH7DVhBrWoxKxaGc1sN5bxwDbZLpM4f1tzKikR/5GZPufHsaGgOv/ECONjt31/kpDb6DyM/3NDjECXYfmVAL5UYjeaIBWEboEmt31OR7N+3ZYUwgdgeEvwtA9e9vqsM/k8/6S4wU6mIxUpuyXLoT/hMbNaGthqQiwQb69/DMGurAI9jotsaYG+vd8wOnJNS11KHg2ybHtAKYvVHcPbzgSrT9qKD5KO4lbTSBlxbW7vXAFRrYP7OZwMejCCfHu8LJxpB1/wLkKWvLI7XdjNN6srRr8koPeMlZ1K4F2xS+0b62glaoqom360SP2ZAkGsoNju9uvC0XUw7LdcupKyUexcm4YF8FFJxwqaRmSQFAmyvrP0LzvytEzrIBVy9t3Xma/DXnsrVP1FUzp2p7z1dhEkC7CJc5NuNU68c8QXGmqOaErYE9ZqtZJVvpQkfF6DWvB6TSgI5lqL7/7aghBHghe2BHEcSfqweeAXlR0dFVMf73IUshFX/RPtoRoEzWpZg3QPPUmsN0N5f+SvaAAGTJNBn4hq3C8WAkPr5tFl7lg7+MZbaD0tyq9JwCneAdJw
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(136003)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(82310400011)(46966006)(36840700001)(40470700004)(53546011)(40460700003)(2906002)(6862004)(316002)(4326008)(41300700001)(8936002)(8676002)(70586007)(5660300002)(36756003)(40480700001)(70206006)(478600001)(6512007)(6666004)(82740400003)(86362001)(356005)(6506007)(6486002)(33656002)(2616005)(54906003)(81166007)(26005)(83380400001)(47076005)(336012)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 17:15:09.9588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 503af4ab-a751-4f81-6411-08dbc4344c48
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9650



> On 3 Oct 2023, at 17:17, andrew.cooper3@citrix.com wrote:
>=20
> On 03/10/2023 4:37 pm, Nicola Vetrini wrote:
>> As specified in rules.rst, these constants can be used
>> in the code.
>> Their deviation is now accomplished by using a SAF comment,
>> rather than an ECLAIR configuration.
>>=20
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ------
>> docs/misra/safe.json                             | 8 ++++++++
>> xen/arch/x86/hvm/svm/emulate.c                   | 6 +++---
>> xen/arch/x86/hvm/svm/svm.h                       | 9 +++++++++
>> xen/common/inflate.c                             | 4 ++--
>> 5 files changed, 22 insertions(+), 11 deletions(-)
>>=20
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automati=
on/eclair_analysis/ECLAIR/deviations.ecl
>> index d8170106b449..fbb806a75d73 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -132,12 +132,6 @@ safe."
>> # Series 7.
>> #
>>=20
>> --doc_begin=3D"Usage of the following constants is safe, since they are =
given as-is
>> -in the inflate algorithm specification and there is therefore no risk o=
f them
>> -being interpreted as decimal constants."
>> --config=3DMC3R1.R7.1,literals=3D{safe, "^0(007|37|070|213|236|300|321|3=
30|331|332|333|334|335|337|371)$"}
>> --doc_end
>> -
>> -doc_begin=3D"Violations in files that maintainers have asked to not mod=
ify in the
>> context of R7.2."
>> -file_tag+=3D{adopted_r7_2,"^xen/include/xen/libfdt/.*$"}
>> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
>> index 39c5c056c7d4..7ea47344ffcc 100644
>> --- a/docs/misra/safe.json
>> +++ b/docs/misra/safe.json
>> @@ -20,6 +20,14 @@
>>         },
>>         {
>>             "id": "SAF-2-safe",
>> +            "analyser": {
>> +                "eclair": "MC3R1.R7.1"
>> +            },
>> +            "name": "Rule 7.1: constants defined in specifications, man=
uals, and algorithm descriptions",
>> +            "text": "It is safe to use certain octal constants the way =
they are defined in specifications, manuals, and algorithm descriptions."
>> +        },
>> +        {
>> +            "id": "SAF-3-safe",
>>             "analyser": {},
>>             "name": "Sentinel",
>>             "text": "Next ID to be used"
>> diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emula=
te.c
>> index aa2c61c433b3..c5e3341c6316 100644
>> --- a/xen/arch/x86/hvm/svm/emulate.c
>> +++ b/xen/arch/x86/hvm/svm/emulate.c
>> @@ -90,9 +90,9 @@ unsigned int svm_get_insn_len(struct vcpu *v, unsigned=
 int instr_enc)
>>         if ( !instr_modrm )
>>             return emul_len;
>>=20
>> -        if ( modrm_mod       =3D=3D MASK_EXTR(instr_modrm, 0300) &&
>> -             (modrm_reg & 7) =3D=3D MASK_EXTR(instr_modrm, 0070) &&
>> -             (modrm_rm  & 7) =3D=3D MASK_EXTR(instr_modrm, 0007) )
>> +        if ( modrm_mod       =3D=3D MASK_EXTR(instr_modrm, 0300) && /* =
SAF-2-safe */
>> +             (modrm_reg & 7) =3D=3D MASK_EXTR(instr_modrm, 0070) && /* =
SAF-2-safe */
>> +             (modrm_rm  & 7) =3D=3D MASK_EXTR(instr_modrm, 0007) )  /* =
SAF-2-safe */
>>             return emul_len;
>>     }
>=20

Hi Andrew,

> This is line noise, and later examples are even worse.
>=20
> What does SAF mean?  It's presumably not the Scalable Agile Framework.

Please have a look on docs/misra/documenting-violations.rst, you will find =
all the
info about it.

>=20
> It is meaningless to anyone reading the code who doesn't know it's a
> magic identifier to suppress violations.
>=20
> Looking in scripts/xen_analysis, it appears to be a labelling scheme
> we've in invented for the purpose of cross-referencing, in which case it
> needs to be changed to something more obviously safety/misra/etc related
> to make the code clearer to follow.
>=20
> ~Andrew
>=20


