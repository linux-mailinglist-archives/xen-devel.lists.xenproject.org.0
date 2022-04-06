Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CBA4F5746
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 10:14:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299691.510752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc0nG-000146-PI; Wed, 06 Apr 2022 08:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299691.510752; Wed, 06 Apr 2022 08:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc0nG-00010u-LZ; Wed, 06 Apr 2022 08:13:34 +0000
Received: by outflank-mailman (input) for mailman id 299691;
 Wed, 06 Apr 2022 08:13:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dnga=UQ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nc0nE-00010o-Rx
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 08:13:33 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe02::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 717da74a-b581-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 10:13:31 +0200 (CEST)
Received: from AM6P194CA0064.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::41)
 by DB7PR08MB3753.eurprd08.prod.outlook.com (2603:10a6:10:7e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 08:13:24 +0000
Received: from VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::78) by AM6P194CA0064.outlook.office365.com
 (2603:10a6:209:84::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19 via Frontend
 Transport; Wed, 6 Apr 2022 08:13:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT032.mail.protection.outlook.com (10.152.18.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Wed, 6 Apr 2022 08:13:23 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Wed, 06 Apr 2022 08:13:23 +0000
Received: from 18f0d132bd5a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E259025B-B669-449A-BEF1-340DB0470B48.1; 
 Wed, 06 Apr 2022 08:13:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 18f0d132bd5a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Apr 2022 08:13:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB2997.eurprd08.prod.outlook.com (2603:10a6:209:49::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 08:13:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c521:b750:b0a9:54a6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c521:b750:b0a9:54a6%4]) with mapi id 15.20.5144.019; Wed, 6 Apr 2022
 08:13:07 +0000
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
X-Inumbo-ID: 717da74a-b581-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPYwU8cH8r6gT8YpCHbvCmd5IJBCDFFpJlQDqyaGYJs=;
 b=Ef4qBAbbYfySl5+EnhTQdXzzjhiY/qcW6Y6fw1Ge/Wz39XsL8OGXrlDhYaqrlJI0+Sew9QDwOg2HcPSjpyvp14SYF5lelNp5mBCV+nygjZR8sR2FScnq882GofCl7G/fuXPSzMnlZ+un0wWcCMRvhcDBObTsuRPBPOpne6uHAfU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d15e869c505921c8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9uStl15FnP9AEaQ2dvC065qxxkkSZLKAwyP+Cij1xXK6VQnF/hnXdbB0M39oTZACtIF12dAwEOpn8JhA1HBCj9VGJ/z1HYYy249YEj+1KH+y5h3j6HDUYjP+WFFcFgd3hz4iGodpGBzg27L3xIy2ro5/aWxqn2ybhiG9s5FGL4Ll9BkkgQo5qgG8Ytg4wKX/6l7Wgb+n//bDRjazHFyi0sQ+OlldsYwDcFo3diD4rYNhGJxpf1XhpLIE6031YNod5K5wA2RRxmk5E7b7p8pchtVwBsMArToCk+3t1dF4LUAnY4OWeTE1ko7mnIt2N54xAoQoTZRfzNw+x0oc7gsqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPYwU8cH8r6gT8YpCHbvCmd5IJBCDFFpJlQDqyaGYJs=;
 b=RLr2JCBX1+4/1bZ7agdv9kQH/p00i47OvDctyWBZZp+WrC+rnWvfpmKxzN5IR4Wo296Qwo6hIT3n5S7okwdxrBUyfT+oSzuiyFI5Yve2UDx8BGGf3xsWNEu5EVYS5+BzwEPaduD02y3tSqJyMXYA/qnK6O8ZEgfJp+eEyeTNBrgP6+GUEaP6dAkwTyzX6KMBbiXc121B1FCgKvyd6uuQE0BnwC0TXnda+RYNLi1UMBYwSkRPRe3UjtUhvZ+yG6AVL1I3h5a4vDcev9nsEWyD9An5cWmZqn+I5Fg7NroWyerT4pOl4L8rEZhSotdj5cS+BSCdqoDWue/qg+9gsK0/3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPYwU8cH8r6gT8YpCHbvCmd5IJBCDFFpJlQDqyaGYJs=;
 b=Ef4qBAbbYfySl5+EnhTQdXzzjhiY/qcW6Y6fw1Ge/Wz39XsL8OGXrlDhYaqrlJI0+Sew9QDwOg2HcPSjpyvp14SYF5lelNp5mBCV+nygjZR8sR2FScnq882GofCl7G/fuXPSzMnlZ+un0wWcCMRvhcDBObTsuRPBPOpne6uHAfU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <Michal.Orzel@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH] xen/build: Add cppcheck and cppcheck-html make rules
Thread-Topic: [RFC PATCH] xen/build: Add cppcheck and cppcheck-html make rules
Thread-Index: AQHYP279DnP7J8Edsk+NG7Po4Qnn9azPUYQAgABlXgCAAM91gIASFxQA
Date: Wed, 6 Apr 2022 08:13:07 +0000
Message-ID: <E2B73FDA-55ED-40A3-B7CE-3362B8B21A78@arm.com>
References:
 <77c79e86050eef2b706ee11e64183d57a0f5bcee.1648119732.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.22.394.2203241829510.2910984@ubuntu-linux-20-04-desktop>
 <98a6df25-8a95-3e3d-e8a9-11e948da7b5b@arm.com>
 <alpine.DEB.2.22.394.2203251257020.2910984@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2203251257020.2910984@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 89c3ebd8-bd27-40dd-efff-08da17a551d8
x-ms-traffictypediagnostic:
	AM6PR08MB2997:EE_|VE1EUR03FT032:EE_|DB7PR08MB3753:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3753DB97987A2A6C458AF6CA9DE79@DB7PR08MB3753.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mew0qsplbe2bpy6XfL+zYBKkJ4u4GOiecWr0YPVOLQMXW8i5Jz9DjWck6IJSoqKEoOxdJVcMa2r9c82pRgWG8KUuaKiNjFE5zau5bnfpNEH3XEToElb+h2LRzbXHQBMz4XpYF/fkmDzruayyhL/ogZiCmGqbRuJJPaq7trZX1dDkVZj6OfF7MgzrnEJTj6rtIRYxB8FouFLvmyJ34igvb8uYI8fr7krKS5WFRuLcbsqS4GMbEXgueJYYRzN3gLH3SiGDuBSJTZ/TvuMyiRMpFO3ktDLvK977Zfv2zKCNi74n1Ls7+SloltuYaK06qWSpEdaM8mGBTToh1d//BOLwrQTeM/E33UaY8a5hMQ6FrdygBBfES2jveg56fU88tW7B1RElZ/amdqgKnxW/uWYxKsoaB7dEB/sQHNgZHpSBIclplrMrVW0KgBqYCHAPsLCZz2nzOKmggqCXvvZpk/kQsYEIr1m8qfpZygfSNxXsenMlHifIZxRpv19UyNnU7LUhS2H5UFOEEIXPoiMTJgesadnQcvc+32CiqWtFSBFv3VFUSUCvo2IrFFss5qyE/7RUC7umR/w27kUFjFcrTdgeIApeJ83UfAUQldEjfaXQG2qVZtHtEaWe1qZZNtYO83uv6VquKG3wE/vZQz0Hs04oXIkTolRePu1FrWJwazxWbLTiJ8K9rRlGxRy2AQD3Dbvk9iY11MGXQsJ64O9kDbJ6mwj+DY6p7dCa2Q3dcHfsL0Sehsr01Jm4iStNk6ybCyu6DI7kDWGhy+JbeXfehjY+XSuwuiIlrq+LKih4k8yRzRSxdlfau/JA1juliPchzdOlWAdFt5gBVdVtdlJyCJrvqqyTXbIU8KqDGOUMHm8M0n8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(91956017)(6506007)(26005)(2616005)(186003)(53546011)(54906003)(316002)(83380400001)(6486002)(66574015)(966005)(76116006)(66946007)(6916009)(33656002)(66476007)(64756008)(4326008)(508600001)(38070700005)(36756003)(8676002)(5660300002)(6512007)(66556008)(38100700002)(66446008)(2906002)(8936002)(86362001)(122000001)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0667C1CF2D7DDC4FB7FFD4AB7A3529F0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2997
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5d212618-9eac-402c-d287-08da17a54875
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EjozkMvqyLEoLVOER8gVLKjEz4cBqnO8bdky6vUekBD5715DReez8Y7hSFMdZtT0qRB6EByvk+KmHW+iiGd8OrBT0MAfoBFGc3tdOjiauz0uv5W2j5n59sEHGpfCyQ/0eTRUW5XVBHQ3xWWL5E7y9nQU6iPjkxaUAkFR3brutdemLuQny5YaJmG3FoRY+sBU75nmUwaYJFyhMi9SgpnsbQnw9cWFx1SGsWq6eWIRgNoD3mhjWngo+ICYlU5G11AC6Ym9cORnRRSaEYz8GNlQTLR0p7yUCLf4KNJn8HEKg2P2ZQBCdMEY4lRYWIV9ykUWnkYwAP6Rzp8BpqK2nP9GWXhGBqGC0SmbWRKjQMiwufXLu1X6nZQo5wNvJeHyxMue9F8iyp8V56hGzpGCN2kDd35BwZ6r8NUFhb/SpdEQlOQb0HUAhVjzGq8W5RzJZLxgh6uuzD4c+bY1mMnbDZ+p4W7wDA97wr+JCJkNR2NXT/XSsZ64pZAFesdogTpsi4JcL7XHkXAbDMxrezEtt3dCaoob9jWUQFTI6SMZp/1s9AK7j2milOwZVo8VFUTneDKq6v9SJ3Bjxi5XYwMJ9KJs4pGHod1u6eLAopf7uH10cAfxOqhVtCW0JuYbOdoUNP/a68v3iPeJmdE9ZnYr/cwfz/cIBBWiJCIthOp+iL9winxIzzNHJwBGI/BCqkScfVvMHqdpMaAofDNfr/qG1QsjPUj5hWuZbrD9EgeUHenpIGyp/adKcCmxQ25UjWrFC8PsD9Vur9kpQFnZAkwkubDZ6xQWmz2n4lxfx/VzymjAzSE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6512007)(81166007)(47076005)(6506007)(508600001)(33656002)(336012)(6862004)(8936002)(53546011)(8676002)(70586007)(70206006)(66574015)(4326008)(356005)(40460700003)(83380400001)(2906002)(82310400005)(86362001)(5660300002)(186003)(107886003)(316002)(966005)(2616005)(26005)(6486002)(36756003)(54906003)(36860700001)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 08:13:23.4998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c3ebd8-bd27-40dd-efff-08da17a551d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3753

Hi Stefano,

> On 25 Mar 2022, at 19:57, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Fri, 25 Mar 2022, Michal Orzel wrote:
>> On 25.03.2022 02:32, Stefano Stabellini wrote:
>>> On Thu, 24 Mar 2022, Bertrand Marquis wrote:
>>>> cppcheck can be used to check Xen code quality.
>>>>=20
>>>> To create a report do "make cppcheck" on a built tree adding any optio=
ns
>>>> you added during the process you used to build xen (like CROSS_COMPILE
>>>> or XEN_TARGET_ARCH). This will generate an xml report xen-cppcheck.xml=
.
>>>>=20
>>>> To create a html report do "make cppcheck-html" in the same way and a
>>>> full report to be seen in a browser will be generated in
>>>> cppcheck-htmlreport/index.html.
>>>>=20
>>>> For better results it is recommended to build your own cppcheck from t=
he
>>>> latest sources that you can find at [1].
>>>> Development and result analysis has been done with cppcheck 2.7.
>>>>=20
>>>> The Makefile rule is searching for all C files which have been compile=
d
>>>> (ie which have a generated .o file) and is running cppcheck on all of
>>>> them using the current configuration of xen so only the code actually
>>>> compiled is checked.
>>>>=20
>>>> A new tool is introduced to merge all cppcheck reports into one global
>>>> report including all findings and removing duplicates.
>>>>=20
>>>> Some extra variables can be used to customize the report:
>>>> - CPPCHECK can be used to give the full path to the cppcheck binary to
>>>> use (default is to use the one from the standard path).
>>>> - CPPCHECK_HTMLREPORT can be used to give the full path to
>>>> cppcheck-htmlreport (default is to use the one from the standard path)=
.
>>>>=20
>>>> This has been tested on several arm configurations (x86 should work bu=
t
>>>> has not been tested).
>>>>=20
>>>> [1] https://cppcheck.sourceforge.io/
>>>>=20
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>>=20
>>> Very cool, I was looking forward to this :-)
>>>=20
>>>=20
>>>> diff --git a/xen/tools/merge_cppcheck_reports.py b/xen/tools/merge_cpp=
check_reports.py
>>>> new file mode 100755
>>>> index 0000000000..ef055f6925
>>>> --- /dev/null
>>>> +++ b/xen/tools/merge_cppcheck_reports.py
>>>> @@ -0,0 +1,73 @@
>>>> +#!/usr/bin/env python
>>>> +
>>>> +"""
>>>> +This script acts as a tool to merge XML files created by cppcheck.
>>>> +Usage:
>>>> +    merge_cppcheck_reports.py [FILES] [OUTPUT]
>>>> +
>>>> +    FILES  - list of XML files with extension .cppcheck
>>>> +    OUTPUT - file to store results (with .xml extension).
>>>> +             If not specified, the script will print results to stdou=
t.
>>>> +"""
>>>> +
>>>> +import sys
>>>> +from xml.etree import ElementTree
>>>> +
>>>> +def elements_equal(el1, el2):
>>>> +    if type(el1) !=3D type(el2): return False
>>>> +
>>>> +    el1_location =3D str(el1.find('location').attrib)
>>>> +    el2_location =3D str(el2.find('location').attrib)
>>>> +
>>>> +    if el1_location !=3D el2_location: return False
>>>> +
>>>> +    return True
>>>> +
>>>> +def remove_duplicates(xml_root_element):
>>>> +    elems_to_remove =3D []
>>>> +    index =3D 0
>>>> +    elems_list =3D list(xml_root_element.findall("errors")[0])
>>>> +    for elem1 in elems_list:
>>>> +        index +=3D 1
>>>> +        for elem2 in elems_list[index:]:
>>>> +            if elements_equal(elem1, elem2) and elem2 not in elems_to=
_remove:
>>>> +                elems_to_remove.append(elem2)
>>>> +                continue
>>>> +
>>>> +    for elem in elems_to_remove:
>>>> +        xml_root_element.findall("errors")[0].remove(elem)
>>>> +
>>>> +def merge(files):
>>>> +    result_xml_root =3D None
>>>> +    for xml_file in files:
>>>> +        xml_root =3D ElementTree.parse(xml_file).getroot()
>>>=20
>>>=20
>>> Traceback (most recent call last):
>>>  File "/local/repos/xen-upstream/xen/tools/merge_cppcheck_reports.py", =
line 73, in <module>
>>>    run()
>>>  File "/local/repos/xen-upstream/xen/tools/merge_cppcheck_reports.py", =
line 60, in run
>>>    result =3D merge(files)
>>>  File "/local/repos/xen-upstream/xen/tools/merge_cppcheck_reports.py", =
line 43, in merge
>>>    xml_root =3D ElementTree.parse(xml_file).getroot()
>>>  File "/usr/lib/python2.7/xml/etree/ElementTree.py", line 1182, in pars=
e
>>>    tree.parse(source, parser)
>>>  File "/usr/lib/python2.7/xml/etree/ElementTree.py", line 657, in parse
>>>    self._root =3D parser.close()
>>>  File "/usr/lib/python2.7/xml/etree/ElementTree.py", line 1671, in clos=
e
>>>    self._raiseerror(v)
>>>  File "/usr/lib/python2.7/xml/etree/ElementTree.py", line 1523, in _rai=
seerror
>>>    raise err
>>> xml.etree.ElementTree.ParseError: no element found: line 11, column 0
>>> make: *** [Makefile:576: xen-cppcheck.xml] Error 1
>>>=20
>>> I think we should catch the xml.etree.ElementTree.ParseError exception =
and continue?
>>=20
>> Well, this is of course something that we might do but this error clearl=
y warns us that
>> some XML files is not well formatted and therefore is not parsable. This=
 could mean that
>> you are using some old cppcheck version. Is it correct assumption?
>=20
> I confirm it was an issue with the cppcheck version. I updated to the
> latest main branch and it worked fine, thanks!
>=20
> Then, I suggest we catch the exception and print an informative error
> like "please upgrade your cppcheck to version xxx or greater"

I will investigate that before pushing the next version.

Cheers
Bertrand


