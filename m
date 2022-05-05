Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739F551BC93
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 11:57:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321913.543065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmYEW-0005Kb-Ty; Thu, 05 May 2022 09:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321913.543065; Thu, 05 May 2022 09:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmYEW-0005Hx-R3; Thu, 05 May 2022 09:57:16 +0000
Received: by outflank-mailman (input) for mailman id 321913;
 Thu, 05 May 2022 09:57:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T22s=VN=citrix.com=prvs=11701087b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmYEV-0005Hr-3t
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 09:57:15 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb9a021c-cc59-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 11:57:13 +0200 (CEST)
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 May 2022 05:57:09 -0400
Received: from BLAPR03MB5603.namprd03.prod.outlook.com (2603:10b6:208:29b::16)
 by BY5PR03MB5332.namprd03.prod.outlook.com (2603:10b6:a03:22f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 09:57:07 +0000
Received: from BLAPR03MB5603.namprd03.prod.outlook.com
 ([fe80::24e0:fa20:e171:58e9]) by BLAPR03MB5603.namprd03.prod.outlook.com
 ([fe80::24e0:fa20:e171:58e9%3]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 09:57:07 +0000
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
X-Inumbo-ID: bb9a021c-cc59-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651744633;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PBS8lz3Gu3TX1bQd09a9mK6PT2QQHoMUsDd8nEJg9i0=;
  b=TDzixU6L5FuCImPiUkRmSrXCLhlMRcF2shict2t1JtyDIA/Zs7bTZAXj
   NGVtUbn1led4WrDCXtCmRo8mwZoVwCM1KJXA9ZQwWgeFYCt9m+pEvSUck
   y2QSHt6oAB72Af/OgxtnvEfvybuLvwPADRihGqN9DchjCM6I786eTFcht
   s=;
X-IronPort-RemoteIP: 104.47.70.108
X-IronPort-MID: 71043361
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6KBMG6DmywYUdRVW/1Piw5YqxClBgxIJ4kV8jS/XYbTApGgi3jdUy
 jYaXjjVa6zeYzOkLYx2advl8UoC6MXVnNFjQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Nh39Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhS+
 I59u7GcZDwVEajPhvkXXkQINyZXaPguFL/veRBTsOS15mifKz7G5aorC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6l+B8mbE80m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjx3iWkKGMBwL6TjawmxE3R61Uv67HgAt3uJuGkf+tZhknN8
 woq+Ey8WHn2Lue3yzCI73atje/nhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa7EW2SvHtUhv+p2SL1jYDX/JAHut87xuCopc4+C6cD2kACzRHN9ovsZZuQSRwj
 wfZ2dT0GTZorbuZD2qH8auZpi+zPi5TKnIeYSgDTk0O5NyLTJwPsy8jh+1LSMad5uAZ0xmpq
 9xWhEDSX4kusPM=
IronPort-HdrOrdr: A9a23:ms0Ubqsp/AFeX10itz52QeoM7skC5IMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVfUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZozU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDm1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9UfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ0yHtycegA2w
 3+CNUYqFh/dL5pUUtDPpZwfSKWMB27ffueChPlHbzYfJt3SE7lmtrQ3Igfwt2MVdgh8KYS8a
 6xIm+w81RCMX7TNQ==
X-IronPort-AV: E=Sophos;i="5.91,200,1647316800"; 
   d="scan'208";a="71043361"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j25w/nA/zLfdyZWryIHq4Rr2mgn6FJ2kgpxTb9DRoBKXmVkNYmcOvxGKq14EY1XfVTCaR9P8v63VRrHzvD+iyBs9FbQFhIoIpZIYOVUroJVGjUWfYtHzxd2IMxf9tmZSHfez/qnmz+Ef1pLbmNQw56kcseXWKDIIPgEYBxkNhxYIHuC29J6/qMn/6SGYia+tC2r1E6YKT56bzMJfQ5eoePCJRB5iuYkSsCBOiQ74a70vNC3PdKjdTNkGHQiDzFtbL/XlJi1OR2uQcGiJwv2OKgs6goxay4XxbWy48G+dUuS3zLsWEqEngHykDFCC587kWP5ubk1eEZvqAQLvbzODZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZ+/rbCdMStzxyo2GbkBsXJy+BVnDayK/Bc52NqgJzE=;
 b=Ynxp4yhd7KVzblh57wNKuYzgB+RKysh5yiPaR6yCjed7JOf1DH6WcoxTVoP37TyztTADp0KShUxioUS8ekE1Ivg70DYVpYaXlmIE1WDMfSqVn/ISZf1KAjvOqlPHLr9pfLDB+Owo/NL7g0pjP69Lhn1427z8A7uA9BttcRdzeUPQpk2Cb3hzEJnYjH5sKi9pdOoQ9J7sGSZQWUwyiGD5AEoziMMa7lZZLBOZR3TG4oV6XsZ8QsfrZQyt+J53WDulEob/ByWesb1VgwGio95Qr4Oy2aLapIsneAS0METAW60+j0jGxwz/Oudtx6kz6PM6YSbU2PcP3O4iS4Vyx1pmQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZ+/rbCdMStzxyo2GbkBsXJy+BVnDayK/Bc52NqgJzE=;
 b=p5SCRP3YxRGYoli1swONp8R0EHs46YIGs5yUWLZKlY/mncMNOG2JzAmLf5u2MjcAwjBPjKJ4Jh/bwuMU8fWJ+HM/S6yYoPS2Qo3uGzVSbgpt0Uq9YqDzUzxonD3bTIBkD9m93xAWO2Lrxn+blRtDJvJcyqqxvWRTyrBX8HZQScg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 May 2022 11:57:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 07/21] IOMMU/x86: support freeing of pagetables
Message-ID: <YnOfbr0vgBD7zo1V@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <1389c785-ffe3-5d8c-36f1-a923ce5250cd@suse.com>
 <YnFWW4zenNq/SAt4@Air-de-Roger>
 <2d0d8aa9-1ab8-a505-e2df-c9b6446062cf@suse.com>
 <YnKWfTk2VjiXL67z@Air-de-Roger>
 <4bca3f52-436a-1285-9c36-9206dc5d50c9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bca3f52-436a-1285-9c36-9206dc5d50c9@suse.com>
X-ClientProxiedBy: PR0P264CA0068.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::32) To BLAPR03MB5603.namprd03.prod.outlook.com
 (2603:10b6:208:29b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5e989a3-f119-424b-c8bd-08da2e7d9cf9
X-MS-TrafficTypeDiagnostic: BY5PR03MB5332:EE_
X-Microsoft-Antispam-PRVS:
	<BY5PR03MB53322EF22AF25CF8158AB6928FC29@BY5PR03MB5332.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vs9THIIL5B4E3WFdfudcSCsWnHqrjl6LQ19PM/F36wT/ccHRoMw5CQ1Q1GM+WHPtl1fxyp81jfGc9a+DsEqhu9tzAHAqv9Tnws6dOT7D7OUaRN0k8S2Tdxm4DS1Hia36t93qDRD3+UUmO/M3mzXZ+NXzbb0zbI5e2R6p/cOas56IOdXz1HvsFTYVAlhlxT/V5IjsrhJtTmKclEYC1ShHZBKS0P+Nnf/rbPeqL//B1sYyoVBoMpZl/q/hy+ntjKPyV6vWs/JqICSvjsFL7zfuoUt7stRaLdnNF/VEcXboA8E9zqoquiwqcQL7kpTfSqnhkWwhLRxNdvkmZBNweX/oQaRN9DVDyiCm+oQyzytnScQzhMp1i7f43t4tou+RkrjexPKm0oU9AWBJUFBuFBMthsWcOpm5VKg6WwYkNOl4PrF0IPiCDFoXb9Ilari56ImlfdXs/GB/ponxh97etXpyUGEqxESvcnG5iKdLWzG1306Y9cd1/euIWs9DzydaOB930eoIYdrvT6jCK0Iz8fRF7bjPHasNeGGpdQy+HfNoxMU2BJdKWY5odcQQccMOD425/3Lwl9yYJAeOVpyY9JI7k+iCp2nRKkrcPhyaKdZGW1A++0yAEZ521LM8q09hZnRnN41Kk4LYoAQl5Q/Tt5Rl8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR03MB5603.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(83380400001)(33716001)(38100700002)(82960400001)(66946007)(8676002)(66556008)(66476007)(4326008)(86362001)(8936002)(186003)(2906002)(316002)(5660300002)(6486002)(53546011)(508600001)(6512007)(85182001)(9686003)(6916009)(26005)(54906003)(6506007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmQ2RVpVNEs2VXZCbUxCQ2dmcXlFdllvZGVINmxWcmJacjRudm4wQjI2dVVp?=
 =?utf-8?B?cXIvRnBPY1dCVkxTOTJ4U3VGaTZGSGZNcjkyRzZ6SDJZUC9wS3lEbDNPSVlU?=
 =?utf-8?B?SWdsY2F1QTIwUXMxY2tST1JNQ3VkVDRYaU9pZ1Nqc1JQNDVHclJheVBQNWN3?=
 =?utf-8?B?N0RwRUJuWlkwQ0kxUDVFMFROSUpWcDBLc1AyVEtNNTZCYVJZLzNEMGhmMEpV?=
 =?utf-8?B?WWFtd2hZaVZOdCt3WjB3dWRjTGdKSXRwV3ltRUY0Y0lUYUllSFVtc2VMRjZ3?=
 =?utf-8?B?Y2doYk15dlpmR0tTSUxIeTFvMXVFenQxbmxodXh1QzVaQkQvNTVLa3RlbmVv?=
 =?utf-8?B?LzZaV21EdEliVzFsMWt5SU9TYkNxSGtqUkMyZEYrd1dRZEx6YVhhWEFxSGZC?=
 =?utf-8?B?cjhKZ2ZGQ2JNcnRaa0FBb20rWmR0TGtzT2N3Qy8raDlabGI3K0lITjBTaEk4?=
 =?utf-8?B?eUtCTndsK2luNVA0SjJpOEtNek1lTzFkbnpYaDJNS2p2QjErKzB2aG1lWHFu?=
 =?utf-8?B?OTdzR2hlWWF6K2YyVnZPYm5iRElxT20yNkpkM2Fpbzdhc1liK2MzTkEyYnlP?=
 =?utf-8?B?YmdDU3NXYUZId1dLbFVQOGJLNktuUWhmMjlUUklpcWtqZzQ1NDhnQ2Q1UmxX?=
 =?utf-8?B?OVdHMm9tTkVzNVkvdzgwM1g0dW9taDZVdW83WndOdFl4WCt5RkVFYTNxajFN?=
 =?utf-8?B?VzlFNms3UFhNblRyNUV1MWl3c29JVytkMmV4SWJGRE8xYW5vc1ZDc2cwU3FJ?=
 =?utf-8?B?dE1adS9lVSsxR2xBTll4TlBnSDRrZmhtNEl5bFRxakx4dVpPWFQxMm8rdWpU?=
 =?utf-8?B?bExwdU9OWTExN1ZWbVRYTHRsM21McFhRTkFSWHFrOHdzbFl0QmhROExOVzFS?=
 =?utf-8?B?ZkEvMXdmU1ZzaTZYUVB1SmN6Mmp4MytwUzVIaW14Ujl1aVh3bnhIL0ZWSlRZ?=
 =?utf-8?B?bC9McDdDakxTUWV0SUdqRi8wTXNZRVJWcnpaRHVWNDRLREQxQUlNRUVGcjVP?=
 =?utf-8?B?M2hDb01oeHpHdkEwWVlBVUxYWEJiRytRa1psY2tNdTZRWXNZaFRoWFNjYmRC?=
 =?utf-8?B?dFJGV1FZaXBERjVDK3hCdGlubDUvdUp0RjZxOFVOWWRRcTkvNlkzdUhQY3lO?=
 =?utf-8?B?RjFCK0puR2cxekNIRmJNMDBaejVWcE8zZzRiSyt2emhmWWs0L3puNWxYSWs3?=
 =?utf-8?B?QVQ2QkxYeEk2aWkxQ2lmVVVGcGx3aG9yUGZKZVVCM0pjVGtoYklDTXYxNDBr?=
 =?utf-8?B?bEpaTG0yK2hreE1raldYUEVybkZpTnhhOVpadXZUSUM5djNNU0RBR3VkQUxD?=
 =?utf-8?B?c3dRV2RleWF3d1o4RkVCTlM1LzROUmpEeW5tU0t3UEtjUkFsanY0cHpDL2Zv?=
 =?utf-8?B?bTdUcEc0WDFwYnh4TTNjcWZuTTZjM3ZkM1habDlCY0lGV2xDNWVOTEtpdTI2?=
 =?utf-8?B?SDc3eUpKbWFZYm8zUnJnNkJYY1BCSU5wY29VU2g2MUcwdGFBZm1xOWpqekZZ?=
 =?utf-8?B?azBvNU1iNFZCNE8wUFc3T0Y5S1RlZzhWcUNTbTNPSGdQNzBzczZRMzJFTm5C?=
 =?utf-8?B?Mk12SmxLWTcvK2dvRGR0Wm8zTmVTYjVsOGtVczEycGplMjBVL1FLQThuRThW?=
 =?utf-8?B?cU9GTXREMlV2aVhzdklMVTI5azA5R1J2WjlLSWo5OHNzUVlxMkVERDN2L1Fs?=
 =?utf-8?B?NStENFM1NDMzcHRQUW43MFQvbHEzRFRvRFJUM2dpUnhtd0E2Q0c3MnB5Sm5h?=
 =?utf-8?B?Y21oYTI4RFdDSWVPZk9xMzNRdVYxQnRvYzlWcm5tN0p2YkYxR0FpUGF1ZmRW?=
 =?utf-8?B?SExXR2VsY0M0V2xEd2VKeVE2NXlPcVlkeXFKUTZFWnVNQllpMmZ5TlEvbUs4?=
 =?utf-8?B?MmRzZjA1RGJCNU9CcGFIZGdlTlJpQjBvQzdKUU5XQnlDNlhzUG4zNlcrZVh0?=
 =?utf-8?B?ekNHWEQraVdtbEtObThJWlQvK0prT0cyYVQzR2toV0FvbmZjRDFoVnpDazZQ?=
 =?utf-8?B?cFNudktqUmE4VXBsSmpDWnZ0aUMzVUNUYmlaSGxtWUFYb0hFVWZxUVFCanh5?=
 =?utf-8?B?cTJKaFBvMGx5VUZCWGEwMUYwTzBZNmF2V1BSNU9UVDdjWFZrMFYzWHpZa1BT?=
 =?utf-8?B?UE4xdENuWXZmM2NGRUVpZUhybmY5MVNJN2FtWmRwSkFjWFFMaG5iM203TjFI?=
 =?utf-8?B?MHRpbXdBQXpRVUJkQ05nUkdNNTF5RTFWS1R3b1lTYksvRmdOcHZGR2MvQkU0?=
 =?utf-8?B?dElYV3NnRUphYUU5dDZtcVZzT0Z1dWFrNUcvZXIzZ3NjQzlZRTVmczdMTjZY?=
 =?utf-8?B?NFNZKzY1dVVCSVE2dDIxUGhrWnFmQktTN2UvY3prVGMxdlo2SFd0YWVRUkI4?=
 =?utf-8?Q?8zwjDZ8NM33dLJUo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e989a3-f119-424b-c8bd-08da2e7d9cf9
X-MS-Exchange-CrossTenant-AuthSource: BLAPR03MB5603.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 09:57:07.2469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQzk2v8d5eoB8zkUT+Y8fHX7W8tloRALFUcUkS4lAcx/VA05D2n8Y0RhB9QLolENnWS3AveGIRDwUqofzAb4yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5332

On Thu, May 05, 2022 at 10:20:36AM +0200, Jan Beulich wrote:
> On 04.05.2022 17:06, Roger Pau Monné wrote:
> > On Wed, May 04, 2022 at 03:07:24PM +0200, Jan Beulich wrote:
> >> On 03.05.2022 18:20, Roger Pau Monné wrote:
> >>> On Mon, Apr 25, 2022 at 10:35:45AM +0200, Jan Beulich wrote:
> >>>> For vendor specific code to support superpages we need to be able to
> >>>> deal with a superpage mapping replacing an intermediate page table (or
> >>>> hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart is
> >>>> needed to free individual page tables while a domain is still alive.
> >>>> Since the freeing needs to be deferred until after a suitable IOTLB
> >>>> flush was performed, released page tables get queued for processing by a
> >>>> tasklet.
> >>>>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>> ---
> >>>> I was considering whether to use a softirq-tasklet instead. This would
> >>>> have the benefit of avoiding extra scheduling operations, but come with
> >>>> the risk of the freeing happening prematurely because of a
> >>>> process_pending_softirqs() somewhere.
> >>>
> >>> I'm sorry again if I already raised this, I don't seem to find a
> >>> reference.
> >>
> >> Earlier on you only suggested "to perform the freeing after the flush".
> >>
> >>> What about doing the freeing before resuming the guest execution in
> >>> guest vCPU context?
> >>>
> >>> We already have a hook like this on HVM in hvm_do_resume() calling
> >>> vpci_process_pending().  I wonder whether we could have a similar hook
> >>> for PV and keep the pages to be freed in the vCPU instead of the pCPU.
> >>> This would have the benefit of being able to context switch the vCPU
> >>> in case the operation takes too long.
> >>
> >> I think this might work in general, but would be troublesome when
> >> preparing Dom0 (where we don't run on any of Dom0's vCPU-s, and we
> >> won't ever "exit to guest context" on an idle vCPU). I'm also not
> >> really fancying to use something like
> >>
> >>     v = current->domain == d ? current : d->vcpu[0];
> > 
> > I guess a problematic case would also be hypercalls executed in a
> > domain context triggering the freeing of a different domain iommu page
> > table pages.  As then the freeing would be accounted to the current
> > domain instead of the owner of the pages.
> 
> Aiui such can happen only during domain construction. Any such
> operation behind the back of a running guest is imo problematic.
> 
> > dom0 doesn't seem that problematic, any freeing triggered on a system
> > domain context could be performed in place (with
> > process_pending_softirqs() calls to ensure no watchdog triggering).
> > 
> >> (leaving aside that we don't really have d available in
> >> iommu_queue_free_pgtable() and I'd be hesitant to convert it back).
> >> Otoh it might be okay to free page tables right away for domains
> >> which haven't run at all so far.
> > 
> > Could be, but then we would have to make hypercalls that can trigger
> > those paths preemptible I would think.
> 
> Yes, if they aren't already and if they allow for freeing of
> sufficiently large numbers of pages. That's kind of another argument
> against doing so right here, isn't it?

Indeed, as it's likely to make the implementation more complex IMO.

So let's use this pCPU implementation.

Thanks, Roger.

