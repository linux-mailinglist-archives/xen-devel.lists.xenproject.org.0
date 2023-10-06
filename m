Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A987BB8EB
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 15:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613624.954268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qokkV-0005lu-0e; Fri, 06 Oct 2023 13:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613624.954268; Fri, 06 Oct 2023 13:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qokkU-0005jo-UC; Fri, 06 Oct 2023 13:20:10 +0000
Received: by outflank-mailman (input) for mailman id 613624;
 Fri, 06 Oct 2023 13:20:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Twl1=FU=citrix.com=prvs=63654eace=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qokkT-0004u1-7q
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 13:20:09 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10642560-644b-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 15:20:06 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2023 09:20:05 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB4927.namprd03.prod.outlook.com (2603:10b6:208:1a8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.39; Fri, 6 Oct
 2023 13:20:00 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 13:20:00 +0000
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
X-Inumbo-ID: 10642560-644b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696598407;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=THSVjEoGlbAl9AnspNsBcgVizq9nnlLZYDqCNr6KU4I=;
  b=BTju5Ma/z4vaYToAPXesJFAXZriZa5dWzwgeOnYUhkbYsfDmmHKv+gqa
   oGsH3KBA9MFTUYlr6hM/uSZFwfsWAWAKv1yEts+KOMcD0Nq64NHI0tCWS
   Hwycj2fJ8g/woCgFvRb2W+BVrw48p+PSx6IYMP5lgnD0qjsLrU9XDL901
   k=;
X-CSE-ConnectionGUID: LpA486b4R8mu4e/9qGpt6A==
X-CSE-MsgGUID: nzeyiSqmR2CwcOYuwVGOYQ==
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 124082142
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:bIfSiKLX7rMHlzcPFE+RVZQlxSXFcZb7ZxGr2PjKsXjdYENShTUOn
 WVNWWGGOqmKNGP2coxxa960p0lT6p/VzdM3QVBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhB5gRgPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5TGUgSp
 aISdApdaw3fiqXn2Z2jVrdF05FLwMnDZOvzu1lG5BSAVbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGLl2Sd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv22refx3qnAur+EpW+5PN7gWaKw1ZJIwIdcmqmvseWrX+HDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsbjNHcs1gi8YwShQjz
 FrPlNTsbRRkt7iQVHSc6qbSqDq0MCcYN0cSaCkcVwwH7tL/5oYpgXrnTNxuDaq0hd3dAizrz
 naBqy1Wr7cOic8G0Y2r8FaBhCijzrDSVRI87AjTWmOj7yt6aZSjaoju7kLUhd5fKK6JQ1/Hu
 2IL8/Vy98gLBJCJ0SCIHuMEGejx4+7faWWHx1lyA5Mm6jKhvWa5epxd6y1/I0EvNdsYfTjuY
 wnYvgY5CIJvAUZGpJRfO+qZY/nGB4C5fTg5fpg4tuZzX6U=
IronPort-HdrOrdr: A9a23:Fmp46KlshJA+wG30XIt+OHBJcafpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: =?us-ascii?q?9a23=3AlcvRh2r+OcXjGm6MM21oXOHmUeQ9WyGNkn2MGR+?=
 =?us-ascii?q?9FDpkD+yMZkeMpooxxg=3D=3D?=
X-Talos-MUID: 9a23:o1FTDwkW5ulxJT9O8QHAdnpkJsp54p+3DXpXuooNnPiZKhJfHAak2WE=
X-IronPort-AV: E=Sophos;i="6.03,204,1694750400"; 
   d="scan'208";a="124082142"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sz1U1lOHonOSwfMcjhJHxIsuwI7PmIGj/umkGA3esy3xorREEK1kgyq+ZDujyf+xzcXhDVEoPD+HeHZjKn0CTgj2lMP2TNDwL7xBN8yzX2AD/zQgC87Abe4s/MqZGcluVwG/1j1hB/Sh2XM1210Ywpr78K54RKkr5gDJxOj68jQejND7JIfw5+1QajkIDShSG4bKgoDNkiWD74BUEARKbxgxkES4JSwj8qKwnqJrTbcL2GKvHNIeKgncJNBUHbCYynvoCsiPvhZUBjZFtxGeI37ob84+08okkzfvE9oetdAG2VLQFeXxjMUVJJnL0b8fXApvY2Y89t5ykX951r3fAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvZGn6ffIlfllwxjj9VeANjGXEPjnVFMRzYwixlHsZM=;
 b=GhPY3AVaW/iO79KvgRFh7vu0xTw9kcBDwlyHWhw5f6ifPshDJzrWDTF1ywirjXjbJi0S79AdWUJxbJTYWKTeUPDOgm1px7TdyqF6gC3TbCd5oGX2oU7BjGnWc0YoZzttD6njDM/gZdksB/s4K2IovucJsk9HukgMgSBa4aHF/YwOE3dsunuDQbKfNf2jn78CuGE6fR1d/6dN6sap+jX1cYlDX61HiVEbvg0aXngWoZ4xvAERmc5ONFHGS24IvN0Z3isMkZfH811oTjf445hzZ5f6k4v8QpkfW8K/gHr9HzKF6griXyQviZ5QFYEfPfolFPf7GIIIxJYv5UmLse3vwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvZGn6ffIlfllwxjj9VeANjGXEPjnVFMRzYwixlHsZM=;
 b=WlvKKPYdFUKrENjtzJJB3nBtK9V2kVIG0ub8PfqmpjtbyTtRtcSzyEy4KXM/RY3DKxE11AZ1P5Moy5oPO3XMpxrnzT/ADI9HopjZCdKwrjzo1ilclyxzxEqmty76/v1BSy6bPSlzBvlcu26P2IrcDH455ECLGOJloVP2xfUscwA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 Oct 2023 15:19:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/2] domain: expose newly introduced hypercalls as
 XENFEAT
Message-ID: <ZSAJewLiAgcDrzc8@MacBookPdeRoger>
References: <20231006130059.97700-1-roger.pau@citrix.com>
 <20231006130059.97700-3-roger.pau@citrix.com>
 <e45d0273-834b-4d7f-b158-29341845d3be@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e45d0273-834b-4d7f-b158-29341845d3be@citrix.com>
X-ClientProxiedBy: LNXP265CA0039.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::27) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB4927:EE_
X-MS-Office365-Filtering-Correlation-Id: c939b8be-0998-42ad-9221-08dbc66ef164
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v+hlJaCm/GXe5Wubu1wboDyp+s+AglrgokKX4n12tentL8dMAoAaRTuYcTmPoYCMFK67ZMa/+geAG+aQ3CYEKXK65tnbSwBifRh4fcHEdgnhGlO0OGIU7AvBhdlULUTVLWxp1YwFIfyMVZabx6CN//SpbaYzDUkke41EZQT0aBbQmHHUl3sqAi0+TzTYvggQFdAi+xxL4AodW0RxNGbR+2gC0CZq50Taew0imCV7g8hh8f06gCQ79EkSVLXfUt9jZbRzgSEEUmL2OL+6mLc9oFRu08spIHMRR86j/npG2zNi2/UXyv/pXdWYN6YWidJ7XVYmntMFBJl35X/sOGamBuReBhgoM7a7x5GGljPA2jS3l2RtLYO3zO/a8S4hHOx3GmD40ikVIDAHz0ppA4T+xSolWfNLS8DVa9mBLu1JNVAMA7zXCBtLrA6BEVI7VpZN5cMa0z4+539z/t5Oz3ZFQ+3AJwHtzBKriBg4vbCNVcWQor5VvSq8h1lNyjDeuIg0gGNCVbAsfmUeljlLplqQSdK6NuspRAStuqUoDl1Ni/A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(39860400002)(396003)(376002)(136003)(366004)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(6506007)(6666004)(53546011)(966005)(6512007)(6486002)(478600001)(38100700002)(86362001)(82960400001)(2906002)(316002)(41300700001)(33716001)(83380400001)(26005)(9686003)(85182001)(66946007)(66556008)(66476007)(5660300002)(6636002)(54906003)(4326008)(8936002)(8676002)(6862004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlhydVo3OTJuTkVzeSt3eGlVdmFqYXQ3d3Y3ejFndElxQ3Ntam1oeFJFUStI?=
 =?utf-8?B?a1BKdnl6a0RydFBKK2FET0RxcVJxenY0dFBNVzRuQU12M0E0ZW1adjRmNkVF?=
 =?utf-8?B?Y2hxL0xibFRrMHN0OHJEM2t1ZHVlUkFIRG50eE5zc0cwZnZ1M1E5QWducStO?=
 =?utf-8?B?UDFlTmk3Z2Q0c3RkMmJVWUt2cW9ZbURrNXRPM2M1dWpKaWlIMVNscWgvZnhi?=
 =?utf-8?B?RUhiNmdFS1pETllrZmdOUlJsMU1YZTErRmpORmx2WUJ0SlBOQ01KOGREaDFS?=
 =?utf-8?B?YU5lVzVqdkc2bTViTHNjUVU3ZjRyeVg3SG1YNEFObER4aTduS3dHSXpML1hj?=
 =?utf-8?B?c2h5cjc3MzlEM21JVlVINklEN2hPUnR3QUJxcys3OHVtYk5md29kTWZIckNN?=
 =?utf-8?B?ejljMjljYzlvNGtFU0d5RWxub2dMK0ZCbEFJcDJGRE5wU0hRSmtKYmN5dXRZ?=
 =?utf-8?B?QlJ0QTVxcEJ2TWxWSjV4OFBzd1VSRGRTVkd0WHlKU2VORVUwSGhZRUg5cUYv?=
 =?utf-8?B?YXh1elYxejhqVUliZEI1UEJ1WDl6RVNJZFQwSHdEUmZrbzQyZmpuWHMyWHlZ?=
 =?utf-8?B?UnRKa3YrbUNhZWZKY3hyVkdkb3NFT2tBcDJ1Ykg3T3V5NUx0Nm11clNtL1dC?=
 =?utf-8?B?dlI0NWhMNVRQTUFsWnZ2Zlhuc1AxNDd0YWp3MERWdFhkcDVNcTVZU1FoSmZa?=
 =?utf-8?B?YjFLT3I4dXpuN2JjcFV3STVTRXZpSkhuM04zSVFwcU5PaWdPMU5UTWtXV0ly?=
 =?utf-8?B?bTZEb0lCNUhjQlgrSWt4ZTZRSWkyMWF5elRkRzFreWM1V2N0QXVidDB5dWc4?=
 =?utf-8?B?YUc3dGRoaTZhWVM0TyttYXhGZUQ1U1hYZzNQTXhVemo5VDVZK2lQbXI3bW9r?=
 =?utf-8?B?RmNLSlh0dkJaY1NVazZWTXBISTNad3lWb0N6SFlDeUZjR0hYcFhGbCtzVDhh?=
 =?utf-8?B?VGhpeENlS0NuZW03bXcvTEJHNitvUFhkVzRFMFdNRGg1VDM0UkR2STd4bE5i?=
 =?utf-8?B?VG85Yk1vVG52WFZRUCtLZDFIc1VGcWxNcGFUekU0c0V6dTNySitWU2ZLUlZn?=
 =?utf-8?B?R2NscFBjT3hQWXM1d2ZOM0RvSVJnNFNVY2VMN2I2NG5pSEhqa2F4aGp4UmVy?=
 =?utf-8?B?NzdjNHN5Ym9DOExhUkpRU25DeXdXeE1pa3dGTnFCcXM2RittRmluTlNLbXdW?=
 =?utf-8?B?NmRLWW5nZllyMUM3MWNRbG8vQ2hsUEpDMzdEMEV3UnNwWnlEZ3RFeEhIN0R6?=
 =?utf-8?B?SHdUemVXUjFnWHFzQTMwMnlpWkxTbldsYXB1MDNkbDF1MHBUTFFlUVdVWldR?=
 =?utf-8?B?aEg1TEQxWXZ5enRxSWZWNmNlakVrcjRSQndLK0pUOHU2NmljUG5vVjdZZ0sz?=
 =?utf-8?B?QjViR08wYTAwRHc4MWI3Ykg2TElVTExkUkFBV2NTTWZRSDFybTBWZytuSG1u?=
 =?utf-8?B?Z3l0U2JoSk9zQ0t1c3FvL3hNMG9hK0Q0UXBodkZZSGRHcmdiWkt2VFQwdWhp?=
 =?utf-8?B?NWFuczBtcDlVN05VeDBGbkJEd2lRMHdUTzNmdXZvakI1anNhVE5sa2FTYno5?=
 =?utf-8?B?RnJJMzB1U1VRWmZMMFd5cHY2c0FCdHlQZytwbXNoeWtYd0VYTHJydmJ5eHE3?=
 =?utf-8?B?bkNCTXhTUEcvOGRUNFo2U0IvVFd6RklBT1NBYVVUYmttajhiZUZBV0tvSFkv?=
 =?utf-8?B?RVAzWHFSaHZvQVU5cGF5Y3BNOCs4b1U1SCtrNkhqa2E5S2UwSEREeDFwRWw0?=
 =?utf-8?B?TXNMV0UyRkNRdS8yZWlEZml0Y3B1RW05djl1WFFjcWJpUmtVM1l3Qy93TXNo?=
 =?utf-8?B?WUVQRnZTU3B2RHgvRVN3UmJVNFhtSlpzVFhUSndqYm1Bb0xoMUUvVVhwbllo?=
 =?utf-8?B?TVIrUkk1c0JNb09WdW02NlRLWVNnakY4ejdIajExMVZqeUZsSExCYU9MYzcw?=
 =?utf-8?B?SE8xWnY3Rlh6SUZXNHo5ZWMrZ2pKNk9FTEZab2V4K3B6QkxCVjJGa1F6eUQx?=
 =?utf-8?B?TzY1SHJMR2ZvSGVRQndOdlo0dHJleG90eXJLOVlaY0FITGs0ZmNKZ0pZdFlz?=
 =?utf-8?B?b3hXR0luSGlxSVN6cDl2ZG5hU29sU0pWTENncWdGOUNtWXNmZHN2Z0wvK21U?=
 =?utf-8?B?YU03bzVIYWNmMnIvNjlIWEkxWlhOUkhCb1FMcHBEcmhwazFuSVZjY0dJa0JH?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lEQvx3fQJJ8461B29UXiRa5GAec7o8wBmsXaHFji6xeWwb+ut/F97BlxjhTcvpsXkbl0qq7uYWfn2mP6DCvXHTjT0pMFmfhsyyiL496n4yPO3VG9qwtKRbMk8AOJ7lL0A4I+jJ5bgrqm6vTgXrVydAQcuJfAsOHRYN96qCsWABypsexobsjbLcGttkrWZvoRXRN4cUIYzd72ods/WV8QsCo9uJeN6+aWAX6KCPJRuSW3CW/8YWlsfQgUGRYguIFzHkZsQgbEM0A8dSLvdwjLZfTMsTDiaGQxEb9k/VSLbGzV7h5VBcFwgfNgg6ZI5v6hpWJCK8sao0UDSEd40sJcnnIGGgt7kmmsUy+OoKlzfUtafVguQ/lDyO5WVJI70Pnwhs8B2ifQaaoQp7SxrfZ4NRRhw4d4F2DGIuWLCQzmvfMMo++Vf2xQax+EsB58IAX7CfkUBkL2221peQLb4oeCiliBzlgB6d3S+S3aB7PIh+ptmPuTSzttdZWt7Wznp22ivmi2+jKkeC8y/mfztPUxfj88L/aDQL0W0J2Swfumttu5ov6vMYXajHGfHNrpXTmhKKSJxvvq62aBatvMA5lu5UMffNaE6EMDBJ7CS/o9VaFyFaGXOo6Gc/WXv8jSWmwDpGDYIgBOhFZ84dcbKV/TgluNzz9CckPIz6sYZ0TM3lhziCsvLGHLv+vUs5QB2hfFaLhlp6S9lxYG8xp8BzBI6FZfmbzmS4NoLCSmF1agzBKsGZcifCLMpsz2IoXNql1Zxkyi1VCLNudUsJ4WLW2XLlDRhuUYppxCZkSAtWVvP/tr5vjORY4qjeiaMyOthcWV3CXD/3zv+XCn391AxfjlNeo4Ji+3KuU395EqF7HuHwm3LWPGIW5SBnkdY/HqC/sM8BVl+8LxDZGZlo4KaEAsdedCF7JniFtQ4dc4B5AH994=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c939b8be-0998-42ad-9221-08dbc66ef164
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 13:20:00.4270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j060rygWsUP/RU/GqEhvI+EOiSsNiNZGIK0OIItlMMRTIp7fbTdzU1B4ZgqT4z1AIm1bFAo6AY8mJcwnmZtVRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4927

On Fri, Oct 06, 2023 at 02:05:18PM +0100, Andrew Cooper wrote:
> On 06/10/2023 2:00 pm, Roger Pau Monne wrote:
> > diff --git a/xen/include/public/features.h b/xen/include/public/features.h
> > index d2a9175aae67..22713a51b520 100644
> > --- a/xen/include/public/features.h
> > +++ b/xen/include/public/features.h
> > @@ -111,6 +111,15 @@
> >  #define XENFEAT_not_direct_mapped         16
> >  #define XENFEAT_direct_mapped             17
> >  
> > +/*
> > + * Signal whether the domain is permitted to use the following hypercalls:
> > + *
> > + * VCPUOP_register_runstate_phys_area
> > + * VCPUOP_register_vcpu_time_phys_area
> > + */
> > +#define XENFEAT_runstate_phys_area	  18
> > +#define XENFEAT_vcpu_time_phys_area	  19
> > +
> >  #define XENFEAT_NR_SUBMAPS 1
> >  
> >  #endif /* __XEN_PUBLIC_FEATURES_H__ */
> > diff --git a/xen/include/public/vcpu.h b/xen/include/public/vcpu.h
> > index 8fb0bd1b6c03..03b031a3e557 100644
> > --- a/xen/include/public/vcpu.h
> > +++ b/xen/include/public/vcpu.h
> > @@ -236,6 +236,9 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
> >   * Note that the area registered via VCPUOP_register_runstate_memory_area will
> >   * be updated in the same manner as the one registered via virtual address PLUS
> >   * VMASST_TYPE_runstate_update_flag engaged by the domain.
> > + *
> > + * XENFEAT_{runstate,vcpu_time}_phys_area feature bits signal if the domain is
> > + * permitted the usage of the hypercalls.
> >   */
> >  #define VCPUOP_register_runstate_phys_area      14
> >  #define VCPUOP_register_vcpu_time_phys_area     15
> 
> For both of these, I'd suggest s/permitted/able/.  For older versions of
> Xen which don't advertise the XENFEAT, it's a matter of capability, not
> permission.
> 
> Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> and
> I'm happy to adjust on commit to save sending out a v3.

TBH I've used permitted because that's the wording you used in your
reply to v1, I'm perfectly fine with switching to able.

https://lore.kernel.org/xen-devel/ac4842a9-7f62-4c64-9a3a-2ec2b1e97699@citrix.com/

Thanks, Roger.

