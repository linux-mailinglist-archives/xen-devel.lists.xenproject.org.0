Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F79387EE9
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 19:48:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129533.243128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj3oG-0007OW-NU; Tue, 18 May 2021 17:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129533.243128; Tue, 18 May 2021 17:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj3oG-0007Lj-Jk; Tue, 18 May 2021 17:47:12 +0000
Received: by outflank-mailman (input) for mailman id 129533;
 Tue, 18 May 2021 17:47:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjCN=KN=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1lj3oF-0007Ld-6u
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 17:47:11 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 987fbc12-c441-4d57-a04d-f9985179e926;
 Tue, 18 May 2021 17:47:09 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IHfNFa030982; Tue, 18 May 2021 17:47:07 GMT
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 38ker18sqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 17:47:07 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14IHl6Rv001480;
 Tue, 18 May 2021 17:47:06 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2171.outbound.protection.outlook.com [104.47.73.171])
 by aserp3020.oracle.com with ESMTP id 38mecfqup4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 17:47:05 +0000
Received: from DM5PR1001MB2236.namprd10.prod.outlook.com (2603:10b6:4:35::18)
 by DS7PR10MB5088.namprd10.prod.outlook.com (2603:10b6:5:3a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 17:46:52 +0000
Received: from DM5PR1001MB2236.namprd10.prod.outlook.com
 ([fe80::c93a:7a62:bc1d:9a34]) by DM5PR1001MB2236.namprd10.prod.outlook.com
 ([fe80::c93a:7a62:bc1d:9a34%5]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 17:46:52 +0000
Received: from tomti.i.net-space.pl (84.10.22.86) by
 AM6P192CA0108.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 17:46:50 +0000
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
X-Inumbo-ID: 987fbc12-c441-4d57-a04d-f9985179e926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=OknAS0Vku0/6NWsRPI/c0PQqhkBgugDVL1iba7WFc74=;
 b=oBYUAn38tZ2bxqIVm3+SbDVBG7k2NJBGll4rxAjyJ0loTx/+LRgUBBswG2Hm3KQL3oB5
 ujeBRRdjvmSXVY7cSnxYozcqTjTNK/xaWQyWI+c4Q5l7lmafOYRzj4bnTbg8v3niK1Tg
 6M5YjWmMA5XSL34hlVE2UZ7dKuZd3VDVE6hCPpPFV6kHDCxeTQWYQHXc7QeAt/dWqUz5
 r0wC0Cbuxx/PlF3fNTZRWwW+8TCwQcmeiIU2V2XCiOxV4gahDR5eN+P9G+aQunsyIC09
 FKOfj3fqRGQbTp+naRBHWavVO2rnuWc2A6XZi02yA77UJCELhT/rNMriJ28rFOsKY5+J hQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHyUTXKj+QHcDpUTvANI9v6SpQyem0xaWF71+jn/pXxYi82Aj+O9ONIDqn/iGslwPTnU4cmQ23k+8qLkpc64wKGkR0gaKE8I0kBr4qmIyjbop7AyuDwRmbqbHHusnfyH4t0iKC9q9bNtdhmbx+RnqPEbUnsD8REAy0YXTqzC3JmC4fSyAf80lgvUHzCOpePwK/Btg4epB7dumwEwj76BuVgrQzuXEw+2/qfzJOSlaYu4BdTzGUPtB+gIHNJOQ+JdUbyffPrrbIzkJnVCJcQmn46WLN+U1xox4Aug7EpeumpLxziFb0KpvGJZldK7Uq/JF3Knc8EnKQ/sVzlaLqOP7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OknAS0Vku0/6NWsRPI/c0PQqhkBgugDVL1iba7WFc74=;
 b=UC7jVtZl64T4tjAko0GVk8Nrik93JEtzypy2mgZ7+suQ52REH+lTjm8VrI2Le9vKv2TnK0a1rCdWi49cnsjTG2bAIz3KRQtRNgkS2YWBsJLs8G137AS5FlnKxQKZszv0PqfjQdaVPxPmj78pchCZeMsueVwJ7SQ0pzNrXBFxrpZNF0sJ8X8OJidul5VV7myeSa2dAGYb03tUa6CZ2W/YTQWgMS/e+UqTynL6L8lhXYEGdLyBqL+V6MIXMNq6ijb3BXkSi+Yati7Bv4Dgz5tJJxWSy5bmUo1UvmaYLvzAoup1H7XvJM4W3S3uz/muzUi6Mw1DUD9hlvy6BwnTOG3L6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OknAS0Vku0/6NWsRPI/c0PQqhkBgugDVL1iba7WFc74=;
 b=iSTiaO0iTa04uLtpwbwsxBEw7hHP6tm4iGHxoXKDxbEQxOKhLmkGfvF1fvjRnQUnUGzFNbOcM2FzmzOPUSAwN6JK2YsXL7YeoMPvoq70sV8cRTBZBelCo2wIkhqWISISpPEo6q3zJX3knfJzn3Dgr2abXDqaLG5t5HxbOogq/3A=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Date: Tue, 18 May 2021 19:46:33 +0200
From: Daniel Kiper <daniel.kiper@oracle.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/5] xen/x86: manually build xen.mb.efi binary
Message-ID: <20210518174633.spo5kmgcbuo6dg5k@tomti.i.net-space.pl>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <28d5536a2f7691e8f79d55f1470fa89ce4fae93d.1611273359.git.bobbyeshleman@gmail.com>
 <3c621726-31c4-6a79-a020-88c59644111b@suse.com>
 <74ea104d-3826-d80d-3af5-f444d065c73f@gmail.com>
 <a183a5f9-0f36-187d-fd06-8d6db99cbe43@suse.com>
 <20210517132039.6czppjfge27x4mwg@tomti.i.net-space.pl>
 <ee89a22d-5f46-51ed-4c46-63cfc60cbafc@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee89a22d-5f46-51ed-4c46-63cfc60cbafc@suse.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Originating-IP: [84.10.22.86]
X-ClientProxiedBy: AM6P192CA0108.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::49) To DM5PR1001MB2236.namprd10.prod.outlook.com
 (2603:10b6:4:35::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 883dbd60-cc5f-4878-c272-08d91a24eba8
X-MS-TrafficTypeDiagnostic: DS7PR10MB5088:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DS7PR10MB5088612D56862A1351AB12F3E32C9@DS7PR10MB5088.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jy/T8pxZJXhNHv32or2ly3Drx1BtJ9q3qlDBYvRhtSVLgQ4jFn0CUbm5Y4AyOwBJ+ZHxpo06jZUS3f+KLBynthC8smEOo+kOTUtxWFvaBt+pNRll4tbwrWK4kOa/nLe1d40dCswstNiqNer1fnvSc7FquoRmreewLc4KNhiqD893HtV0jtpnh5wgUUJ09joAFIkD3oHUpFQxupJ1M1WoOjGY8RxYKsRdS//d3XJDKIy4q/jruZZIJniOdbOot0Syg4C7+oIrlrTxqRHoaURD2wchDg/TWA2KWxH66yZf7e/RACovU/IPf3AZffHTxSYvMQStUwecHEMb9E95UYKCrYIsamdQGcoTnKu2g6phFqlFEIK6iqrErRcJ/d2BDRDwpKFxkxXHb4xjg1qxsi6YPsEApI/TJoXf8xBZ8tN9fcApf9c2kC0c6ZaSUbH5QbTgPDxvESwg/BI1f23n8fSe4fNK1Akw/fCu+V8Dm84xbte+XiERTE2ACrof6Xl5FiIIV7leY7dvHjAr09OnXxz362BHXLfDMn2hIhA61C68ddEMXApXmeYXN7ShNjqXF32qpydadED90+/7FdTJDH1Di5Qfn0alAVOKA7Nel818l/LX4zB2fq82b1pCxUeI8x2Fzrx4lXh872Kt7wVBWmb/Kg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1001MB2236.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(366004)(376002)(396003)(136003)(316002)(16526019)(6666004)(8676002)(956004)(186003)(66946007)(54906003)(9686003)(4326008)(52116002)(86362001)(38100700002)(38350700002)(26005)(66476007)(55016002)(2906002)(8936002)(6506007)(7696005)(478600001)(6916009)(53546011)(1076003)(44832011)(66556008)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?aasTtakEfrnyXRslgE9kBPggxFUO+ne7ImIYCaWRBsXZVOD9YJOT8RP8nam6?=
 =?us-ascii?Q?PqytFpFMgJo4bg3DbZNgzn/X1W+WVOKOPjZ1dz0fuUNCNVuilsRunZfcZOzu?=
 =?us-ascii?Q?K5u/AiriHtsyoIfLXa1AFg2wOWXMO20oZSArsPDCl0FQajsHuZBGrNtotxzk?=
 =?us-ascii?Q?1LIjLqMPrRX1VY67gdouugLLVtXJ6pqCy4pYbFPBsTqlnKmTCiGLP+cICpMx?=
 =?us-ascii?Q?4Im0e/x39wgumEEewCpLBTViFF8tWfFKS/de6uwySEz57g2Z4pcc0hy3V8gT?=
 =?us-ascii?Q?9mnNbT6RlH/U+z3F1X+4XsgTgi+SJUrI/BwGqRTaEitBQJg6kNrPtF5YcNao?=
 =?us-ascii?Q?+BhtLVqDTlCH0Ekmzmr6QR6nIr7ValzZlreEnoFOWPrFj0frOJ7jjZI27ts+?=
 =?us-ascii?Q?/hs+6JHwp71ESCWvhvsx19AssR4M9SsJvRyA4QSRBZI0R7jlL2uzfWU0OVFA?=
 =?us-ascii?Q?Q0oyAkvCHtLycdCnBRg6S/GfJFgtTQHrPlCz639cwCF5BcVJzi549aqO5JXt?=
 =?us-ascii?Q?I1HvuxSa8hmU8MdeM58Mgk7ecItHgrCZXTOnOzO0w7bBS+AfpgU4eQZZbIFC?=
 =?us-ascii?Q?VevS3doQqmjm8vkfhOCk6tcciMv21JgEYMUWCm4HS6y8+AL9hxvsYXlLMGoj?=
 =?us-ascii?Q?dxPmkfigyKrKAW+tTOmQXN04FAyYVWLcFwun8rd+ucx/y+O3HT1/AMcMkGWo?=
 =?us-ascii?Q?hLXjFQZPM4/rCXzmS10MldF8Vx8FBHAQKPTNgaZRNrNfaeEKJD2ezEsm99aw?=
 =?us-ascii?Q?1rHmwCcGudpCUqh+qgQNZGW4qgrsXdUUzzOUiPBE023cHVsay+bqLoza2tjT?=
 =?us-ascii?Q?j33/sYzn0aJvQQimvUD8gMB1CSslKA952lMRbPkeclJiHDsy/hZ1IKVTSAGI?=
 =?us-ascii?Q?4HUW0mcAGA+5kCSZnMsa7flm+wkHT0wJ9g+4EEMioaqn/w+geDMuLN2Plhr+?=
 =?us-ascii?Q?LYQ+SeXm6/BjaNAwFNUz9QGoZ3F30R/FrIfOs+NtJ2hOOlEpbSulL5d732sL?=
 =?us-ascii?Q?75BHXPXN7CWUkSo7REgFfyLPWjI0+GYUyqnDAKC6R//n4Qf1CvJa99V7AJV4?=
 =?us-ascii?Q?HG6/EukJ/GelEF3XqC87hBkSjCuc5/U+MGEPdZ9p76rAz4g56VJjxzpfK5wi?=
 =?us-ascii?Q?orklKlwJ4QBbQ4r1CPvxFoBEwLqCS0vroUj/DcZjIfBOa6mISzQLZWbumta8?=
 =?us-ascii?Q?uDvVjs9HEq7aYDNEUisfXMVml3Op29qEQUU+CAXyGoEPz0SrJOmetfVUxsbX?=
 =?us-ascii?Q?Ob3NREnWC0B9K2rDAsdgzOGRMyNYJzRy9lIhuBWQp5fqEQO91npropY+j8y+?=
 =?us-ascii?Q?hcOV3uqxoduSEV0vpRXQ86nc?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883dbd60-cc5f-4878-c272-08d91a24eba8
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1001MB2236.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 17:46:52.6405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4B1666DSpp56OqolJ4DCUeAHA/odPb94rih4uNiZboA4l37TPe6T+hF1fIqKzpOc3KcW8akogPowqLaSxAJrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5088
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9988 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105180123
X-Proofpoint-GUID: TJm8NL4RWw5UrQTgBlBkf5ii-su9H3Jr
X-Proofpoint-ORIG-GUID: TJm8NL4RWw5UrQTgBlBkf5ii-su9H3Jr

On Mon, May 17, 2021 at 03:24:28PM +0200, Jan Beulich wrote:
> On 17.05.2021 15:20, Daniel Kiper wrote:
> > On Mon, May 17, 2021 at 08:48:32AM +0200, Jan Beulich wrote:
> >> On 07.05.2021 22:26, Bob Eshleman wrote:
> >>> What is your intuition WRT the idea that instead of trying add a PE/COFF hdr
> >>> in front of Xen's mb2 bin, we instead go the route of introducing valid mb2
> >>> entry points into xen.efi?
> >>
> >> At the first glance I think this is going to be less intrusive, and hence
> >> to be preferred. But of course I haven't experimented in any way ...
> >
> > When I worked on this a few years ago I tried that way. Sadly I failed
> > because I was not able to produce "linear" PE image using binutils
> > exiting that days.
>
> What is a "linear" PE image?

The problem with Multiboot family protocols is that all code and data
sections have to be glued together in the image and as such loaded into
the memory (IIRC BSS is an exception but it has to live behind the
image). So, you cannot use PE image which has different representation
in file and memory. IIRC by default at least code and data sections in
xen.efi have different sizes in PE file and in memory. I tried to fix
that using linker script and objcopy but it did not work. Sadly I do
not remember the details but there is pretty good chance you can find
relevant emails in Xen-devel archive with me explaining what kind of
problems I met.

> > Maybe
> > newer binutils are more flexible and will be able to produce a PE image
> > with properties required by Multiboot2 protocol.
>
> Isn't all you need the MB2 header within the first so many bytes of the
> (disk) image? Or was it the image as loaded into memory? Both should be
> possible to arrange for.

IIRC Multiboot2 protocol requires the header in first 32 kiB of an image.
So, this is not a problem.

Daniel

