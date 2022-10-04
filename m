Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AD35F468D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 17:21:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415615.660227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofjj8-00054A-OH; Tue, 04 Oct 2022 15:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415615.660227; Tue, 04 Oct 2022 15:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofjj8-00050h-Kl; Tue, 04 Oct 2022 15:20:58 +0000
Received: by outflank-mailman (input) for mailman id 415615;
 Tue, 04 Oct 2022 15:20:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AV+7=2F=citrix.com=prvs=269045312=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ofjj6-00050b-OZ
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 15:20:56 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2289fc16-43f8-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 17:20:54 +0200 (CEST)
Received: from mail-mw2nam04lp2168.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 11:20:51 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BY5PR03MB5281.namprd03.prod.outlook.com (2603:10b6:a03:226::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 4 Oct
 2022 15:20:46 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 15:20:46 +0000
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
X-Inumbo-ID: 2289fc16-43f8-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664896854;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=bSX34VhiFTZx92HxkjMB5r2sgl4jWRWBXKW4GQV3CBQ=;
  b=A22xp2vD/ArkG+7PZrBGSiSXqa8gzgNM5QATqt1r9oMPaL6UrSAlLbU0
   oG6tSf7IvqCfYOnuyc4ogkxTcYMOjvlT/MLhKfkQvhwHO3tnYvKreRACx
   JTDkMi6bhVAE3TLCQRT5q0qvRWayqD5WZSeIXTXdGmDrIbCRc5wrglN5m
   s=;
X-IronPort-RemoteIP: 104.47.73.168
X-IronPort-MID: 81966163
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3ArdfUsqvna67ZOdpgzLwpRSetz+fnOphVZhZg5?=
 =?us-ascii?q?MifNrXfuXnw3RfKv+XtsWuyehrud3beeAXCVfNA4wCX7e0k/D8hhDNkImdKP?=
 =?us-ascii?q?KKRlNUGi53kHEUtGdQpKxBf2IBDIkaMoNjs3k32Tn0XoIIRTM/z7n5pFH5KQ?=
 =?us-ascii?q?FTXH2Jls3CE57NdUn0f/ln3g1ulqWunx9NCih/NzEKLss9ddfs+xn/215p73?=
 =?us-ascii?q?hFBG6+u/KovLgnq7+fnNvqpbVAho41L3VAc/Jy+QNyNpCdQ1LoFiDN0HO+88?=
 =?us-ascii?q?+H8PtXu3d3uP5guTUcH3RnHgkFunKwrqENggB2hlZtHtBaTxWgNajVyU2mdc?=
 =?us-ascii?q?cZA+WSDEBKbxbU1NZpxEqogDj/nyZO+F+Fo2Tq9pcpBQAlKEfAroRWClB7vr?=
 =?us-ascii?q?DQDImjYCQOJ/SZFXaUEfL1feCVhkxm4gge4+l/dwMHmX9zTLuFfPqVeEiwYt?=
 =?us-ascii?q?xiOZAURmqQkDY3tYH13Y27z+wRMAtJkdd/kv2+34hqr58TJvM5sozmtWio15?=
 =?us-ascii?q?zyTkt+77aEISvPbm0SUZJiVOLbBOTBZARqwc/1E+cTuyu4WJgw4Ef8+d5QeJ?=
 =?us-ascii?q?W5tKHpVQ3rbttPHjdrpMexditGtRIuVErNDopoHnJY+gAVnNU3fisnstv776?=
 =?us-ascii?q?d9xQYydQExiXeaFgiL7frhh9dfNDKElyPjDXPMV2/hUmKDpDqtG3wp7pV6z5?=
 =?us-ascii?q?wQoisvmQvZ2/aavSqsIluBxhkKtVWlswbCEKGrcoNEAzajydO+37aTrVAWa2?=
 =?us-ascii?q?8XO5z+slM3HDKaWdf103x3y2Vr7bconuAmQqmtp5R06PA54P7hhSYF5EGDNf?=
 =?us-ascii?q?3nKGpRNxYgOtuCpjKJoQGgfJ2xH5wxgNCNHs/gJQmm/K98O6dOgKLFydjYNt?=
 =?us-ascii?q?60hNJxtJ3u/sYmINlnf0xtLpazS0fHf4Bly6Z5q5RIqmJfS/z75Oma9Pr3jQ?=
 =?us-ascii?q?EVTU9Y+nb53A1dWVBMe1YWboJW0Rg6ApmwiV+f4Y/Jj7QU46ndrjbtSItjiG?=
 =?us-ascii?q?4pNjDXkSMdx7KGcV1iMAQuxVHpkE8dNyCseymd80ueKniJYBy+eaOKv4nzHD?=
 =?us-ascii?q?9EQB/cqxuZ2tzbAhd142J3XZ7AUEsEx3BQAOsZELlfo43fUl87uPH979RKVC?=
 =?us-ascii?q?8ZmUSJUEWhEmJyvYCWhSzdGPHfs9Imj3kL+2paHl51JlmIQlp2wOYYGjbU8b?=
 =?us-ascii?q?ptxl4maRv18I6VbMhXEBlo0yuRCYx2q7znuC12aErsjJH69u5UJ0U29qCQoj?=
 =?us-ascii?q?f3PVNyxbECYUgpG66Sy3hoUUe2PUrDmE02j8CzBpR9qI0ej5hFl3/tj9PcP5?=
 =?us-ascii?q?h/P4fXgK2LqPEs/+TBebr92UtRiPev9bUkJrQleVN4dj1ZXgMOtfh0HYAF6C?=
 =?us-ascii?q?TaXo6u/xUOur+siPwP0pOcrVW41qwZfV3jjwkrCAbtzlqgwyInD8WNYNDT+U?=
 =?us-ascii?q?VPIrund3AaCa3HQhK/9TO4wi1nL0pvcT6fu0cGgVGPQZ5IAkd7KbSXjU/gNJ?=
 =?us-ascii?q?Z9O8MiqZVk2AEQRUz02DHaUs6yZvFhEY95uelqSDpryDF/CNTBxqkKGmAnkn?=
 =?us-ascii?q?UjqhFIQ+RjqlLMbs4Dk3XxuZvajQ3xMzkJV3oC8MIvQqq8xoap/nTN7iTiNr?=
 =?us-ascii?q?MkbkT29ZBJB7aZcVZltN0Eo52sTyxXIUq44opJBoJY2FdB2ox1zKF7P1B2jX?=
 =?us-ascii?q?W64aYVILbMGGBbjq+JBuf/7BDND+UldTYBDrfRoDY6sA4cvBM0C1ahkFtBBH?=
 =?us-ascii?q?bPemGI5NWgUHQ01atGNa40++NT+cI+GA81SbFy7lqtcxvVL2IFcyjouf9XDm?=
 =?us-ascii?q?dhWTS77o5CVw5CVQHZeqLzfPjeZI8q5/GOuPxjhCg/yCHjis3YmJ6coL/4Yn?=
 =?us-ascii?q?Mwz/jNwa1zpaM/I0JB9eEyvSBwapb+SOnXfiUI2gymjkZeDGt5hlqFuamN/k?=
 =?us-ascii?q?Pip5RUvJkJZMMr2KPkKaGcHOJwwvFrPEYqZs4ctc7DK7CPN75fLZArTSWnaQ?=
 =?us-ascii?q?+W1vTMi+e6FWidbPawG3kTmyNfoXU4C2vN5c2mvOANAkZq/rATrWVfAysL61?=
 =?us-ascii?q?F544cILWc2ud1lDQ3cLV4+cY7iEwXCWB88mJKTLasxeDDwedhMuapQ057z7U?=
 =?us-ascii?q?oQ3gghHi1r7qN6WtIaVWRLlEPF/C1bkcRNj0lheotRGUxRBR7YYCAmovQp6b?=
 =?us-ascii?q?Pv/l7Wa5Ciha9hlkZOz/7fXrKVyQDLErNTBukFd21VxL9PiRjlcSvh7Uc2uQ?=
 =?us-ascii?q?D65ti82gvxtWlzjSfosNXg5hmb0xglIy8bbZhfV1duG3cJSzRS1MJV0wVAvy?=
 =?us-ascii?q?QO3wpAydaSMzVHyRiPbx/qhL3f30xFt9Wxmp8lZX1y1lYb8Wrn0gMqGrnC7C?=
 =?us-ascii?q?wtJl6vSoZmng+IKhGqqy0k6BuvnJxCdD+i3y+FwLhRQxQKoZKaT5LcSH2Ooo?=
 =?us-ascii?q?iMd66DceFPPVUWTBKUkOqhYWNzrBzOc7jixIRPgn6SeoOdJUPfjrrO6dsR1y?=
 =?us-ascii?q?K/Tn98ebjtDxYELu7aW6V0H0riK3Z+QS0pRNMkgwk6xj2mJOqSympYsCn1+e?=
 =?us-ascii?q?deaxIuLlFjBUKOsdKyaaaoSWHo8/RH40JOrVJPKC2L1t23fnqeck5M2QQKv6?=
 =?us-ascii?q?dsPlyq/8MveocGELVU9Y9C4ZRyh2td9X5G6UfLzoO19l5cYoULazURrTAQTC?=
 =?us-ascii?q?qHZvvXN/nIM4MOdqUCI14jrBXCgma5mQ1ZORUvSP+ZDBfX8fTTOeJBJMz2u+?=
 =?us-ascii?q?5g4+0G4lvB2+snY?=
X-IronPort-AV: E=Sophos;i="5.95,158,1661832000"; 
   d="scan'208";a="81966163"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLfvJlza1eZ6a/wg9LFpEsuClxcCtctgkqNp8zir5iETFcSNyg6u2vSHtQg7kHy86G9VKI0EfsLCWn09p+6/NK0NwIVDaZoMCFPfCKQO+eF4pQolXBWpEJ5A4tGeajiE9AC7bG8wLY6339wmYtyE7kK1ttOmywdoQ8UDc7ROzoNDDpWuSIvM1z0p88uj30mKTEo5J1QZkoDVO2nDvdFVDHlrZ7RygotXBdRKj/bMlut5JVC2+LRMkJCv+RpfA5NsoFxWZaW68m7ao2tQ1bkjnQsKKeUnVBCWwwoGfGQv1lcwirbGZtpqHnWd83u2vSX553XQN/jz/c8/xOcBClCtKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hW4Gsv37wKLzAqGRy9sFaXOAGzcfWGa1ZwMH6uEUSxw=;
 b=QbY8YTbqc0ggQMt8vjp3ZwoCnfWruIhkyrpIr0s1LjJalEfYHCUJO4E5K+QlkhqB4MO86JC1y2/zH+tk0hr6ET9vng8q1XJbghzZGW7TL8kOU1X32k4c5C56lmqyMupx+QmXBcxoAd/U/N4ggWQhuDNJyMvUuYe7qVgu3oO3820sqnngNAVnvWxp2zwatQJS5BJYGn9VAZsUT40B4y2+g2z8XRt9VkWRtuD5SpQVG2dMBr+2AOBF2gwROuVqPbcNmRMEJDKa4lLyjKOxeRDzvMdAj/FlRnVdUMscDUDdcTrGzPmXFPYQ/8A5TadcJwMdmemkeqJZzcxK4uiGo6cnYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hW4Gsv37wKLzAqGRy9sFaXOAGzcfWGa1ZwMH6uEUSxw=;
 b=h3FNrhc+Ivb0U46LwVp94ucCv63281qaP6DdnJrp1JDW86oEVZTnMPKRujkMChQFFwHfSfa51ypvjseQ080XxkESJEEgaQK6fRRreUDJaBP81cSgB67qlNcygBpsEOk2lr0pYX8dcwlZlEnJop8h8UJfakpNYoP33npy7gQCGuI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Oct 2022 17:20:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use
 to ordinary RAM
Message-ID: <YzxPSCXpzjcUmPAO@Air-de-Roger>
References: <Yzv92zTdfG748MXO@MacBook-Air-de-Roger.local>
 <19befbce-ac16-19fe-25a0-73678ce440c0@suse.com>
 <YzwNGd0wiAbhDR9e@MacBook-Air-de-Roger.local>
 <db9856f9-1777-8fe5-5b5a-ef3f132193dc@suse.com>
 <YzwQymW3jkfzUQrI@MacBook-Air-de-Roger.local>
 <9aa0569a-bc18-9480-c86a-817222d4fea1@suse.com>
 <Yzwsq/LL/i9ARxiJ@Air-de-Roger>
 <8fcb15bf-4477-78f4-f8ee-33603ef20995@suse.com>
 <Yzw8t4oECUL6tzNB@Air-de-Roger>
 <0f3d61a9-aeac-0aba-e930-cee80c9232fe@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f3d61a9-aeac-0aba-e930-cee80c9232fe@suse.com>
X-ClientProxiedBy: LO2P265CA0303.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::27) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BY5PR03MB5281:EE_
X-MS-Office365-Filtering-Correlation-Id: e1be2e2a-35aa-4d28-48b1-08daa61c02a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CYGuiCTvqTw8ZQIin7qjal63vAxpCdr3shKaiApi6PT+sULVKz+sY+3jLqivD3K2hmiWaqh5Vso7cdvTa916OPYnMXVhpiIyDa+Py0C2VDUT+eFFR3oJkaxWLhTaib40XjFrqQ3Ji0qpNhgUuMmN0jbKmRr/r/5RpJuR+4XNy2tzvdkvwBA3IREc/08CmGbEbvDT9+L/5nHaeIym2o1wd+yYxdp+Tl+HP1QJYIvqUM0UyX1n+Y4lpjtmGXJxjlhlRLk70sHVdRMctOILRirFHnCKqMwy+jWYtMsUTqvARPMcBLyuezbHIINWZMOwJTTCDJj7DkSP74zkP62obGdVV/hkrWHyyebWkCKfio7wl8R+PhMWRum1BqJ9ryq2HKQ178ZG+77yvD664rWtLN0Ta1YRChri0IxRnzejnvFQCY3TjYYUpfsQbF80uqPcE8PHt27jPR4y7+l9j0BbHyMZa1xbmMD8Y5ioiv1ikIilH1A4QoWQBh6A9V3jbaLi5CijGUnECrXb+MZzFyTCfX8X4jqdkMyCWUSjl0NSrWe3pgemzAVK4KjYGX9u6dVPLzTf5XhKrb8YH6mlSO4L2xxDx0fhQDaMXzA296vtbFf1KHNXOgbrpuMFOxdWHqbIIbEfHlt0ndob/a8GUQqDa9cElvh24kRoyvqfm8KyrUOIAqe7pi0TX2Ws272nI5lTXd97sgLg7Rl46KgACCsdH8o/YQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199015)(6486002)(478600001)(316002)(33716001)(186003)(2906002)(5660300002)(66946007)(4326008)(66476007)(8676002)(66556008)(6666004)(54906003)(9686003)(53546011)(8936002)(6512007)(6916009)(26005)(6506007)(85182001)(38100700002)(82960400001)(86362001)(83380400001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFNsQWY1eGdzY0NOeENOSnVmTWg3VytXZkk3TFpQcklKTmdNVnFCOVQ4OGVn?=
 =?utf-8?B?TnNGVzFvRjYzL2l1Q2dJcERMMG1hN1ZxQnE3aHVTRUxKVWs4NmRhaURrUzV0?=
 =?utf-8?B?cmZJalE3MVpNM012WVRnMStLSGJMUDBJVnAzTTNoZXh5a1owNit5bVRUNE5S?=
 =?utf-8?B?YmZPYjRkS1lxYklUMVZ4QUpEY0JzVFFxZ29VNkxiRnpzSGF6R3diUXBGY3ZS?=
 =?utf-8?B?bXVDRVFCRWc3N0kybXllZHlxZnZwdTVpUGQ2ZjlBYnhMbjgzdXd1MW5hQ2Zw?=
 =?utf-8?B?citPNmhLalMyRWYwNitmOVZadk1WV3kxNDE1YnB2SHRxZGt0SlB4WXYrbGFE?=
 =?utf-8?B?QUlKNW1GeHhmTXA2TjB3S2Z2RzZxL2hTRVlhWXVkMDNDSlMyWVJUM3Qxc01F?=
 =?utf-8?B?Y1VaemRVU2taMUU1S0svdG5ld3FiZjl2Y1g1aGdmVjZBZ1dtODQxZk4yR1p6?=
 =?utf-8?B?SWdvcFVYbTBMQ0tSK1R5RTZ4Vkk3WDVOZndzeTEyeW81bjg3TUJJWVRRdXVN?=
 =?utf-8?B?K0JzN2FMVUszK29qTDhkSUNuQTBIZUJSb3ZzY1lBeDJuZm03TS9EU0h2RG9S?=
 =?utf-8?B?SFJPT1orV0xZOVMxbUsxVDhtQU9iWFR2SFVYdXdjVTZ2R0Fzajc1R2dsemNu?=
 =?utf-8?B?Z1UxN1YrRmVoYWhWeHk1YS9pRmN1eXFWY3p0Q0xWKzlsSWtUd0VMd2hXd3p6?=
 =?utf-8?B?T2gxSEVOYmdGNlBvVlJYV1dBM0FLLzVkdVN0YjNxK05NeGlxUVZWbVAzbmky?=
 =?utf-8?B?aDU1NW9CZHhBejF4dlMrV0YyZmhEMGNHU1lyelg2WmpzSjFuQ2pveUJhalMx?=
 =?utf-8?B?TlZuOWx1dUJDS3Yyd3gvbm52MWdLcTRqaENRSmEvMHNUUXVlWDFxdjdOQUdw?=
 =?utf-8?B?ZHp2eXdLVG1tbnJNNUg3S2FHR2RpamFKMHRVWisvOGJjVHNvMzRBNXNITEJC?=
 =?utf-8?B?ZHJNSDFrR1huVTdGWmEvcDN0Sm5NL2VFekdZRU9KamI0ekxMSHhqNDZacnRB?=
 =?utf-8?B?UDY0d01iNGZsclZEM29JSjN5eFVRcDlsRm0vbUl5YU5pZTRlSzZWSkZqZVRn?=
 =?utf-8?B?cjBGSXExWU0xTGZJUUpXTm13cUh0MmxQWFdiRUtyL05rclI1Mm5kYlVscnl0?=
 =?utf-8?B?Rnlyckx1NWVjTTVDdVdYZkFMK0R4Y0l0S0JxNVRTb3lEV3VoT1pBT1JhUVhW?=
 =?utf-8?B?M1dKUlJuUFYyOW1JZWQ1M0RkVHYxQktRTjA1R3hZaGg4VTRVakgwYVF6eFNS?=
 =?utf-8?B?ZUhyMTY3RXV0bjFzVHJTbTlTeEdIeFJMNmtubDNlVmxGcGE1TTdPY1hHeThw?=
 =?utf-8?B?SVV0eVhsYU5vNEZLY0gzZEk4eWFGQnFOZU1GN2FrZ0c5ME5VeUtZNXZycVZw?=
 =?utf-8?B?RkdsYmZpa0NDR2htQUxnYXdxZFJWbTA3K291YTlOdHhlc0Nheit1Z21iT210?=
 =?utf-8?B?SXRXRGJwWWowMFgzQzlGOGZNNTVQNk5YMlRXdDFIdnlxNkRaVXBQcktwQkNy?=
 =?utf-8?B?UFRtbHczbnFobVkzN04wb1p6b3ZpMWhKY2lKbXMrMjFCNFZqMmtMaE1hZURa?=
 =?utf-8?B?ZktpVzB4ZzJNL01ldkNHQ25maElFRWZZNXRPcVk0Qjh0NGVlamh2UUJBUmhS?=
 =?utf-8?B?Z0ZOZVJhMk9HbFlodWpMa3NWRVI0MWJueHpTMmpnV25oc3RFSmo3QnRzRnJX?=
 =?utf-8?B?UitVTElLK1dudE1JVVF0azRXV3MwK1J2UTUrbHZERUlZbkJGa1JrTFBDaGhE?=
 =?utf-8?B?aG9sMTU1Z2gxa2xqL0JnWDZvTmoyRXF3QnJObW9kQXZIWW5sNmRLM1k4YWV4?=
 =?utf-8?B?dU9qdHNZS29qT3ZQbnM1ckR2Y2x3V3QzMEt5Wlh2UUFobVl1NU1icXdhMHFE?=
 =?utf-8?B?UXFNcmlWd25qRG5jVmd0Zm9FYWFXa09ONUY0NWZPN1FGTHFBamR0ZHlDUFlm?=
 =?utf-8?B?R3gzbEExc3NJekhnc015OGIxRWFkazhWVjJwT0FRUUo2TFpacVV5TVNSYlJh?=
 =?utf-8?B?eEJZeE9XcFF0dzVpVzVaelBwaldEdlc3MHUzVTZLVURGOVlhWGhHdmsrcVN6?=
 =?utf-8?B?WnlUa0FlWlZSNkEwbzM4S3VzQWZlVjg1UUZXVnU0bDlJUXlUZkVia1BvZTJv?=
 =?utf-8?B?OUFNcENsMjVLTzd0bmxhNzBnUDM2RzQ1SS93WDJoSjBsUUE3UnNHT01zejJX?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1be2e2a-35aa-4d28-48b1-08daa61c02a2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 15:20:46.3112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sd2mrhhquiGFpZ2+iIn7Quh6LJT/h8ZqjXvrDi6sThuOmwsPk+4VjS7G6gNcWAaZBddekLxIz1Zg0QkDYVVwPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5281

On Tue, Oct 04, 2022 at 04:39:26PM +0200, Jan Beulich wrote:
> On 04.10.2022 16:01, Roger Pau Monné wrote:
> > On Tue, Oct 04, 2022 at 03:10:57PM +0200, Jan Beulich wrote:
> >> On 04.10.2022 14:52, Roger Pau Monné wrote:
> >>> On Tue, Oct 04, 2022 at 02:18:31PM +0200, Jan Beulich wrote:
> >>>> On 04.10.2022 12:54, Roger Pau Monné wrote:
> >>>>> On Tue, Oct 04, 2022 at 12:44:16PM +0200, Jan Beulich wrote:
> >>>>>> On 04.10.2022 12:38, Roger Pau Monné wrote:
> >>>>>>> On Tue, Oct 04, 2022 at 12:23:23PM +0200, Jan Beulich wrote:
> >>>>>>>> On 04.10.2022 11:33, Roger Pau Monné wrote:
> >>>>>>>>> On Tue, Oct 04, 2022 at 10:06:36AM +0200, Jan Beulich wrote:
> >>>>>>>>>> On 30.09.2022 16:28, Roger Pau Monné wrote:
> >>>>>>>>>>> On Fri, Sep 30, 2022 at 09:50:40AM +0200, Jan Beulich wrote:
> >>>>>>>>>>>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
> >>>>>>>>>>>> higher priority than the type of the range. To avoid accessing memory at
> >>>>>>>>>>>> runtime which was re-used for other purposes, make
> >>>>>>>>>>>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
> >>>>>>>>>>>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
> >>>>>>>>>>>> E820_ACPI memory there and hence that type's handling can be left alone.
> >>>>>>>>>>>
> >>>>>>>>>>> What about dom0?  Should it be translated to E820_RESERVED so that
> >>>>>>>>>>> dom0 doesn't try to use it either?
> >>>>>>>>>>
> >>>>>>>>>> I'm afraid I don't understand the questions. Not the least because I
> >>>>>>>>>> think "it" can't really mean "dom0" from the earlier sentence.
> >>>>>>>>>
> >>>>>>>>> Sorry, let me try again:
> >>>>>>>>>
> >>>>>>>>> The memory map provided to dom0 will contain E820_ACPI entries for
> >>>>>>>>> memory ranges with the EFI_MEMORY_RUNTIME attributes in the EFI memory
> >>>>>>>>> map.  Is there a risk from dom0 reclaiming such E820_ACPI ranges,
> >>>>>>>>> overwriting the data needed for runtime services?
> >>>>>>>>
> >>>>>>>> How would Dom0 go about doing so? It has no control over what we hand
> >>>>>>>> to the page allocator - it can only free pages which were actually
> >>>>>>>> allocated to it. E820_ACPI and E820_RESERVED pages are assigned to
> >>>>>>>> DomIO - Dom0 can map and access them, but it cannot free them.
> >>>>>>>
> >>>>>>> Maybe I'm very confused, but what about dom0 overwriting the data
> >>>>>>> there, won't it cause issues to runtime services?
> >>>>>>
> >>>>>> If it overwrites it, of course there are going to be issues. Just like
> >>>>>> there are going to be problems from anything else Dom0 does wrong.
> >>>>>
> >>>>> But would dom0 know it's doing something wrong?
> >>>>
> >>>> Yes. Please also see my reply to Andrew.
> >>>>
> >>>>> The region is just marked as E820_ACPI from dom0 PoV, so it doesn't
> >>>>> know it's required by EFI runtime services, and dom0 could
> >>>>> legitimately overwrite the region once it considers all ACPI parsing
> >>>>> done from it's side.
> >>>>
> >>>> PV Dom0 won't ever see E820_ACPI in the relevant E820 map; this type can
> >>>> only appear in the machine E820. In how far PVH Dom0 might need to take
> >>>> special care I can't tell right now (but at least for kexec purposes I
> >>>> expect Linux isn't going to recycle E820_ACPI regions even going forward).
> >>>
> >>> Even if unlikely, couldn't some dom0 OS look at the machine map after
> >>> processing ACPI and just decide to overwrite the ACPI regions?
> >>>
> >>> Not that it's useful from an OS PoV, but also we have no statement
> >>> saying that E820_ACPI in the machine memory map shouldn't be
> >>> overwritten.
> >>
> >> There are many things we have no statements for, yet we imply certain
> >> behavior or restrictions. The machine memory map, imo, clearly isn't
> >> intended for this kind of use.
> > 
> > There isn't much I can say then.  I do feel we are creating rules out
> > of thin air.
> > 
> > I do think the commit message should mention that we rely on dom0 not
> > overwriting the data in the E820_ACPI regions on the machine memory
> > map.
> 
> Hmm, am I getting it right that you think I need to add further
> justification for a change I'm _not_ making?

In the commit message you explicitly mentioned 'we don't actually
"reclaim" E820_ACPI memory' and I assumed that "we" in the sentence to
only include Xen.  Now I see that the "we" there seems to include both
Xen and the dom0 kernel.  This wasn't clear to me at first sight.

> And which, if we wanted
> to change our behavior, would require a similar change (or perhaps a
> change elsewhere) in E820 (i.e. non-EFI) handling?

Why would that be required?

Without EFI dom0 should be fine in overwriting (some?) of the data in
E820_ACPI regions once it's finished with all ACPI processing, as a
region of type E820_ACPI is reclaimable and Xen won't try to access it
once handled to dom0.

> The modification
> I'm making is solely towards Xen's internal memory management. I'm
> really having a hard time seeing how commenting on expected Dom0
> behavior would fit here

The type in the e820 memory map also gets propagated to dom0 in the
machine memory map hypercall, so it can have effect outside of Xen
itself.

> (leaving aside that I'm still puzzled by both
> you and Andrew thinking that there's any whatsoever remote indication
> anywhere that Dom0 recycling E820_ACPI could be an okay thing in a PV
> Dom0 kernel). The more that marking EfiACPIReclaimMemory anything
> other than E820_ACPI might, as iirc you did say yourself, also confuse
> e.g. the ACPI subsystem of Dom0's kernel.

Indeed.  There's no good way to convert a region of type
EfiACPIReclaimMemory that has the EFI_MEMORY_RUNTIME attribute set, as
there's no mapping to an e820 type.

One of the quirks of trying to retrofit an EFI memory map into e820
format.

> But well, would extending that sentence to "While on x86 in theory the
> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
> E820_ACPI memory there (and it would be a bug if the Dom0 kernel tried
> to do so, bypassing Xen's memory management), hence that type's
> handling can be left alone" satisfy your request?

I think that would indeed make it clearer.

Thanks, Roger.

