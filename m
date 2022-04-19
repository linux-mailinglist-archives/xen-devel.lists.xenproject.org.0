Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 130DC50703C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 16:27:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308175.523774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngooe-00025k-5C; Tue, 19 Apr 2022 14:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308175.523774; Tue, 19 Apr 2022 14:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngooe-00022g-1y; Tue, 19 Apr 2022 14:26:52 +0000
Received: by outflank-mailman (input) for mailman id 308175;
 Tue, 19 Apr 2022 14:26:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cMjw=U5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ngooc-0001yb-UC
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 14:26:51 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c024b541-bfec-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 16:26:50 +0200 (CEST)
Received: from AS8PR04CA0105.eurprd04.prod.outlook.com (2603:10a6:20b:31e::20)
 by AM5PR0802MB2545.eurprd08.prod.outlook.com (2603:10a6:203:a2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 14:26:46 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::18) by AS8PR04CA0105.outlook.office365.com
 (2603:10a6:20b:31e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Tue, 19 Apr 2022 14:26:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Tue, 19 Apr 2022 14:26:46 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Tue, 19 Apr 2022 14:26:45 +0000
Received: from afb58c3190ac.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E1717C65-320B-469C-AA32-0004BE83CD94.1; 
 Tue, 19 Apr 2022 14:26:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id afb58c3190ac.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 19 Apr 2022 14:26:34 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3894.eurprd08.prod.outlook.com (2603:10a6:20b:90::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Tue, 19 Apr
 2022 14:26:30 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 14:26:29 +0000
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
X-Inumbo-ID: c024b541-bfec-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/sEm9IIohiWWXKc+yqBbYPbZNzTeBD8jFU4kUTx/Ik=;
 b=peL/kQBBfTsagiMaBk6KHyIFQYKJCGzhMI/vivaotWuX0gGzJ7MvLHzxKAPA1sv2pQbqpys7ajaVll3Duf+IU7ol6L1HVSB/wLuB/BSejC2hMn95tpJxLKMFVxvSdbF2gIOfWJR28wI++rFBmL/3BqlhpwYv2bseVHBuBJOk1DU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5568e7a29f7c7e4d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgE0lnNIU5GaCQiL+RDrRaVlB4zMeXCJQEyMG0759/uJzT3hwQRkEbThK2VxQuwuND7HaFaT62cxkkOuFXAcWVXbzYruZDy8n0y9E5/JyfU2UUrjZjREAZi5EH+twBmsf8NE5DGjo4sofZuPaieIQuyNkVxGtZGaNZhRGAKL5qyrzfQVxBIuy5DHb8xgWoQ7vifq/RL05djiDjM5dvC+dUzVmMP+CRdrx55DP2VwsL1HzisX1aNn/4MerHIqYm9ir3ZYgIiIhfsBPpgxfNPLWUz7yEIHDEag+nRxr+qf5SSMjiApd46V5E8P+5nTL+p33WtIOsRhhuRJX5pZEfw2sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/sEm9IIohiWWXKc+yqBbYPbZNzTeBD8jFU4kUTx/Ik=;
 b=MxckrjQO4Ptz42F6LZar1tRc9CFj9EpfvO3jj+6xBTM2ZiFz6a+g2rWjKwc8IvV/NjzTwBXNg2TUMuMg90KosbuYrZoDT/tCnT7UY1US+J3hHtaZza0PahsIEQ74Ha/wuhQEQeVS17Fjxx1t5KGv68Sj793PB7OJ3LhljA69V8tYHfKw39JMgJNdVsARrTDrkOdOCSbwgDG2vO6GH/zFetfDUnhamOp2mDh3OKN+o8ZUwwpnuWSfaDeheLKFaFijlTAziM/krZZUZ5YdH3mlT0a5VhaRcCNbUxRS+ZkJVBIUNk5Kd3h7k3uiy14W/8UMbZZ/eNvED+Y31KDmYZgStg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/sEm9IIohiWWXKc+yqBbYPbZNzTeBD8jFU4kUTx/Ik=;
 b=peL/kQBBfTsagiMaBk6KHyIFQYKJCGzhMI/vivaotWuX0gGzJ7MvLHzxKAPA1sv2pQbqpys7ajaVll3Duf+IU7ol6L1HVSB/wLuB/BSejC2hMn95tpJxLKMFVxvSdbF2gIOfWJR28wI++rFBmL/3BqlhpwYv2bseVHBuBJOk1DU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Michal Orzel
	<Michal.Orzel@arm.com>
Subject: Re: [PATCH v2] xen/build: Add cppcheck and cppcheck-html make rules
Thread-Topic: [PATCH v2] xen/build: Add cppcheck and cppcheck-html make rules
Thread-Index: AQHYTzgLTKPDa7AQGEehVzKugb9ky6zxpoUAgAWt9AA=
Date: Tue, 19 Apr 2022 14:26:29 +0000
Message-ID: <D2065054-201D-4C4D-B96E-AEE6A00C594A@arm.com>
References:
 <74b35aab0706fc977a3c5c3dfa20b52fda6f4698.1649855186.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.22.394.2204151637350.915916@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2204151637350.915916@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: be302828-f50d-4a0a-ba91-08da2210a237
x-ms-traffictypediagnostic:
	AM6PR08MB3894:EE_|VE1EUR03FT044:EE_|AM5PR0802MB2545:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB254586902118E732E3E69B039DF29@AM5PR0802MB2545.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 szMEG2Z2uD/BcyJO+KuSpJrMWpTnKRfVxL+DHMh9csBJQP7BluPI0Ys8+VoLMVmSPrZLp9+VhR6bhybEItiSWPea1qEmP3yskCkvdCYKWKL8TXKZPv3kObwmIdS+u5y+Y12LaTaD3eHedUrYgY/tY2a2bZSGxnT9U/5k8exmjMSs5j5WPPB6N7oF3ur3xyiE3vCQ/8T9FxBqQbJck/JMNa3dW3cj/L++6KKIz1MgSCB4cSM/GHX70zv1jqF0E4EuJyjhT0SYgUEJoKZLTn3ogzfpdCOAvAUL/EnjFvgiWI2fEj9SvHPuiJ5hpe/1O7n2DCuNnihpXiliELr+W5G4lwUX1x9DDlR8BWTgsMC6TmrQNciutcX6cbZl7Z373fzxt7BDpGcXPmDz13ti9UL/GGy/F4Li/nt625f/rjS4aTqN4NTOttfV2H+Gfl6bneJ5h467MLW4m2AtlhjoG32KCGTXHOdzcXenYP3YRfm+AO6SxuvtzGtUOoSdc7EvEeVWt7r/KuCBtTrbVJSCvoZny82b4KhLDknSe2or9haCocMbQ8JsN0Vo6fXCtJuFZyYi4nf//3qAVa2UoJcHVYNYfF7872N6oY4frikJ2T69P+J1a2C+ofXHCWOEffdeigyCCBSZReGopqUEpA0NLK+5Nk6FwAP1u8edXxbsKPowpkTBc9MqK7XEZX8sSPGaCL/H+x9mrqEljnBzRU0VuY8RZ3azVtnUiejaG0X488x8JOFWv21Aa258i/1Cao4gbpFgeL7yPB5nn3CbzWSOuF7ZmEPuS/8NAEm8NHEW8LAlT37AaZG857zpkCVzoJE0JbFr
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(6916009)(316002)(30864003)(38070700005)(6486002)(38100700002)(86362001)(508600001)(6512007)(122000001)(91956017)(6506007)(5660300002)(8676002)(53546011)(2906002)(66446008)(66476007)(64756008)(66946007)(76116006)(966005)(4326008)(8936002)(66574015)(33656002)(2616005)(186003)(26005)(83380400001)(66556008)(36756003)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E7F2516F4D9A064F979B54011FDC08A8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3894
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7ecd619a-cb94-4ac7-6708-08da22109870
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	njSo3Fuz5H4ltcfwM4sCM8NEI3nO9ksiwN6XoAJAYtIs3POvjqloeMnil6z/hODRFeR/OKtYr7NA6citFIhrIBIYw8lp/OZ40JLl3La3ww3jLbtnS2OifFH0Wu7at38Dt2EP6P8L5LGfADxtS7hIC8Q0n4RMR9QNz9VEyXs5s32zFQdDXwBHGJ5AdfOM7G1selUaWkFPFdTLRFlI7rWMTgfNCYvwgiYdTbsLoXYCWXktr6ldwfBm0ggSXyk7lVASgRC2eh0AFvKtcrJoiAr3f2mK8yfNcAt//20IDSTTIpARYPNG66RaEUUk0vo9M4BQKMao3dD2AWDFLRzSMKgwLzHIBteh8BXAks5pKrlBK2RGwZMe4csGDa3nP/w9CH1uwqh9OQeZYQNG0Z9Q4dFgVej5CeP6q51JWfNgKGG0Xmey77vVaRpOvYWtr3GNHboeILPrHyGVaW4r92RXw3BdYlOXWnrwEAuGlN4ShUdIkIKSIviBH/E9RAArug9p8mgYUjEd38e25nJ0uVapAtF53EkX5OC743tV4K8baE/kLOa/jIODy0VuxVK8U/UQvOWUh88no7PtkrFOCPbab+m8k5n/qaf25cYulUZOaZ7e+CpzhK+LkExDpYolrpKBRrp/XaeZSGK9pFFgk3k5HY3esDSQvCCPSgSkFFL6pkNJTPn74Gg2/8U2rjnSYOw09HxrrR85ynoJemHXJXTXW1hAs3OWEQkLbI5eyCloVp9K3HDdXsfSIKvKmCyZ9SDX82klxh2Zog4wy2q+HIVGLLxT4g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(356005)(316002)(8676002)(6862004)(4326008)(2906002)(186003)(33656002)(36756003)(30864003)(70206006)(70586007)(36860700001)(83380400001)(40460700003)(8936002)(5660300002)(81166007)(508600001)(86362001)(6512007)(82310400005)(66574015)(336012)(2616005)(54906003)(47076005)(53546011)(26005)(966005)(6486002)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 14:26:46.1246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be302828-f50d-4a0a-ba91-08da2210a237
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2545

Hi Stefano,

> On 16 Apr 2022, at 00:42, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Wed, 13 Apr 2022, Bertrand Marquis wrote:
>> cppcheck can be used to check Xen code quality.
>>=20
>> To create a report do "make cppcheck" on a built tree adding any options
>> you added during the process you used to build xen (like CROSS_COMPILE
>> or XEN_TARGET_ARCH). This will generate an xml report xen-cppcheck.xml.
>>=20
>> To create a html report do "make cppcheck-html" in the same way and a
>> full report to be seen in a browser will be generated in
>> cppcheck-htmlreport/index.html.
>>=20
>> For better results it is recommended to build your own cppcheck from the
>> latest sources that you can find at [1].
>> Development and result analysis has been done with cppcheck 2.7.
>>=20
>> The Makefile rule is searching for all C files which have been compiled
>> (ie which have a generated .o file) and is running cppcheck on all of
>> them using the current configuration of xen so only the code actually
>> compiled is checked.
>>=20
>> A new tool is introduced to merge all cppcheck reports into one global
>> report including all findings and removing duplicates.
>>=20
>> Some extra variables can be used to customize the report:
>> - CPPCHECK can be used to give the full path to the cppcheck binary to
>> use (default is to use the one from the standard path).
>> - CPPCHECK_HTMLREPORT can be used to give the full path to
>> cppcheck-htmlreport (default is to use the one from the standard path).
>>=20
>> This has been tested on several arm configurations (x86 should work but
>> has not been tested).
>>=20
>> [1] https://cppcheck.sourceforge.io/
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>=20
> This is better, thanks! I don't have a lot of comments as it looks
> pretty OK to me already. Only one comment on the python script.
>=20
>=20
>> ---
>> Changes in v2:
>> - catch parsing errors during merge and tell the user to update cppcheck
>> - fix alignments in Makefile
>> - use srctree and objtree instead of BASEDIR
>> - remove SCTLR invalid change
>> - add a check of cppcheck version and mandate version 2.7 or greater
>> - rework the merge script to make it faster and display progress
>> ---
>> .gitignore                           |  3 +
>> xen/Makefile                         | 84 +++++++++++++++++++++++++++-
>> xen/arch/arm/include/asm/processor.h |  2 +
>> xen/include/xen/config.h             |  4 ++
>> xen/include/xen/kconfig.h            |  5 ++
>> xen/tools/merge_cppcheck_reports.py  | 83 +++++++++++++++++++++++++++
>> 6 files changed, 179 insertions(+), 2 deletions(-)
>> create mode 100755 xen/tools/merge_cppcheck_reports.py
>>=20
>> diff --git a/.gitignore b/.gitignore
>> index d425be4bd9..0d2d60b8f1 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -7,6 +7,7 @@
>> *.o
>> *.d
>> *.d2
>> +*.c.cppcheck
>> *.opic
>> *.a
>> *.so
>> @@ -296,6 +297,7 @@ xen/.banner
>> xen/.config
>> xen/.config.old
>> xen/.xen.elf32
>> +xen/xen-cppcheck.xml
>> xen/System.map
>> xen/arch/x86/boot/mkelf32
>> xen/arch/x86/boot/cmdline.S
>> @@ -316,6 +318,7 @@ xen/arch/*/efi/runtime.c
>> xen/arch/*/include/asm/asm-offsets.h
>> xen/common/config_data.S
>> xen/common/config.gz
>> +xen/cppcheck-htmlreport
>> xen/include/headers*.chk
>> xen/include/compat/*
>> xen/include/config/
>> diff --git a/xen/Makefile b/xen/Makefile
>> index ebc7854c08..734f9f2b4f 100644
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -335,7 +335,7 @@ export CFLAGS_UBSAN
>>=20
>> endif # need-config
>>=20
>> -main-targets :=3D build install uninstall clean distclean MAP
>> +main-targets :=3D build install uninstall clean distclean MAP cppcheck =
cppcheck-html
>> .PHONY: $(main-targets)
>> ifneq ($(XEN_TARGET_ARCH),x86_32)
>> $(main-targets): %: _% ;
>> @@ -423,15 +423,17 @@ _clean:
>> 	$(Q)$(MAKE) $(clean)=3Dtools/kconfig
>> 	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
>> 		-o -name ".*.o.tmp" -o -name "*~" -o -name "core" \
>> -		-o -name '*.lex.c' -o -name '*.tab.[ch]' \
>> +		-o -name '*.lex.c' -o -name '*.tab.[ch]' -o -name '*.c.cppcheck' \
>> 		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {}=
 \;
>> 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.ma=
p $(TARGET)-syms $(TARGET)-syms.map
>> 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
>> 	rm -f .banner .allconfig.tmp include/xen/compile.h
>> +	rm -f xen-cppcheck.xml
>>=20
>> .PHONY: _distclean
>> _distclean: clean
>> 	rm -f tags TAGS cscope.files cscope.in.out cscope.out cscope.po.out GTA=
GS GPATH GRTAGS GSYMS .config
>> +	rm -rf $(CPPCHECK_HTMLREPORT_OUTDIR)
>>=20
>> $(TARGET).gz: $(TARGET)
>> 	gzip -n -f -9 < $< > $@.new
>> @@ -505,6 +507,84 @@ cloc:
>> 	    done; \
>> 	done | cloc --list-file=3D-
>>=20
>> +# What cppcheck command to use.
>> +# To get proper results, it is recommended to build cppcheck manually f=
rom the
>> +# latest source and use CPPCHECK to give the full path to the built ver=
sion.
>> +CPPCHECK ?=3D cppcheck
>> +
>> +# What cppcheck-htmlreport to use.
>> +# If you give the full path to a self compiled cppcheck, this should be=
 set
>> +# to the full path to cppcheck-html in the htmlreport directory of cppc=
heck.
>> +# On recent distribution, this is available in the standard path.
>> +CPPCHECK_HTMLREPORT ?=3D cppcheck-htmlreport
>> +
>> +# By default we generate the report in cppcheck-htmlreport directory in=
 the
>> +# build directory. This can be changed by giving a directory in this va=
riable.
>> +CPPCHECK_HTMLREPORT_OUTDIR ?=3D cppcheck-htmlreport
>> +
>> +# Compile flags to pass to cppcheck:
>> +# - include directories and defines Xen Makefile is passing (from CFLAG=
S)
>> +# - include config.h as this is passed directly to the compiler.
>> +# - define CPPCHECK as we use to disable or enable some specific part o=
f the
>> +#   code to solve some cppcheck issues.
>> +# - explicitely enable some cppcheck checks as we do not want to use "a=
ll"
>> +#   which includes unusedFunction which gives wrong positives as we che=
ck file
>> +#   per file.
>> +#
>> +# Compiler defines are in compiler-def.h which is included in config.h
>> +#
>> +CPPCHECKFLAGS :=3D -DCPPCHECK --max-ctu-depth=3D10 \
>> +                 --enable=3Dstyle,information,missingInclude \
>> +                 --include=3D$(srctree)/include/xen/config.h \
>> +                 -I $(srctree)/xsm/flask/include \
>> +                 -I $(srctree)/include/xen/libfdt \
>> +                 $(filter -D% -I%,$(CFLAGS))
>> +
>> +# We need to find all C files (as we are not checking assembly files) s=
o
>> +# we find all generated .o files which have a .c corresponding file.
>> +CPPCHECKFILES :=3D $(wildcard $(patsubst $(objtree)/%.o,$(srctree)/%.c,=
 \
>> +                 $(filter-out $(objtree)/tools/%, \
>> +                 $(shell find $(objtree) -name "*.o"))))
>> +
>> +quiet_cmd_cppcheck_xml =3D CPPCHECK $(patsubst $(srctree)/%,%,$<)
>> +cmd_cppcheck_xml =3D $(CPPCHECK) -v -q --xml $(CPPCHECKFLAGS) \
>> +                   --output-file=3D$@ $<
>> +
>> +quiet_cmd_merge_cppcheck_reports =3D CPPCHECK-MERGE $@
>> +cmd_merge_cppcheck_reports =3D $(srctree)/tools/merge_cppcheck_reports.=
py $^ $@
>> +
>> +quiet_cmd_cppcheck_html =3D CPPCHECK-HTML $<
>> +cmd_cppcheck_html =3D $(CPPCHECK_HTMLREPORT) --file=3D$< --source-dir=
=3D$(srctree) \
>> +                    --report-dir=3D$(CPPCHECK_HTMLREPORT_OUTDIR) --titl=
e=3DXen
>> +
>> +PHONY +=3D _cppcheck _cppcheck-html cppcheck-version
>> +
>> +_cppcheck-html: xen-cppcheck.xml
>> +	$(call if_changed,cppcheck_html)
>> +
>> +_cppcheck: xen-cppcheck.xml
>> +
>> +xen-cppcheck.xml: $(patsubst $(srctree)/%.c,$(objtree)/%.c.cppcheck,$(C=
PPCHECKFILES))
>> +ifeq ($(CPPCHECKFILES),)
>> +	$(error Please build Xen before running cppcheck)
>> +endif
>> +	$(call if_changed,merge_cppcheck_reports)
>> +
>> +$(objtree)/%.c.cppcheck: $(srctree)/%.c $(objtree)/include/generated/au=
toconf.h $(objtree)/include/generated/compiler-def.h | cppcheck-version
>> +	$(call if_changed,cppcheck_xml)
>> +
>> +cppcheck-version:
>> +ifeq ($(shell which $(CPPCHECK)),)
>> +	$(error Cannot find cppcheck executable: $(CPPCHECK))
>> +endif
>> +ifeq ($(shell $(CPPCHECK) --version | awk '{print ($$2 < 2.7)}'),1)
>> +	$(error Please upgrade your cppcheck to version 2.7 or greater)
>> +endif
>> +
>> +# Put this in generated headers this way it is cleaned by include/Makef=
ile
>> +$(objtree)/include/generated/compiler-def.h:
>> +	$(Q)$(CC) -dM -E -o $@ - < /dev/null
>> +
>> endif #config-build
>>=20
>> PHONY +=3D FORCE
>> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include=
/asm/processor.h
>> index 852b5f3c24..ef37cfa16f 100644
>> --- a/xen/arch/arm/include/asm/processor.h
>> +++ b/xen/arch/arm/include/asm/processor.h
>> @@ -219,9 +219,11 @@
>>                          SCTLR_Axx_ELx_A    | SCTLR_Axx_ELx_C   |\
>>                          SCTLR_Axx_ELx_WXN  | SCTLR_Axx_ELx_EE)
>>=20
>> +#ifndef CPPCHECK
>> #if (SCTLR_EL2_SET ^ SCTLR_EL2_CLEAR) !=3D 0xffffffffffffffffUL
>> #error "Inconsistent SCTLR_EL2 set/clear bits"
>> #endif
>> +#endif
>>=20
>> #endif
>>=20
>> diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
>> index 85c6f59be9..d888b2314d 100644
>> --- a/xen/include/xen/config.h
>> +++ b/xen/include/xen/config.h
>> @@ -7,6 +7,10 @@
>> #ifndef __XEN_CONFIG_H__
>> #define __XEN_CONFIG_H__
>>=20
>> +#ifdef CPPCHECK
>> +#include <generated/compiler-def.h>
>> +#endif
>> +
>> #include <xen/kconfig.h>
>>=20
>> #ifndef __ASSEMBLY__
>> diff --git a/xen/include/xen/kconfig.h b/xen/include/xen/kconfig.h
>> index 4d58c5bb3c..a717b0819c 100644
>> --- a/xen/include/xen/kconfig.h
>> +++ b/xen/include/xen/kconfig.h
>> @@ -8,6 +8,10 @@
>>  * these only work with boolean option.
>>  */
>>=20
>> +/* cppcheck is failing to parse the macro so use a dummy one */
>> +#ifdef CPPCHECK
>> +#define IS_ENABLED(option) option
>> +#else
>> /*
>>  * Getting something that works in C and CPP for an arg that may or may
>>  * not be defined is tricky.  Here, if we have "#define CONFIG_BOOGER 1"
>> @@ -27,5 +31,6 @@
>>  * otherwise.
>>  */
>> #define IS_ENABLED(option) config_enabled(option)
>> +#endif
>>=20
>> #endif /* __XEN_KCONFIG_H */
>> diff --git a/xen/tools/merge_cppcheck_reports.py b/xen/tools/merge_cppch=
eck_reports.py
>> new file mode 100755
>> index 0000000000..eabf558768
>> --- /dev/null
>> +++ b/xen/tools/merge_cppcheck_reports.py
>> @@ -0,0 +1,83 @@
>> +#!/usr/bin/env python
>> +
>> +"""
>> +This script acts as a tool to merge XML files created by cppcheck.
>> +Usage:
>> +    merge_cppcheck_reports.py [FILES] [OUTPUT]
>> +
>> +    FILES  - list of XML files with extension .cppcheck
>> +    OUTPUT - file to store results (with .xml extension).
>> +             If not specified, the script will print results to stdout.
>> +"""
>> +
>> +import sys
>> +from xml.etree import ElementTree
>> +
>> +def elements_equal(el1, el2):
>> +    if type(el1) !=3D type(el2): return False
>> +
>> +    el1_location =3D str(el1.find('location').attrib)
>> +    el2_location =3D str(el2.find('location').attrib)
>=20
> I managed to repro another stacktrace:
>=20
>  CPPCHECK-MERGE xen-cppcheck.xml
> 123 / 191Traceback (most recent call last):
>  File "./tools/merge_cppcheck_reports.py", line 83, in <module>
>    run()
>  File "./tools/merge_cppcheck_reports.py", line 72, in run
>    result =3D merge(files)
>  File "./tools/merge_cppcheck_reports.py", line 53, in merge
>    if not contain_element(xml_error_elem, curr_elem_list):
>  File "./tools/merge_cppcheck_reports.py", line 28, in contain_element
>    if elements_equal(new, elem):
>  File "./tools/merge_cppcheck_reports.py", line 19, in elements_equal
>    el1_location =3D str(el1.find('location').attrib)
> AttributeError: 'NoneType' object has no attribute 'attrib'
> make: *** [Makefile:685: xen-cppcheck.xml] Error 1
>=20
> It must be a natural talent :-)
>=20
> Should we have a try/except also here as well?
>=20
> FYI I added:
>=20
>    if el1.find('location') is None: return False
>    if el2.find('location') is None: return False
>=20
> And that solved the issue for me

You are very talented to trigger the errors (I do not have any on my side).
Anyway I will include this and make the try/except to catch any kind of err=
ors in v3.

Thanks a lot for the deep testing :-)

Cheers
Bertrand


