Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F27533F44
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 16:33:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337247.561787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nts4e-00083U-O5; Wed, 25 May 2022 14:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337247.561787; Wed, 25 May 2022 14:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nts4e-00081h-Kk; Wed, 25 May 2022 14:33:20 +0000
Received: by outflank-mailman (input) for mailman id 337247;
 Wed, 25 May 2022 14:33:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PIRJ=WB=citrix.com=prvs=137d214fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nts4c-00081b-JU
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 14:33:18 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c23a575-dc37-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 16:33:16 +0200 (CEST)
Received: from mail-dm6nam08lp2043.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 10:33:07 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN7PR03MB3794.namprd03.prod.outlook.com (2603:10b6:408:2f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Wed, 25 May
 2022 14:33:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 14:33:01 +0000
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
X-Inumbo-ID: 9c23a575-dc37-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653489196;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AOo5nijY1u8TBtG0yW8aJXoOG2wZlRWmGERCTzrYVec=;
  b=QFBJFMTEk6Oo0Ofvn55d6EvtGM1Xl+3KdUpOu41zWdZKtVfIXD9oiATI
   kk/lXwvzre6gW08I1w3kg4I+4AaKTnDsryQPIxLtrrHUwv8d1HLsxmRZB
   SVnjLejaCKwrv4Rz5M+DzDTkKOVfWlsJ4r760iW/0wGV7d6h32LnH1Be3
   w=;
X-IronPort-RemoteIP: 104.47.73.43
X-IronPort-MID: 74677368
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ul2OxqvdWUshDPN6/PCy4iGeROfnVCZfMUV32f8akzHdYApBsoF/q
 tZmKT3TM66JMzf3e98lPt+0oBwBvJODyIUwGVFoqi5kRS0a+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17X5
 IuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8pMZPWpcMyCyV9MH5UJYF20rvfEUWW5Jn7I03uKxMAwt1IJWRuYcg037gyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4ADmmtr7ixNNa+2i
 84xQDxjdhnfJTZIPU8aEskWl+a0nHjvNTZfrTp5oIJovzaMk1cvgNABNvL4Q8C3dcF0xH/F+
 G6bxXzrXiMmBuCQnG/tHnWEw7WncTnAcIAYGaC89/VqqEaO3WFVAxoTPXOkpdGph0j4XMhQQ
 2QE9yxroaUs+UiDStjmQwb+sHOCpgQbWddbD6s98g7l90bPywOQB2xBQjsfbtUj7J8yXWZyi
 gTPmM71DztytrHTUWia6rqfsTK1P24SMHMGYigHCwAC5rEPvb0Os/4Gdf47eIbdszE/MWuYL
 +yixMTmu4gusA==
IronPort-HdrOrdr: A9a23:POXz9quBj7srALf0VZiYYe8e7skCL4Aji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPuftXrdyRGVxeZZnMTfKlzbamDDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjIzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIO/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfqWG0hYczBgNkGmpDq1L8Yqq
 iKn/7mBbU015rlRBDxnfIq4Xi47N9h0Q679bbSuwqfnSWwfkNHNyMGv/MZTvKR0TtfgDk3up
 g7oF6xpt5ZCwjNkz/64MWNXxZ2llCsqX5niuILiWdDOLFuIIO5gLZvin+9Kq1wVR4SKbpXYt
 VGHYXZ/rJbYFmaZ3fWsi1mx8GtRG06GlODTlIZssKY3jBKlDQhpnFojvA3jzMF7tYwWpNE7+
 PLPuBhk6xPVNYfaeZ4CP0aScW6B2TRSVbHMX6UI17gCKYbUki94KLf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwb0BciHzPRwg2fwqaWGLEDQI+1lluhEU+fHNcvW2AW4OSMTutrlpekDCcvGXP
 v2MI5KApbYXB7TJbo=
X-IronPort-AV: E=Sophos;i="5.91,250,1647316800"; 
   d="scan'208";a="74677368"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wbp6pdtb3k6bCtop+bDTBZfXzn0vpoCHT//GmvNO1Jlmj42CkoEd1eJEKFCC2Ek75RYYGqMQ5PYRSzai4KZRqlGD77YJglY6btrrbUgvbG3hnudOdwwz8+DZ9LV1yBxxo1ZbanZv0nWJzOR+m/SGN/doSLe0QuvbxpcWSPAB4RW3OfS5s3leIzdEeDQJOeGPcjN2GGSNrTtksGtnnsTk+13/qyb7DQNTZMW5WmHtQrHDs6eTyKnCzHhdtr5RbMYqRL4M7TXLqM5FI7z6GIXDDH8GMpv3j27iv5Hs8PLRLNqr2u4mm2c6qfa4IDPU1GsD4qy3iq+9U//tJ13zbmXv6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOo5nijY1u8TBtG0yW8aJXoOG2wZlRWmGERCTzrYVec=;
 b=GNg6oz3DJSxxqM9gMhoolCYlPMxAiKsHXd9P9VPAen4vA+vuJPcVQBjHCoO0PF4QrCM/ZwHjmM8s0VmpxQ9rTfak6qQ4V+KzIJ1ym9Vqw/8d+7mDqI/FwZ7KroX61QE0K44PVk8usV+CejueqTqce9dqG1TIAj1PB63VDHVe7esmbIlxjy7uPua/eWRnf8WNw5eJJ3fF/Fa3MFpP2G4XGF75efye76XSubeSqc5FIv19Kec0NkxjVoJWn9rcBZZ7ebbUDOv908nZnI7tpVtKaKp+1tBlMS5EaaHsTciF6g2pY5HNC6nYWCzXIgUv42BS+3aEcNlxoc5uTbL0rc1J8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOo5nijY1u8TBtG0yW8aJXoOG2wZlRWmGERCTzrYVec=;
 b=UvKXga5e0xtqscM4p25puQh6gWb1lu/gGRovQNtIQH/elCcH8GdViUT3aVsZh6qAhu6nN8vzSnPTiCMU3CkeGfkf/zEmF7HvooYez5oBZeW+naeTzI6l57ZJvwnSn3vwq8bmYjmVnEBOZ4NLNHD/RrC1ctwJI2FGZHbqB7ss1iQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/2] x86/mm: rename FLUSH_FORCE_IPI to FLUSH_NO_ASSIST
Thread-Topic: [PATCH v3 1/2] x86/mm: rename FLUSH_FORCE_IPI to FLUSH_NO_ASSIST
Thread-Index: AQHYcA9OnQ9W6lKd/EmmrY4D8odolq0vawYAgAAGBACAADeDgA==
Date: Wed, 25 May 2022 14:33:01 +0000
Message-ID: <4bd5d8b5-80a2-8f7c-c117-5c027d8e8f34@citrix.com>
References: <20220525081311.13416-1-roger.pau@citrix.com>
 <20220525081311.13416-2-roger.pau@citrix.com>
 <58aa1cc1-3a67-60d4-6f8e-6c5746b05614@citrix.com>
 <fceb1ddc-0236-69ac-7d36-766668a22599@suse.com>
In-Reply-To: <fceb1ddc-0236-69ac-7d36-766668a22599@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b92a31ca-77f7-4547-4a4f-08da3e5b78fe
x-ms-traffictypediagnostic: BN7PR03MB3794:EE_
x-microsoft-antispam-prvs:
 <BN7PR03MB3794530FF08244E784608C8CBAD69@BN7PR03MB3794.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ilWUpOKVOVuvRES3kOosoA5EEq51r9yJIjORNy4gj2y8aZm9Frwsu+lnA8i+vW0U/2KYirfEDbv8YjvRSPxfniKRuNAAPzqiAlAeM/X32YZTtSDPJYf1htRQV6iBdHphoqvjxpWD1FmL209IisPlto9PGcnXWPdTtNxVuY9N8FgKj0VBgORBw1QYnSQUhXkCg6xn+FSZPHt3ZLP0S9NqdhxpZG0B8CEYdYL/thsKABij8a7dvFL9MKtMQYCEXZNL4lBnukGIHsOPzpmQ2JUSkfkVjKJ8Q9TJYmnMvVa4A7VMYWqJnRtpX62wzog1XegRYq24Yz0p/J4UX1OheEhQoRYIGviCDKib1CcJFASs/1unPouwdoBd1k9VAyYtBEb1y6rFcaItuvJzG67yoLbPhuKMiBh0h6vdOWKJVSKtFIxZHHnKU00vXrgjzIBEd4w3m1QMHnJxnRjAn/Yu3sqypfUSNzrkegfIe4qNQDE7t0RpQCCnDYOvGVMMZjRF7fzDgrLxTbrp/yWwtPd1sp3xqFGfBTcpHLlpkuJIDmVOtvWdXjO260oYyMRnxzHxqKKVotJNNYKvxZctbjejNX71UMNOEDgecX6DRQzQi51XpBD9aEbd1CWqxA3M2yq2uDMywJSPmBy7NOLseAgl3Y/0gXsBeZjhFqB656jg+r7D0UJtpbWFgTmHY2WI4v0dYgULDP/sSsObFC6GYKRFuru7BsGWRE6Ier40isN6RAUP/lnlAfHuQZV8m9L7Y3tekPkfz6O16LZzHlwtUKFjWKkkzA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(26005)(53546011)(38100700002)(31686004)(6486002)(6512007)(64756008)(508600001)(36756003)(82960400001)(4326008)(122000001)(38070700005)(2906002)(83380400001)(66446008)(186003)(8936002)(2616005)(5660300002)(316002)(6916009)(86362001)(54906003)(31696002)(71200400001)(76116006)(107886003)(66476007)(66556008)(91956017)(66946007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VkRZdThPZWJvek42bTBKb1g1V01sbGtlVnMxaHJHQlNmSHdGcWFPNDl5U0pv?=
 =?utf-8?B?NlZwVWtFYWJEYkxLWE8yVEtlRHpwcDExR3V3OGJZT3l5azRqY0t6emJ1SCth?=
 =?utf-8?B?dkVEdFpUTTVwTVVrcVhyN3VZb2xpMWZQaGQxbm9pQlQ3RTlPbU9IcmRoU2NJ?=
 =?utf-8?B?U1JvK2tQcUd3alVxaWJYSUFXQUVLeHBQK1ByRDNtSklCcEdsbXdpTnplRjEz?=
 =?utf-8?B?c01QWWpwUUlZMVZEdzJ6V2hBR09wYzZrUU0vd2U0R1QrS1E0dkR6Wi8rSFBH?=
 =?utf-8?B?Zk1jb2NZYzNNMFpPaDNETXhkelBDMUNjMnd1cGdEWllBZFFKODc0dXp1MEFX?=
 =?utf-8?B?RXVhMGJmeE1OTlpXbG56Y2o1SWx1dHd0OHZzbG5MRFdRQ3JORXhWQzJ2MU9F?=
 =?utf-8?B?SEF0S3NHVDF6dFNaYnB1NUsyMEhaWXdkT0xqRVE0dzZjU3ZDTHM3aWViNkJu?=
 =?utf-8?B?aUtmTlRZeG9LS2cvZk9aRFpVL0ZJdTdpQW9FT3RveGgraEZaZ1JNbjQwbGli?=
 =?utf-8?B?UFB6OGNkWmxkL2pTVGRDL0dzdVpLWkV2Mk1QSXdwV0xrMjZWQkJDT2cxNkNn?=
 =?utf-8?B?eWZaNlliR0JhNmJhYXhzMXp6azk5M0U4T0NmZURNRWl0UW4wZjhMWkZselpo?=
 =?utf-8?B?UGN1OXViUzJURU1TK252OXdUSUxiQ1o0UCthZ3hISGhEUm9ubEpuV1NIWGFF?=
 =?utf-8?B?UXNqTm1seDUrMFN1YnJncmt1dmx0em5ERnJIZ3JyRnFTcnU2UzM0eHRtQnRn?=
 =?utf-8?B?dmhPR3ZxSThMenJ1TlU4ekFTc201Wk9kbVFteEJ0Zmp4dW9OTDVkQ3FUeHdR?=
 =?utf-8?B?cHIxZCt0d1V6c3dFRVVZL3lSZy9wdVArTEJhWGFRdStpMkQ1YTk4SFJjYnNt?=
 =?utf-8?B?MWpvTTZ1TXNQeHRlYlU1SlhJblg2dm9XTm5kZHU1QlZRR3Y5VTJ6L3pFcWhi?=
 =?utf-8?B?YXFCUVU1WnZhM3VxemVRU1JveFVJMzV5QUVYMmt6MHhUNkVRSFN0SVcvYm5z?=
 =?utf-8?B?MEUvenIyTHk5SVJuVzl5aEVsRXZ5ZFJRZENZMkQ3ZFdkcmgwK0NJbHR2bDEz?=
 =?utf-8?B?cy9QZllnaUxJSHV3M3JieXF3c0IyWHJYMG11ajNwK0ZwbXlsMUVYbXBONnNp?=
 =?utf-8?B?RmNSUzNLdVo0SWxYUlFsOEYrSVI5WXJKREc4Uzh5c0tNZVpFdWd5TkRzaW42?=
 =?utf-8?B?Z0dySGJud3cxejEvdWR1M000SFZheFJuYlErU25GaklKc09aVzdIQXgzZGdJ?=
 =?utf-8?B?YUNRdFh6M2lud0dVTkprRUF3MFhwNjB2ZmVBaGEzUEVnMnF0L2pPbFBDSjUv?=
 =?utf-8?B?WVgrYzlQUVZWZmpKMzkwaVl4emgvdWxvL21yR2x2Vm5DVmQzd0lLQll2cEx0?=
 =?utf-8?B?bHBJQlphdUZSeUpUSm5sdnVlVkxpMmVJWERFRWxsdzBqbVJXSU1KMnJWOGFN?=
 =?utf-8?B?Q2ZjVytKRXpoRlB0RDBPUC9iRktJWVlERUl4bnpKb3Rnd3ZYOU10ekxsUHdW?=
 =?utf-8?B?cEYvV3EvbGRFT0NDeElieU00RG5DaXJrVzJtNzNRb2FtcVdHRW50QU5UWS9T?=
 =?utf-8?B?TzFycWlrV1BRNy93VXNHYlQ4WWNDRXNZSTNLRm9vOFdCaFBMbTl1WGo3dTYr?=
 =?utf-8?B?blhqaHhWdWNta05nMEQ4TngvU08xQjFDWjVsSUhrQU5QaEdia2ZVOWNSbzQ1?=
 =?utf-8?B?djNvU01ySDZ0dUtmbzJDRzlEY3RRaXJ3T3BvNFVYU2FPNTY4VmJZQzU5RXR3?=
 =?utf-8?B?MmxWMFA4U25zNkV6RmJrYkVKOW54RktVbTlSaXRhenRkTFZrN0htNGhFbVVC?=
 =?utf-8?B?eVVCalk2cE01RnBMWmRMOVc0M0c0YSsrbGFmamw2QUhMaHhqaklFeVVQaWd1?=
 =?utf-8?B?L2tQRTlVMGJuTmlKY0gwS1UxbFhnNkhxYlZtYnpQalhmbWtnZ0hnRjdNZ3JO?=
 =?utf-8?B?d1NDVDFHeU5OazNmT0M1Q0VDSDRuNS9TbFRnWkYxNXpUZlBibDBSVFByc0d6?=
 =?utf-8?B?Q0VSdEM5T0VKRWptRnFkM1lXWGxTSWp2UzBxc3JhYWNoZTNzL0N0TXRzakFM?=
 =?utf-8?B?bmZDcncxYkVWRTcwa2FTaFlQdm1tZGE4R0tCNmVGSjNuVERMOXpjWUhqRkFI?=
 =?utf-8?B?cENzd1JFMGUrNGQxZXg1MjlYMFhhOVd4cjNnREZXdmlqeDczdUlCTkVFVklt?=
 =?utf-8?B?UElWWWRzTytWS054LzBsamM5UldjK0FzRHdIMjRDRVFCQUVLbVlVT0hCUlFJ?=
 =?utf-8?B?Q0d5S0FKT0Fub0tmNVZzd1FxK0JPc1daRVh3QnBDR2dyaEdGM3RmdnlRUFkw?=
 =?utf-8?B?alI2bHQ4T2FUczFiMU43TWYzcGhjY2VqbTlhWjA2RHNPNnZrYlprb1JIeHpz?=
 =?utf-8?Q?zuIF88Oz8UsZGcS0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C3D23CCCC32944DB7155A7C5F2F5EB8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b92a31ca-77f7-4547-4a4f-08da3e5b78fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 14:33:01.8911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SBxMw779dyOwt6N5TSstcjXAoY/0tndImJFBNUM+oYYcziObSgPAkzGMuRr2rg4ldLqmKvszUyM+V6/JgiCUPEEudyeZ/Y2jAHKfmp7hf+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3794

T24gMjUvMDUvMjAyMiAxMjoxNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI1LjA1LjIwMjIg
MTI6NTIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyNS8wNS8yMDIyIDA5OjEzLCBSb2dl
ciBQYXUgTW9ubmUgd3JvdGU6DQo+Pj4gUmVuYW1lIHRoZSBmbGFnIHRvIGJldHRlciBub3RlIHRo
YXQgaXQncyBub3QgYWN0dWFsbHkgZm9yY2luZyBhbnkgSVBJcw0KPj4+IHRvIGJlIGlzc3VlZCBp
ZiBub25lIGlzIHJlcXVpcmVkLCBidXQgbWVyZWx5IGF2b2lkaW5nIHRoZSB1c2FnZSBvZiBUTEIN
Cj4+PiBmbHVzaCBhc3Npc3RhbmNlICh3aGljaCBpdHNlbGYgY2FuIGF2b2lkIHRoZSBzZW5kaW5n
IG9mIElQSXMgdG8gcmVtb3RlDQo+Pj4gcHJvY2Vzc29ycykuDQo+Pj4NCj4+PiBObyBmdW5jdGlv
bmFsIGNoYW5nZSBleHBlY3RlZC4NCj4+Pg0KPj4+IFJlcXVlc3RlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KPj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4+IC0tLQ0KPj4+IENoYW5nZXMgc2luY2UgdjI6DQo+
Pj4gIC0gTmV3IGluIHRoaXMgdmVyc2lvbi4NCj4+IDoowqAgVGhpcyBuZWVkcyByZXZlcnRpbmcu
DQo+Pg0KPj4gSXQgaXMgc3BlY2lmaWMgdG8gSVBJcywgYmVjYXVzZSBvZiBvdXIgY3VycmVudCBj
aG9pY2Ugb2YgYWxnb3JpdGhtIGZvcg0KPj4gZnJlZWluZyBwYWdldGFibGVzLg0KPj4NCj4+ICJu
byBhc3Npc3QiIGV4Y2x1ZGVzIGlwaS1oZWxwZXIgaHlwZXJjYWxscyB3aGljaCBpbnZva2UNCj4+
IElOVkFMSURBVEVfVExCX1ZFQ1RPUi7CoCBTdWNoIGh5cGVyY2FsbHMgZG8gZXhpc3QgYW5kIHNw
ZWNpZmljYWxseSB3b3VsZA0KPj4gYmUgaW1wcm92ZW1lbnQgdGhhdCB3ZSBvdWdodCB0byB1c2Uu
DQo+Pg0KPj4gRnVydGhlcm1vcmUsIHdlIGRvIHdhbnQgdG8gd29yayBhcm91bmQgdGhlIGxpbWl0
YXRpb24gdGhhdCBjcmVhdGVkDQo+PiBGTFVTSF9GT1JDRV9JUEksIGJlY2F1c2Ugd2UgYWJzb2x1
dGVseSBkbyB3YW50IHRvIGJlIGFibGUgdG8gdXNlDQo+PiBoeXBlcmNhbGxzL3JlbW90ZSBUTEIg
Zmx1c2hpbmcgY2FwYWJpbGl0aWVzIHdoZW4gYXZhaWxhYmxlLg0KPj4NCj4+IEkgYWNjZXB0IHRo
YXQgRk9SQ0VfSVBJIHBlcmhhcHMgaXNuJ3QgYSBwZXJmZWN0IG5hbWUsIGJ1dCBpdCdzIGEgd2hv
bGUNCj4+IGxvdCBsZXNzIGJhZCB0aGFuIE5PX0FTU0lTVC4NCj4gQnV0IEZPUkNFX0lQSSBoYXMg
Y2F1c2VkIGFjdHVhbCBjb25mdXNpb24gd2hpbGUgcmV2aWV3aW5nIHBhdGNoIDIuDQo+IElmIE5P
X0FTU0lTVCBkb2Vzbid0IHN1aXQgeW91IGFuZCBGT1JDRV9JUEkgaXMgYWxzbyB3cm9uZywgY2Fu
IHlvdQ0KPiBzdWdnZXN0IGEgYmV0dGVyIG5hbWUgZml0dGluZyBib3RoIGFzcGVjdHM/DQoNCkkg
ZG9uJ3QgYWN0dWFsbHkgYWdyZWUgdGhhdCBGT1JDRV9JUEkgaXMgdW5jbGVhciB0byBiZWdpbiB3
aXRoLg0KDQpUaGUgc2FmZXR5IHByb3BlcnR5IHJlcXVpcmVkIGlzICJpZiB5b3UgbmVlZCB0byBj
b250YWN0IGEgcmVtb3RlIENQVSwgaXQNCm11c3QgYmUgYnkgSVBJIHRvIGludGVybG9jayB3aXRo
IFhlbidzICNQRiBoYW5kbGVyIi4NCg0KRk9SQ0VfSVBJIGlzIHZlcnkgY2xvc2UgdG8gbWVhbmlu
ZyB0aGlzLsKgIElmIGFueXRoaW5nIGVsc2UgaXMgdW5jbGVhciwNCml0IGNhbiBiZSBjbGFyaWZp
ZWQgaW4gdGhlIGFkamFjZW50IGNvbW1lbnQuDQoNCn5BbmRyZXcNCg==

