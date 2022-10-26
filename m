Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5272260E155
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 14:59:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430552.682356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onfzJ-00087O-EL; Wed, 26 Oct 2022 12:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430552.682356; Wed, 26 Oct 2022 12:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onfzJ-00085Z-AL; Wed, 26 Oct 2022 12:58:29 +0000
Received: by outflank-mailman (input) for mailman id 430552;
 Wed, 26 Oct 2022 12:58:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4Ky=23=citrix.com=prvs=291e24488=roger.pau@srs-se1.protection.inumbo.net>)
 id 1onfzI-00085T-A3
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 12:58:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e07035d0-552d-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 14:58:26 +0200 (CEST)
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Oct 2022 08:58:19 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BL1PR03MB5957.namprd03.prod.outlook.com (2603:10b6:208:310::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 12:58:16 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 12:58:14 +0000
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
X-Inumbo-ID: e07035d0-552d-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666789106;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=S6Gv7JgTxvNnJWtFzs1s8mFI3IbPKUso4zr1nNedTwc=;
  b=YXyZqMADPjkJ+aV5GKZLqSf312derPHLoWN1rT+bKjkzY97UKK2gazoZ
   v3n4HKETs37yW3jX0bjBYL8ktwHQ3F7K3GA1AYYRqkYV5tQp4HTNY7BGl
   rhIYDEfQ7iHqZTMAejSTg5+vK4xBiJbKpNWkirLUXzNh6HmmrTlevKQ2Y
   0=;
X-IronPort-RemoteIP: 104.47.55.103
X-IronPort-MID: 82639266
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:a4yH8KgKk3ThHBITflsR7yn2X161UREKZh0ujC45NGQN5FlHY01je
 htvUWrXPfnZNjegf9onPIzg9hxTvZaHyoQxTAFq/C02FH4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrSCYkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U4HUMja4mtC5AVmP64T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KU0Wr
 fMzKRY9Vzm4p8SzxpLmT85lhO12eaEHPKtH0p1h5RfwKK9+BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVQquFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE1rWRxnKhBtx6+LuQ9edL2ECB3kIvKl45eEua//OpqRKmcocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUSyAyL0LuS3A+fCUANVDsHY9sj3OcuTCEu/
 k+EmZXuHzMHmK2YTzeR+6mZqRu2ODMJNikSaCkcVwwH7tL/5oYpgXryos1LFae0ipjwBmv2y
 jXT9Cwm3exL1ogMyrmx+k3Bj3S0vJ/VQwUp5wLRGGW48gd+Y43jbIutgbTG0ct9wE+iZgHpl
 BA5dwK2tYji0bnlePSxfdgw
IronPort-HdrOrdr: A9a23:HBpTmKtDpUv8XiMOLBfBhhXN7skDYdV00zEX/kB9WHVpm62j5q
 OTdZEgvnXJYVkqKRMdcK+7Scy9qB/nmKKdgrNwAV7BZmfbUQKTRelfBO3ZrwEIcBeeygcy78
 hdmqFFebnNMWQ=
X-IronPort-AV: E=Sophos;i="5.95,214,1661832000"; 
   d="scan'208";a="82639266"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQxlwoXsmiqWGYXNFQYjGhYsLfe7ulNjbEFczPQwOT3A4XriHTzdN8Gtb4JTM4kypiJb8Xb1H+d18DFLIsDQxA9tu2EY2RQXiO3GOWbsk5L3aTn1TV0jlD2pwBJdwC6VGRR8g+Ef/pMyWNKtQ5yL2xW6opuP8npC2fyGisZdFDx2MFoa0V5q15WqIl++uxw4NkuSbdhvV8v9BN7YbebXuxspt0ysJoAuS/eXZ51ASRKJVG138qvuiKgvWfseMwLgS7v09C9WWHmhmtqQwRii8jyxeSORd3B8KEn7aR6AAGLuDWftd/3LstTeHUkPuTx0XqqX+o43kgQRK36Dn+KRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BN02nZQ3WWoFkhtqZyZcB4FegHtCKo6r1cu4pKyFp4=;
 b=bJKS6H5j4uq36k7SJTnEgmoM0pV/3x135mR449MEawU2L3pCzoRjO5+0SfVYRHj5cRVg59L3um3sNCkYvlaQBFKxQFmlPd41gDx0YZm7W2t4E7n6RLMqk3FMZUsqvivtAVCwnLlqmyiepjHSkwysUcwcFmeuBMDfNDo07eOp9RRk5phQsFoJLcPtOy5bUmn2FXsKYjUCML2zLwoW5+270PLUzr54bQqNT96o+LxocVRHkoTbOwLmphIdUUSpVIcWJLDAoo7vSWTbjeX1C0/Ps2lOVIbH5DSv1z4jQUg51+kb8cOhFm7bxPzOBn37Eo5ShRuAZRgkkKGHUTFQAJ+NPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BN02nZQ3WWoFkhtqZyZcB4FegHtCKo6r1cu4pKyFp4=;
 b=ViPFS6GipsT46hxxqJvKrAUM5Oh/GU3DR8rU+UUopwRO6EG1WPn5hXxaLs1dIs7roiT9Ed/AOPsgHt4Xc1AkYoadHVlYDzZT0CSm2Kkfg0aQOhgTyCTNZB+IZMz/IvK0v2gjk6Huc9/P+ATXvS+h0Aec1QFH2+yAwNJeADd0G2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 26 Oct 2022 14:58:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17 v2 4/5] pci: do not disable memory decoding for
 devices
Message-ID: <Y1ku3PPoBpZDtM2U@Air-de-Roger>
References: <20221025144418.66800-1-roger.pau@citrix.com>
 <20221025144418.66800-5-roger.pau@citrix.com>
 <a03bae18-9a38-854f-0634-f11c42e65fcb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a03bae18-9a38-854f-0634-f11c42e65fcb@suse.com>
X-ClientProxiedBy: LO4P123CA0461.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BL1PR03MB5957:EE_
X-MS-Office365-Filtering-Correlation-Id: b1e47be6-70a0-49f6-1d54-08dab751bc73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7vyxT0sL2v83jWM8rs0v2MAsWJ1tOvhezYewR+PP8fIDSNgybJT8tAlFZMRcBy7oGv9AdZMgZUsUo5q3ID7LP4qSQFWMytOe82+8rFGHktBB2Nl4xoTfyGc/2Ui8VcEovN2Ypl/6yN2D0yEwd0iYrYUXEvEYbJCB6qrx160LdPpeugWCrJTE5WCCcvrHWGVSmmPbJvDrdAXMe2RTmMIkFAAZ2QPxETUxphRh5rNnaBr2XU1wiHS4rcWRQws510ARKWDRGYm2BPrNtYuYjYjzGk7ADJdH3RWlMyg7m+EsmOpF37IExfu1PtPI8WjmEFfK0cG1UFcexB1sXW/TKP8jyyqc87DswYglskwhwvWjCGbq6KdpJXRqXGmUREWM1RxtdZ3Kj0G5Qq7ieQrecQrDMYLsWTqlBai8Ajb7ZESgeo9cFLWhLnj0/ZuvG1h6JR/7WvGTrl2H5Ikb5lo4WjLp/4GulLtEh8OhjGyEbbuO1mjpqqPcr3vEhj+P62PAFXrGtc4Mwzrgl3F6fPT9QJ+C6zs0Ryc6VIp3JlSYjHNxa1SDBRcZM23xRfZQUx5r7kPjAJqmS35dVky8nqpU9Nj1MUwM6XWXOLrySNbJj+ejBIH73p3Lr2xmd2/M7YWsGxvOW0yXTAp/FO/37vbeieupSePMqB5i9TxQ5w3svJP9dXqvKPQF7k/AMg7Kf/+H3YOUXYICAYfR9OdndKjC3Pxkyg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(376002)(366004)(396003)(346002)(39860400002)(136003)(451199015)(26005)(186003)(6506007)(53546011)(6512007)(9686003)(83380400001)(6666004)(5660300002)(2906002)(8936002)(33716001)(478600001)(6916009)(66946007)(41300700001)(6486002)(4326008)(66556008)(8676002)(66476007)(316002)(85182001)(86362001)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUxxNXRXQ1d4blVuUmxsanI4V2pvam5LNnJtNjRudVhVekpUSjczVlhLdVEv?=
 =?utf-8?B?WVRIY0p0dG5OOFd1VXdJNldjdFQ0RFBPNUpLbG5RYTM2eTVETWhxRjYxRitO?=
 =?utf-8?B?cXBESTE0dXVtM1JRd2cyTFpsaHdmbGwveGJrUnZaK1JMTkdTb0RYaVBwdXNr?=
 =?utf-8?B?YnBQdjNjSFBXM1hIQTN6N2JkdWNvRnBYQUp5cWJuTDRHUk9zTkxKMlh1eWhM?=
 =?utf-8?B?bnJOaHY5bi9jNEFWbkhDcW9oeHNGQUh4OTRZblY3K3RUM3d1U0gwTlZvZ3Vl?=
 =?utf-8?B?OGNIMHBTUzFvc0hmSjNLaVVXZ1lORWtMdStvMW9tRnQ1N0lRaXBaQXd4em5S?=
 =?utf-8?B?NDdTSnIvc1dORUN3U3laaitkcXZFWmpHbTk2d1dOZkx5S2M0TGFYRExJbi9y?=
 =?utf-8?B?c09XZzZwMW95VnNpMnZRU09FWlJoKzAzTVg0cWZOQjZiWGVnZ0lYYmZLMHQ2?=
 =?utf-8?B?WFkvZGp4Y3FQanNzbmd3VjMvZU1hOGZuMkJjUTZ4MmZuUlFKME8wRFQ5UU94?=
 =?utf-8?B?eDdqNHRIQlhTVjFKYkU4NURUeGlkRXIyYVJWUXBmREpHWDYvVk9ldHBrT3Bo?=
 =?utf-8?B?a21MdjNFaXNDMWhVcVoxNjVoUitNbkJCZW12b0lXS0dJYXV4SHNDYUVkNW1S?=
 =?utf-8?B?R3JlMXdvN2w5NG5jck5JK0xZdSswZWtTSjVVekRuM1JLZWRVZmV4UGhmcmdD?=
 =?utf-8?B?Um5tNld3a3lTdDZJRDc1am5lcEErYnIweUZVZVByTm9ONTdTcFp6c3cwdXA2?=
 =?utf-8?B?MTRJc2FYa2ZRNUJmd3ZsTk5hSzZRQzdYZm1ORTA0VUdTcUY2QlMwYkpzdStu?=
 =?utf-8?B?VSt0dnM1bXBnWWQwY1RBWWhMMms0TXlqUUlBYVpUQzREbTNNZW1vSFFVNHg4?=
 =?utf-8?B?NTI4VUdIWHBYNU0yVlVNREp4S0NXWDU3Rlp5NENlMXlBQVBaelVYdGh6MnpX?=
 =?utf-8?B?OHVqVFVHNVJNVUlzZTdobW1lUTh5S2E0NVo5eEtwU1ZaN2pkR1ZJWkNvS3Z5?=
 =?utf-8?B?ajAxT3RJTmQ4cU1FTFNmN3A2bXZXL2xKcGcxS1ZhdFloME1lUC9kQ1l2akgz?=
 =?utf-8?B?czVUZlJIRkxNeTR6cjBrclZ2ZWE2NTR6RHh1T0hTVVBBSzllLy9CRXk3YlJl?=
 =?utf-8?B?ZCtXdVZyelAreE0vZkgzdWdqNGlDcVFBYnJGSFRNS2lpdHoyWjV0V1hQZW5S?=
 =?utf-8?B?YlBMenhBUU9FUFlaUXdCOXVVREhlWXRXemVZMENPdVJuZTJUTTJXTjRIajlT?=
 =?utf-8?B?VUZLWHZpb3FTNmVUb2VPbnRCQ1RTRFpMRTdDRWo2UmlPTjF5YzhvUHR5VDh5?=
 =?utf-8?B?Qy80VHpxcTRLNHRPQ20yRVJnVHpscGR5UFlCWWJOeUxmS25JL09XMmszOEZh?=
 =?utf-8?B?WWoyYWQrNVBEdUhvbEg4ejc5SlRJZnhQOHNtS1p4T0tkNjhEYTd0bHl4SGp2?=
 =?utf-8?B?Zy9YaUFzamc5azZMeFNjeHd2R2VXd0lrYzh4WW41b0JvK3VpdTdkSm9KeGVP?=
 =?utf-8?B?UXVHanRHbjg3VWlMM0t5TXBHaGRVS2RkVmcvWmxrcGRQMXJZN1grY2VTYnBz?=
 =?utf-8?B?Nm5PeHI0TzB2Q3JKdlRqb0pFbnpiWk9qRVh1akg5cEd2ZXBZODlNNEJpQXZQ?=
 =?utf-8?B?aHA2Q0xxKzJnRlorbHZTYTgzcTFZVEdRWURaVjJpcTl3ajlmTHFFQ3BycjFK?=
 =?utf-8?B?bm1wbVJNNU14Nmlza2l5ODN3M1E4dWt0dElMenVrK0VCUlVKbFd3U0RwdmdZ?=
 =?utf-8?B?T3JqNXAzcHdjbkQ0bGZrcm5wN05kNmFQVUpvckpZSFR6aTBZSXJObXU3K29F?=
 =?utf-8?B?bEkyZ2sxaUlLS1p4eFZVSm5DYUZNUzlaTnlXZVVyZGJwSmkva2JtdXFuMUQw?=
 =?utf-8?B?ZTY2VEZaU0tLTXhXVFpwVVpUSURhT2hkVXU1UHhTdFlac040dkhwRGxHMGpj?=
 =?utf-8?B?VFR6RkVOMXY2ZGkzQUZoWGRmTEpjT0t6Z1FzdnlHZlhwbnlSVDRVWVBROElq?=
 =?utf-8?B?R1ZDMnR0RzlZb0l2T2c5N1NaWTlMeDFRajZYOThtTzdEdEllWEtZajkvZ0VT?=
 =?utf-8?B?SW5DTDZ1YWdvWGsybXhNZHMyNUJLenZ6TlMwaXNXMko1QS9kc2M3UDI5WDlO?=
 =?utf-8?Q?TC5cDK8Wsjoey3A3fCZzgQSGZ?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e47be6-70a0-49f6-1d54-08dab751bc73
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 12:58:14.4035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhKJ29N34YsbxTJfYnXh9Hzq2s3eNuWIf0ziP3xtCmG/nhhOlwBYm6Uu/5LG3gdPd/+XN1/GjSSAOnxXyMgNrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5957

On Wed, Oct 26, 2022 at 02:35:44PM +0200, Jan Beulich wrote:
> On 25.10.2022 16:44, Roger Pau Monne wrote:
> > --- a/xen/drivers/vpci/header.c
> > +++ b/xen/drivers/vpci/header.c
> > @@ -121,7 +121,9 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
> >          }
> >  
> >          if ( !rom_only &&
> > -             (bar->type != VPCI_BAR_ROM || header->rom_enabled) )
> > +             (bar->type != VPCI_BAR_ROM || header->rom_enabled) &&
> > +             pci_check_bar(pdev, _mfn(PFN_DOWN(bar->addr)),
> > +                           _mfn(PFN_DOWN(bar->addr + bar->size - 1))) )
> >              bar->enabled = map;
> >      }
> 
> What about the ROM handling immediately above from here?

Needs fixing indeed.  I had plans to short circuit the ROM only
mapping path earlier if the BAR wasn't correctly positioned, but
decided it was too complicated and then forgot to adjust the
conditional.

> > @@ -234,9 +236,25 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >  
> >          if ( !MAPPABLE_BAR(bar) ||
> >               (rom_only ? bar->type != VPCI_BAR_ROM
> > -                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) )
> > +                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) ||
> > +             /* Skip BARs already in the requested state. */
> > +             bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
> >              continue;
> >  
> > +        /*
> > +         * Only do BAR position checks for the hardware domain, for guests it's
> > +         * assumed that the hardware domain has changed the position of any
> > +         * problematic BARs.
> > +         */
> > +        if ( is_hardware_domain(pdev->domain) &&
> > +             !pci_check_bar(pdev, _mfn(start), _mfn(end)) )
> > +        {
> > +            printk(XENLOG_G_WARNING
> > +                   "%pp: not mapping BAR [%lx, %lx] invalid position\n",
> > +                   &pdev->sbdf, start, end);
> > +            continue;
> > +        }
> 
> I'm not convinced of it being appropriate to skip the check for DomU.
> I'd rather consider this a "fixme", as (perhaps somewhere else) we
> should return an error if a misconfigured device was passed. We cannot
> blindly leave the security of the system to tool stack + Dom0 kernel
> imo.
> 
> And then, if this is Dom0-only, I think it wants to be XENLOG_WARNING,
> i.e. without the G infix.

OK, I don't mind removing the is_hardware_domain() condition, it's
still not clear how we want to handle all this when domU support is
added.

Thanks, Roger.

