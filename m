Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8229E7D30DD
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 13:03:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621364.967739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qushj-0006SU-DL; Mon, 23 Oct 2023 11:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621364.967739; Mon, 23 Oct 2023 11:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qushj-0006QM-AN; Mon, 23 Oct 2023 11:02:39 +0000
Received: by outflank-mailman (input) for mailman id 621364;
 Mon, 23 Oct 2023 11:02:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rddO=GF=citrix.com=prvs=653ff57d6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qushi-0006QG-1l
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 11:02:38 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa917685-7193-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 13:02:35 +0200 (CEST)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Oct 2023 07:02:24 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SN4PR03MB6750.namprd03.prod.outlook.com (2603:10b6:806:211::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Mon, 23 Oct
 2023 11:02:21 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 11:02:21 +0000
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
X-Inumbo-ID: aa917685-7193-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698058954;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=G+rfaFyo4+tel/pBmYimzF1NGtYmS+fcNN9W5vtTgH4=;
  b=QX4l0P6raeBpo77s62VLSxowkIgTJ2p9YC1y0xjk5T3ILiwXaQRA5yag
   i47Qfl4BZ2X1k6nNsU4vmxYyl+lrCz+yiHO2/3Wso7eEQEOaFwJ8Tu5ya
   iovZjUT+faCsicVe0cfQoD1XzANAUzPgERa1bL4JOVZCiqRt+hiD3oHFV
   A=;
X-CSE-ConnectionGUID: VETQoeRgRo+lE3N2V6jVDA==
X-CSE-MsgGUID: kIPumQQuT76/nL2xwdazLQ==
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 125602209
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:+BSwUKxe5f2WRscb9ax6t+cRxyrEfRIJ4+MujC+fZmUNrF6WrkVRy
 zYYX2GAb/jcNGD0fot1Pd+wph5Qv5HQzoNhQABs/iAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EgHUMja4mtC5QVmP6sT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KV9jy
 cUfJQoCVBfAg8/t5uiFFOtSqu12eaEHPKtH0p1h5RfwKK9+BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVQpuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37WSw3uhAtpDfFG+3v1LuECW/1UONEJIEl2f++mmhkesf+sKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluP1TM9KGYDYWoISFUD6ty6+IUr1EuXFpBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPuRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:3rIQ2qvExgZRd3mPJ6ywir0P7skDS9V00zEX/kB9WHVpm6uj5q
 eTdZUgpHvJYVMqM03I9urvBEDtexLhHPxOkOos1MaZLWzbUQKTRekP0WKL+VLd8kbFh4xgPM
 lbE5SXdLfLfD5HZY6T2mOF+5xJ+rS6GO7Cv5am80tQ
X-Talos-CUID: 9a23:ddEi32AoSy09P7/6ExdKyHcTF/oqSHqeyFqLBRWGV2RXZJTAHA==
X-Talos-MUID: 9a23:/cTfmQTmaNb4vbjLRXTvpQl/Mf5R/pjxVgcLtc8WpMWNJwhJbmI=
X-IronPort-AV: E=Sophos;i="6.03,244,1694750400"; 
   d="scan'208";a="125602209"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBhRykrJjzQJ/LfHr9qT2cimUMcf8lcFtzYuNyp+rk+9NMEParPWhBhNptUTZhnnnn6q9xdKuiRQuR4oSVSXYvexHG0N+Ibua7neXEeGV+rs8dOX3yx/3Geg3sidXH4nqxqS1qW381uzMvyxLMGurtof/cbV+o0dLRbdG9CqA1coHAxQqEEFpbPpbInlfYKafGhYdwuLTq6BeRsbBCScakCEpKcxspMOsT3SWRPUKYiRWhVq/OOePGTnykugnDB3z+JHg3TKV/Obwcsojld/pzqudZXo0Hbe8DTgD/N1zv7ooXEVEuMmmHCTCEfa9JDlG6GsJ5B2W+3BsMN/nvHhNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1TXcisM53Gw0IVgqi7OG7S4Z1pX9BFTfRW+VAwnCNI=;
 b=h/sQZL9s9dTRhm8e52qb753gNAS6T1seE+QQtyytKJcBJq2P10p75hPHeRXESAIp9l/GgwxKkJ821cOCqtw06bAnyve/U1oFSn8MvYbf29F2PqkowAf439F1G0L1Kr3X+mDoo6Tzr9ypAYTCtjSBPRy2N8RV7YYYQV6gQUWTH3U4XDkWoZ3sKHon3OBlzJgW4jbeRkQo0g7sHe66KQksKjV1x0FdxVCuzRdWuPRUn62Rw7HFWBFqoc8+010vYxp1kDibaxzqG0gwhrefEMyCby05U+pOYGYEsVqbg5VlTFR2HIDeLcG7/ozXpijzaQnbgM+uv5MuFnKls7z70hapig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1TXcisM53Gw0IVgqi7OG7S4Z1pX9BFTfRW+VAwnCNI=;
 b=KGTTTOuEpTJGGILQzmc+xecs+4TPfrtozpUnL1AjH5m80JXdMATgYuvOSv6o3DGZFRDtKNCk32gwqhCfoqjlTN3wiEZJoxslhC5XkZuezZDS+H8FoU8OuW0Ahvtad15xqKHma6Y4Bc1N/PQfIEIqOVd9+ZLaNEzOoL5hdiet2/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 23 Oct 2023 13:02:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/shutdown: change default reboot method preference
Message-ID: <ZTZSulkgPFQAd8hM@macbook>
References: <20230915074347.94712-1-roger.pau@citrix.com>
 <b045e8fe-ccf7-bbcd-ece8-036a13858d36@suse.com>
 <ZRv8fRhYQrwU1H6q@MacBookPdeRoger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZRv8fRhYQrwU1H6q@MacBookPdeRoger>
X-ClientProxiedBy: LO4P123CA0665.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::16) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SN4PR03MB6750:EE_
X-MS-Office365-Filtering-Correlation-Id: 6594e585-3119-44d6-be3a-08dbd3b787e7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	528OOraLPYvrz2apoB4iBKPOZKBvHZ2uif1rNtecPf82mVvz4aRNq0gJtGelN1e9KHnbbqgpVxxCWD4B8EZW/WqQbgWQIJG6juRkw2rcBXyIBcKgxqlCMIaq9H63FR0+BbKvD2KgFq3/ObUuvzXEAKTi/wWmBMpXP52PL2fpFAI+U4Kwp8d/u4Dw8AS80FnutxVHOTTYyPNtaZfAc9B14uEHGOJtUIkl9QiYXzHuZdW1L8tx3wJl1Q1o7AT20T982RXxkQXSKjhQ4UYWfY07krcAk7ZCHLfL8wctHhAh68xnEZgd/BY1pihNz6LToAs/SkxiH1V8tpv/8Ofh39ttH0liaOzYkqwsbgudec2rZZrbjqXNGHHOSJZrfVepZhMLebf/i+JJP9QBTbqmd/4NjLISgVxrS00Ma9NI297hZFHlPfcFyCnU7PSTDuyvLLjOfKkrCpxYPsA9UQjLYo6Z1jtj6mNR0FMjZTrBV7BaeGmmC7WYVVwOJVVW96UBzMHRuQ0MFKcli/DqkRunbGoMyKe9Gl2cBeOU1XdrTYDpd/V/Yd6AbW3Ofqeotq5friDFeXFf0wWyM5nq1cyPzskFPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(39860400002)(136003)(396003)(366004)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(53546011)(85182001)(9686003)(6506007)(6512007)(6666004)(82960400001)(26005)(66556008)(6916009)(66476007)(54906003)(316002)(478600001)(966005)(6486002)(38100700002)(83380400001)(86362001)(66946007)(41300700001)(4326008)(8936002)(8676002)(2906002)(5660300002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTlSemQ2UWY3dnhPb0l6b2pOM2dNM1czb3RGSTh2TnBta3p3aVJFaHFobE9W?=
 =?utf-8?B?RFVEWWRsWTF4eWNRbUR5eDUydFdRVWczM1FiVnFaTDNMM3Q5WEhXWVB4WlZM?=
 =?utf-8?B?NFROUnJ3NGR2aGFBY1FuYit5MTN4SlVoajBFNi9pdmZkTERuMUhONVBoQncy?=
 =?utf-8?B?TGpoSmJTZGhtWm52ZzlRekcvbElRS1AxQk9wWEt0MnJqdi9jYzgyYnBKam5R?=
 =?utf-8?B?OHZaQ2Y0TEN3UlhpaGZKM3B5eWFOVzBkczRnQ0dvcVdnV0IxTjkxZXFUbDFv?=
 =?utf-8?B?L3lYZUpWM1g2NkpHODJJdEFqcDRoaUVNaTNzNFBtVmZOd1I5V3YxcnlDRTN2?=
 =?utf-8?B?MjdseElLVEJhREtnQ080Tk1Rc0JHdEszTXZwWSs0RWpZeFI2ZHdnSUY2NlRV?=
 =?utf-8?B?eXhNc3lTbVFiaXJvcG92ck9oaTdHV0VYMzhESU1LcEhWYXJUbUdENmQwSm5r?=
 =?utf-8?B?ZGhGS3RQbWdRMk1jVDJDamJ6VWtiWEVmajJiQWhEZVppSDM0NE1uUnlTbldR?=
 =?utf-8?B?NmkvWWJ1TkRYelcrQ3MrZEJIRmcxbHE0Qk5tNlcwcmQyTGNMVXNsUnVVeE04?=
 =?utf-8?B?aGdleXRTK0RiaEgwSWNuY3ZJdmluTDdRd3BxL1dQUE5SY2x6MHl4WFl3L3Zn?=
 =?utf-8?B?QUJCbkRZMXZZaTVHWG9VR1VEbVptM0kwREVsaWNJR2JsUiticnBtcjNTQVc1?=
 =?utf-8?B?WWxHcHFMdHR0VjFLbHcxTHowWGFQRHlpSGhid2pNRVdiTWlqTzZUbUJhSk5Z?=
 =?utf-8?B?NlZkaktkV09wY3FwdG9WVEs4OUd5T1V4aW9EYzlheElxTmE2Y1BUSzdwbGFU?=
 =?utf-8?B?MG12UjYwN1IxVXFDTGZOQWxhaXBKdmNVUGVWcU5Sck1acml1TUpONDI2dGZv?=
 =?utf-8?B?c0gxcmRHY0tzbDFDYlgwWGVsRlF5WDJwNFF6QzMybGs1bjFHelZKM0hOV09U?=
 =?utf-8?B?ZTlYd1l5cVFOUjUrT1AzakQ2bmZBSG03bTJ1eGRLUXRkOGZDTFRDbkZJU2o5?=
 =?utf-8?B?RDNabmNBMmwyZXc1ZFl3N096OFp1OFJuNVMwZEw5c3Jwbmd0bG9qMjZ0Wklv?=
 =?utf-8?B?SEVKU1QzNTJDcktSbkRUY2xKNUc5ZE1TRHJOS1VLcG52eFBtWkhmaXFWTXhw?=
 =?utf-8?B?V0pUUUROMlVDSEpGbXVlNTk5M0F2WmFXdGlleDZSU2pPckRHUkpjVGU3T0kv?=
 =?utf-8?B?WDFZNVpiSmduZXFQZ3RxZjFWenpGdGRVbFVObERnbm01UkZZbU4rVkVsbG1o?=
 =?utf-8?B?YWVoeWdwdHdFMG52TTA0eE1nU3J2Nm9hdW0rUmRldVNWMFdtUEdBaEg2cEk0?=
 =?utf-8?B?SEk0Vkg0V3l2VDhxYldIaklzWTFwY1ZkSGhqWnRmYmhPdHc4QmxJdnU4WEZi?=
 =?utf-8?B?c0lWSHcrWlRzTVkzR0dEMGhSM0NnMGdNdzNwb2x6WVJuYUU1UjhYSk5nQXMv?=
 =?utf-8?B?K3VienJGUzFad2dYbFdBRVo1TlpCeFVrRHpteWZnd0EvcmJwaGRoNjJ3eElx?=
 =?utf-8?B?SlFmS1A2TEFpa3VKMTgvajJtOXprWHFCVTJEZE1iK2ZtdzlGV0ttK0hpQndG?=
 =?utf-8?B?ek0zZ0ZzUE5saDZERlB6c2hpaTZmbzhMcU93R1YrSmxBNkFTcGd4RGVwSmZk?=
 =?utf-8?B?dDlvTWNwdi9Bb2F3V1BoWCtYSGdqVW82NlJ0OUIzdi9HSm1WaUM3SEQ0WDZZ?=
 =?utf-8?B?akQvK2tCVFFNTG8yU2JTUWlyeHkzeE8xUDY3b0c4ZmlxR2tVMXZrVUlDcWd3?=
 =?utf-8?B?L0NVSjhvRWlxbGljcjJ0MVhvV0oyK0VLckhybVpVT3VDNnpmbnQ3S1dURmhy?=
 =?utf-8?B?a1dMS2w0azBwbDJES0ZBb2R6RVVTRE5rMjhaSWhZbUYweHZiYUJxWEV1NDFS?=
 =?utf-8?B?aEJWbDBXWmgrL01WSGZFZHRuQ0UzbCtIYWdQYVh1YTlzOEh3MkJxaXZOQkZo?=
 =?utf-8?B?cnRySEJvdE8ydHdIYXNESmsrSTYwRkpzYmpFQUcrYndNNWpqL0JGQW5jeXdE?=
 =?utf-8?B?THBDU21vNWo1eTIzbnU1eVhsUHRTVVhLcXJINGxLUjM3TFd2ZlJ0KzEyRThm?=
 =?utf-8?B?ZU9ZYkI5L0Jza2xTVytCcWh4eWtNQjVwbnE3YTZJaFFjTzU2UUtpRGkrNmZT?=
 =?utf-8?Q?pWdBSnY5iQSQgIbpsGNQj1hih?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oZsmTpvYqaFcQSg9ihJrI9qMPDskFzE8zZkh1W87jotgHglLMgqMvRT23ns51eHc1pUGTuiK+FLiJhBPuukBpcCViygaXiUDsH27L/E6DFvUJZLhm8hRFppUpKxQH+cyaigxNVZqy2MOKdaEPgP/8Ypq6qa0fhUGstu0fg72R8SHO2/AJcPJlMmAH8m/cIZDWo1MgcHnpiJlY+WCKJroEurMpwhybhdLei3EcuUojHXMZ/q6ukIjWa7zRjvPKcoRPrWFWT1k+5D/sa4KtJem/ThMMmZ4kN6gjBBzMPpaLf/MblsTJworX118wPHMvAaZbQWXggXbDyYHX1vIM+RfGl+ROjTa2hZBR1J9qnoXRGyQfOtSrQBUvmx5VDTq0hRabBLgjjGyfhiYY8VPURy3QUmCborlmnSVSsaZw5ohqgeKdwPlCTFm/X8zTLBNOsTDBNC7t0QssWPG01bW9IlxtcjVQKVG5lhAULbkGclOlZ3DhWLlJ1+qYR7xug6uGt7albS2NGsJPuGOmIamSvErmpmI8pWztb+Ip1XQ94EM9L2xS+RHYvziDtiGfvj1QD13X8thdTe2I8YcZ0G8fXTfBXq4m7aY2zniphBDJNuWqlJlV8BmwnBeQ38Zq8ra26ssIxQxVeUm3XvDnDg+vCO26PYs/AHfSXqiaHgd/to8pZPy6IHFcWQPKeu3MuikMhCTTQdZDDAfRIvnZ1U0h6r2rvGUxt3whCnbiIVQRE0PF/haCjTb2JMrhaTYF4ZznTWmsOe+AcwkM/TzRGhxDx05RR3mV6/Nu56kQU9HwEKiZ7FkI2+KpXq7w8ruafrDMLRFSrqbNKjPP/6fZ7X4wLWZ4g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6594e585-3119-44d6-be3a-08dbd3b787e7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 11:02:21.7983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5NqIxf89QnRxE/Zzu6sjm5CU21R4v91dhSoUC7psoMP2oIDB2QhgVD7zz4edf7h8P9aizFnufafU/b3PVDeEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6750

On Tue, Oct 03, 2023 at 01:35:25PM +0200, Roger Pau Monné wrote:
> On Wed, Sep 27, 2023 at 10:21:44AM +0200, Jan Beulich wrote:
> > On 15.09.2023 09:43, Roger Pau Monne wrote:
> > > The current logic to chose the preferred reboot method is based on the mode Xen
> > > has been booted into, so if the box is booted from UEFI, the preferred reboot
> > > method will be to use the ResetSystem() run time service call.
> > > 
> > > However, that method seems to be widely untested, and quite often leads to a
> > > result similar to:
> > > 
> > > Hardware Dom0 shutdown: rebooting machine
> > > ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
> > > CPU:    0
> > > RIP:    e008:[<0000000000000017>] 0000000000000017
> > > RFLAGS: 0000000000010202   CONTEXT: hypervisor
> > > [...]
> > > Xen call trace:
> > >    [<0000000000000017>] R 0000000000000017
> > >    [<ffff83207eff7b50>] S ffff83207eff7b50
> > >    [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
> > >    [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
> > >    [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
> > >    [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
> > >    [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
> > >    [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
> > >    [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x113/0x129
> > >    [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3eb/0x5f7
> > >    [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee
> > > 
> > > ****************************************
> > > Panic on CPU 0:
> > > FATAL TRAP: vector = 6 (invalid opcode)
> > > ****************************************
> > > 
> > > Which in most cases does lead to a reboot, however that's unreliable.
> > > 
> > > Change the default reboot preference to prefer ACPI over UEFI if available and
> > > not in reduced hardware mode.
> > > 
> > > This is in line to what Linux does, so it's unlikely to cause issues on current
> > > and future hardware, since there's a much higher chance of vendors testing
> > > hardware with Linux rather than Xen.
> > > 
> > > Add a special case for one Acer model that does require being rebooted using
> > > ResetSystem().  See Linux commit 0082517fa4bce for rationale.
> > > 
> > > I'm not aware of using ACPI reboot causing issues on boxes that do have
> > > properly implemented ResetSystem() methods.
> > 
> > A data point from a new system I'm still in the process of setting up: The
> > ACPI reboot method, as used by Linux, unconditionally means a warm reboot.
> > The EFI method, otoh, properly distinguishes "reboot=warm" from our default
> > of explicitly requesting cold reboot. (Without taking the EFI path, I
> > assume our write to the relevant BDA location simply has no effect, for
> > this being a legacy BIOS thing, and the system apparently defaults to warm
> > reboot when using the ACPI method.)
> 
> This is unfortunate, but IMO not as worse as getting a #UD or any
> other fault while attempting a reboot.  We can always force this
> system to use UEFI reboot, if that does work better than ACPI.
> 
> > Clearly, as a secondary effect, this system adds to my personal experience
> > of so far EFI reboot consistently working on all x86 hardware I have (had)
> > direct access to. (That said, this is the first non-Intel system, which
> > likely biases my overall experience.)
> 
> I can try to gather some data, I can at least tell you that the Intel
> NUC11TNHi7 TGL does also hit a fault when attempting UEFI reboot.
> The above crash was from a Dell PowerEdge R6625.  I do recall seeing
> this with other boxes on the Citrix lab, but don't know the exact
> models.  I'm quite sure other downstreams can provide similar
> feedback.

As a further data point, Dasharo [0] a coreboot downstream was also
providing a firmware with a broken ResetSystem() method, and they
didn't notice until someone reported errors on Xen reboot:

https://github.com/Dasharo/edk2/pull/99/commits/dee75be10ac9387168bd3a8cad0f1ec6e372129a

It's quite clear no one is testing ResetSystem(), the UEFI spec
doesn't mandate using it, and we are just hurting ourselves by forcing
its usage.

Regards, Roger.

[0] https://github.com/Dasharo

