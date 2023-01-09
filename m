Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D59066286F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 15:27:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473680.734414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEt6a-0006QR-D5; Mon, 09 Jan 2023 14:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473680.734414; Mon, 09 Jan 2023 14:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEt6a-0006Nz-AK; Mon, 09 Jan 2023 14:26:28 +0000
Received: by outflank-mailman (input) for mailman id 473680;
 Mon, 09 Jan 2023 14:26:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ/d=5G=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pEt6Y-0006Nn-AI
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 14:26:26 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2081.outbound.protection.outlook.com [40.107.14.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97c89f7d-9029-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 15:26:23 +0100 (CET)
Received: from AS9PR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::28) by DU0PR08MB9437.eurprd08.prod.outlook.com
 (2603:10a6:10:42f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 14:26:21 +0000
Received: from VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:542:cafe::3d) by AS9PR01CA0047.outlook.office365.com
 (2603:10a6:20b:542::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Mon, 9 Jan 2023 14:26:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT021.mail.protection.outlook.com (100.127.144.91) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Mon, 9 Jan 2023 14:26:19 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132");
 Mon, 09 Jan 2023 14:26:19 +0000
Received: from 1329edeb07ec.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 243FDD70-51F1-4DFF-9D52-C59224BC8222.1; 
 Mon, 09 Jan 2023 14:26:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1329edeb07ec.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 Jan 2023 14:26:13 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DBBPR08MB6076.eurprd08.prod.outlook.com (2603:10a6:10:1f5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 14:26:09 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 14:26:09 +0000
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
X-Inumbo-ID: 97c89f7d-9029-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3bVSUkzFmxk0AlM4PzpGnlkh7s26gh58imKCbjKBkM=;
 b=XBAZmsaNGUzdJRaripfs2JpoBlpGYEgzKON0kvYNJd6s8JqdHyLO5yBAt5YONOdMz6BizjidXzoZlYbBOgEDGHQseGSwCanPIxWe8oKeV2lP2GLy10Rw/zSwKPRsaFtASzVwQA66rT3lb/Xdfn4ErB+GU4VV2Vd9wU13DSQW/SE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3294e52b668071c5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aotWyTUWM/zHOa6IMaZd0fnPscRN+QscPodxHs4dvVDd0IbSAbn2IEOd/vmx57ao6j2p4xFoV5PxR1bthqt3GLYKTXW8WWfUHUkIKDI5Rzb5bsyrY+uxE68CAGQDf7vEXObaiVd1230m9KiuVPuXXST5vcypkz/yLMUL0/jOmSx8S/hPDYGMdFLnRb8soKjiN72Dq71xn0FfD+9/x+wLI5IZFzufwzD+VYsUE/pioJMn8gu3rSQiqJMaScQI00tnCoRY5YAjxu1SpIub00r1a9PKyCBvD9caOrdB9eDJ9k+Szx7rYip9Qo7R+O4XEJXoZ9t04Fo4LXNLIh+ZkpBtcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3bVSUkzFmxk0AlM4PzpGnlkh7s26gh58imKCbjKBkM=;
 b=HoYNfgN6Xm0gRCjf6z8/8OwuAVnty+ouRCY+F1B3hiFL+Lryh5v6hXKBrXetd7qQq1ZNnj0/s4otdoDC8K0EJOrO5fpjrtf8v3FVfornm/72uTW69So7DnZyFZepB9Aat+zFkdtcq8tX8793pDJ4/6WSCpANfhH+533yIqqZcmFeps/57kFK2o4i1IsXFr1ewlR5r2APcI3i7qHGgkVUTdITs5a2r08kH+Re8y0rbf7VOZxUuiLMeO2GvNUhE9/EXU2ZryUS/xdj2CTDCCij5lPpPkoJtHBM2m1uO1I39gThhHvssfyXlpfrIftEf8A+7G+SK9x/MNQ1HH/py3QcxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3bVSUkzFmxk0AlM4PzpGnlkh7s26gh58imKCbjKBkM=;
 b=XBAZmsaNGUzdJRaripfs2JpoBlpGYEgzKON0kvYNJd6s8JqdHyLO5yBAt5YONOdMz6BizjidXzoZlYbBOgEDGHQseGSwCanPIxWe8oKeV2lP2GLy10Rw/zSwKPRsaFtASzVwQA66rT3lb/Xdfn4ErB+GU4VV2Vd9wU13DSQW/SE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@amd.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] xen/cppcheck: sort alphabetically cppcheck report
 entries
Thread-Topic: [PATCH 1/2] xen/cppcheck: sort alphabetically cppcheck report
 entries
Thread-Index: AQHZIbt/3GyhUKyUOka+bjXcc10z+K6V88UAgAAHeACAAC3gAA==
Date: Mon, 9 Jan 2023 14:26:09 +0000
Message-ID: <D4D6E4A3-691D-4D28-B912-26B12477E8BF@arm.com>
References: <20230106104108.14740-1-luca.fancellu@arm.com>
 <20230106104108.14740-2-luca.fancellu@arm.com>
 <6373383d-d6d3-3d92-b09e-6434c5b5d15b@amd.com>
 <af7610a2-11d6-48e2-6bf0-762525187612@suse.com>
In-Reply-To: <af7610a2-11d6-48e2-6bf0-762525187612@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DBBPR08MB6076:EE_|VI1EUR03FT021:EE_|DU0PR08MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eff4c37-d097-428a-2188-08daf24d7a00
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cElD3GHZC5ZUYu77aj+PjyZLdF5pJSwvJtyNowvL5kcBfMXgB95eD64rICOcKgpP5OSlDvPWQgrcNUz8M9kGoYlGtKDroyuDCIlM0w71K8p6NB9wYAzCgAXw4zffvye62rRrHXVM6t8rXrv6nzrxS/S5E6SNBnbcPk+Bkv4m+9RtwFkK4O2ECB/HL3DxsDTFGUDfxZojhaY1FuocQP6cDaNuYOYXLQEPOMv6L7UA9nvuBrni2IGKOAn+0Ku417AkcKLB5kfu5BeRX73/uxolGK8FG9ltOGdyvW+Q5ejSZ3FDoPFuOnrRRVxm6IJRhNpKydzsnUkou8vXVscPIpbmyxwWpuQWJ/dP0ZPFTt/K1VbgGinqrE9gYgIfJ9WYJGj4pNb3T/sq0Xn2ES00oAoNPVY5Yvp5yzYD8uzZ18jU+7t8Qj8A+c5VpGznfEOB1bE1tM9AwDFOTttUiJ8fE7TtyfFEmyeMyK7LVzQ6gSU8BTlC/HuHqI/MhpYq8iXaOLhbqi3icxR5RYxbjHhGYN3px7TniKAgRUAvP2Ul8RvB/YVmEOFwu16hQJRmcbD2Blt/HkHaju0GvED4vJOmyf8iwJhHwaRnN+twmmoa8cTfqMdavU5SG6fRRTpFMP47G9UieLly+GAsrCckvar34MHhi/YgWjrSxvHWEj2ywGYrrYuk8BMigg3DSDYEHtFkCgbRz5RhXdNiD8hS7+eO9CQ/UpusFNqOITUX2VadsmsYoa4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(451199015)(71200400001)(110136005)(54906003)(86362001)(316002)(8936002)(2616005)(6486002)(2906002)(38100700002)(478600001)(66476007)(66946007)(76116006)(64756008)(66446008)(53546011)(41300700001)(66556008)(26005)(186003)(91956017)(6512007)(4326008)(38070700005)(8676002)(6506007)(33656002)(36756003)(122000001)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7D68142F30AF674399477BECF5595652@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6076
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	de4f6c6a-1dc0-4268-056f-08daf24d73e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V3Y+qsdXRU5chpQ18VzViR+ZqZDkoJEZ9qvqLJHA5sFtlRDLhcqpcslDzHnR/+SYVdr2Tj9eXGSZQkq5rYj+nm93OeT6LNuPdj/9ovi/fYlB+u58KK8kmcOVtC0C16OYHTOPdz5AffEYgqNUI0oiOnFzXxpQn2C2zUVMBbaipaBBrXCxihu0k3VzwQt3G9AONhFht2zgzxUYGlNxIUGOZBg9QiYIEzG8LuHQKInMeSfpGTlPrHDlbG2LGUgpGi6fjnumTculJxPw7p0/3sqcmUAEWI4M/IjeNMbpKsyEBEwbQHPbPby0r+hNStDtNy6toBz0OvQkeTh8LfN0Y1csfAgMQjXENUfx57QAyXmBXjr4HN2UhRMOiUPg9slCidGMj2TDVsv5f+D02rDMItsFgSTmTg0vtVLM2QkUl3ZQAEpsDXjK1euLhnbnHmUh9E0yAYdZoRZbbVUct3GzB4cBg9aAQrknROg6N1trY2x1G+Ou5j+ErvjJR1TiPkpolrPcyYA/M0D+6ZCvMBZ8Csi7y6XOjME0dqMBZOfbUXzDgy5wZJcQCE7QbNkaqc5nKRiqnsZE/VfHEIL8POmEZT2L1C2V9XSLB0rWaPLLgoE3CxfGdX07oM2bBMAPo4fH96ENqE4iStLxwNkuJQfcA69We2s7ezM7nqia/kqmwETABqMtsymfWoOdwE60ugHr3LVODOglU+kifCesGmhP4rW0og==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199015)(40470700004)(46966006)(36840700001)(40480700001)(36756003)(33656002)(86362001)(40460700003)(6486002)(54906003)(110136005)(316002)(6506007)(5660300002)(478600001)(2906002)(4326008)(70586007)(8676002)(70206006)(41300700001)(8936002)(36860700001)(82740400003)(356005)(81166007)(2616005)(336012)(26005)(53546011)(6512007)(186003)(82310400005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 14:26:19.8641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eff4c37-d097-428a-2188-08daf24d7a00
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9437



> On 9 Jan 2023, at 11:41, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 09.01.2023 12:15, Michal Orzel wrote:
>> On 06/01/2023 11:41, Luca Fancellu wrote:
>>> Sort alphabetically cppcheck report entries when producing the text
>>> report, this will help comparing different reports and will group
>>> together findings from the same file.
>>>=20
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> xen/scripts/xen_analysis/cppcheck_report_utils.py | 2 ++
>>> 1 file changed, 2 insertions(+)
>>>=20
>>> diff --git a/xen/scripts/xen_analysis/cppcheck_report_utils.py b/xen/sc=
ripts/xen_analysis/cppcheck_report_utils.py
>>> index 02440aefdfec..f02166ed9d19 100644
>>> --- a/xen/scripts/xen_analysis/cppcheck_report_utils.py
>>> +++ b/xen/scripts/xen_analysis/cppcheck_report_utils.py
>>> @@ -104,6 +104,8 @@ def cppcheck_merge_txt_fragments(fragments_list, ou=
t_txt_file, strip_paths):
>>>                 for path in strip_paths:
>>>                     text_report_content[i] =3D text_report_content[i].r=
eplace(
>>>                                                                 path + =
"/", "")
>>> +            # sort alphabetically the entries
>>> +            text_report_content.sort()
>>>             # Write the final text report
>>>             outfile.writelines(text_report_content)
>>>     except OSError as e:
>>> --
>>> 2.17.1
>>>=20
>>>=20
>>=20

Hi Michal, Jan,

>> Having the report sorted is certainly a good idea. I am just thinking wh=
ether it should be done
>> per file or per finding (e.g. rule). When fixing MISRA issues, best appr=
oach is to try to fix all
>> the issues for a given rule (i.e. a series fixing one rule) rather than =
all the issues in a file
>> from different rules. Having a report sorted per finding would make this=
 process easier. We could
>> add a custom key to sort function to take the second element (after spli=
tting with ':' separator)
>> which is the name of the finding to achieve this goal. Let me know your =
thoughts.
>=20
> +1 - sorting by file name wants to be the 2nd sorting criteria, i.e. only=
 among
> all instances of the same finding.

Yes both suggestions make sense to me.

>=20
> Jan


