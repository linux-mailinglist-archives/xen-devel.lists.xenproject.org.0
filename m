Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C60527A949A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 15:19:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606439.944346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjJa2-0006cx-7s; Thu, 21 Sep 2023 13:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606439.944346; Thu, 21 Sep 2023 13:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjJa2-0006ah-4y; Thu, 21 Sep 2023 13:18:54 +0000
Received: by outflank-mailman (input) for mailman id 606439;
 Thu, 21 Sep 2023 13:18:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wI4U=FF=citrix.com=prvs=62171ef32=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qjJZz-0006ab-Kp
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 13:18:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 649c823d-5881-11ee-9b0d-b553b5be7939;
 Thu, 21 Sep 2023 15:18:47 +0200 (CEST)
Received: from mail-bn1nam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Sep 2023 09:18:25 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH8PR03MB7306.namprd03.prod.outlook.com (2603:10b6:510:252::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 13:18:23 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 13:18:22 +0000
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
X-Inumbo-ID: 649c823d-5881-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695302327;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vguYYU7iJIBUSBpc+xenvWUVt761GadOUHBefiQpPxo=;
  b=FQ+RSaYXPwKjckJ3omzTLRR5cpEKauXkDE5k4uwwOcMGzx8PiTE+qOJS
   VqLcaDRVlbGqWXhu6PSShH/6wH3+3Nu+OBsA2iXJAal7H0rnJQerJnwdA
   egCen00ALyt+7nJwl6uFz0yzEwEdCXl7iYrEHWm3E24dJLbgN1SiKB6n9
   0=;
X-CSE-ConnectionGUID: UZiQYvX4QsicCTf/yuueqQ==
X-CSE-MsgGUID: 71llPG3nTAS8N2vYBS7F7A==
X-IronPort-RemoteIP: 104.47.51.48
X-IronPort-MID: 122028095
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:0QNR8KDnUNAKcRVW//Liw5YqxClBgxIJ4kV8jS/XYbTApDIq12QPy
 TQbCmrQaP6PY2LzKt8ka42+oBhSsJWEzoAyQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4GJC5wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwx9R2OFBQx
 aAhMzEGRSyNwPOr3b+ic7w57igjBJGD0II3nFhFlWucJ9B/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI/OxrswA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WPfqCr21reewEsXXqpNTbm8ztExhmG6/Tw1UgMnf2Dkj6aQ3xvWt9V3b
 hZ8FjAVhZY18EunX9zsRSqSqXSPvgMfc9dIGuh84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YWmB+6idty/0OSkRIWIIfyYCQSMM5tWlq4Y25jroSttgC6ezgsfCMDf82
 S2RrCM+irMQiuYGz6y+u1vAhlqRSoPhSwc04kDdWDuj5wYhPoq9PdT0uR7c8OpKK5ufQh+Zp
 n8YlsOC7ecIS5aQiCiKR+ZLF7asjxqYDADhbZdUN8FJ31yQF7SLJtk4DO1WTKuxDvs5RA==
IronPort-HdrOrdr: A9a23:naSgn6FA1rM7+vQLpLqFgpLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHP9OkPAs1NKZMDUO11HJEGgP1/qA/9SkIVyEygc/79
 YdT0EdMqyWMbESt6+TjmiF+pQbsb+6GciT9JrjJhxWPGVXgs9bnmVE4lHxKDwNeOAKP+tPKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0L72fBIcABYjyQ+WyRel8qTzHRS01goXF2on+8ZozU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjvdTGcCWjcARCzP0ziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU611rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ej0XigzBcZtjZ9QNkKx0TtogPhMlI
 Zwm06JvZteCh3N2Az7+tjzThlv0m65u2Arn+I/h2FWFaEedLhSh4oC+149KuZ3IAvKrKQcVM
 V+BsDV4/hbNXuccnDip2FqhOehW3widy32MHQqi4iw6Xx7jXp5x0wXyIg0hXEb7q8wTJFC+q
 DtLrlovKsmdL5YUYtNQMM6BeenAG3ERhzBdEiIJ078Ka0BM3XR77bq/bQO4v2wcpBg9up/pH
 34aiIYiYcOQTOvNSXXt6c7sSwlAV/NEAgF8/suqaSQ4dbHNfjW2S7qciFcryLvmYRbPiThYY
 fDBHtnOY6dEYLQI/c24+TfYegmFZBMarxghv8LH3Szn+nsFqrG8sTmTde7HsucLd9jYBK0Pk
 c+
X-Talos-CUID: 9a23:eRPR4WGUUL7IDIZ6qmJaxk8tK94VLkTGzXz7H0H/GHt0RaSsHAo=
X-Talos-MUID: 9a23:UhwFSAn5Jxf2hLkTRPC2dno9bcNs24v1DnwkqsUg4de1HxcvFWi02WE=
X-IronPort-AV: E=Sophos;i="6.03,165,1694750400"; 
   d="scan'208";a="122028095"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbFh4PCcDwxkOKOxKGL9HRMnkqOLWYG0CoiHk5lhWU1xEaSJkhZq5o8cT/D5sHp+wdYYs3KozfUak0chSKpiU7qbxdgqr7LcoySSpQWCDtprPuR/WPdhlSWe9QnT+m737vWLx0baawSG+iK+jMzmSCjgs9u8XIPGedSZW/mgbNwvrUyXuecxkBQ/47NlM9ITJedgD8QJtb1A8FmHiTlNnKPnn1GEnalcsM2AnWZ6iNGNItF1RPf+cO7BcW+gigcDdu8iMKkTQynMTqh3UhcvebznA32wAtoVKEiN9pArTmjKynSOYTR8gbnwHZIZ95S3qL5za3ZrHjrJBUriedwbnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTvr8ivJCkVHFmvpdahbV+Z3n6GpQtE+mw6m1OxmvXU=;
 b=KtyfDSCarsqimhhdbMG6x3bLOZgKPF+3kT+b19hkRIRG5gmY5R5pPqv+CUCJY9UfHYhKgiY7OzTPeVPnIs96EtO/ORorW4o721obzzK5KwFZFa2Xf1Uz0MeH3CRszhYhrlQT5jZR1LT9613oK1H4qvDGI8YEM7sGtgQ2apmu5UEOcUpLBvMwBFWC4EC91EVq8G0oWi0QPeHSPYg7iwD9ivEWtGujIgcOKbD5nyaTBhy3JYmnoZwwfnfWVenTRBEle6Jii+p5ps+QZkd3ZlGfJPPu8HEbmljoGAxoA0rBzYD8H6nhBiHVVItac9YC77Ut5joNvlsLeykxLeB8qc9Y5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTvr8ivJCkVHFmvpdahbV+Z3n6GpQtE+mw6m1OxmvXU=;
 b=xmEOojKarZ8ynC/o3HQRWPcoMa6+jGNjyxY2EbsirLr6YxCYc2q4aTkOPIuepxIqqb7UvkcNRxdDvPgbONCtez8w5x0OohPGiwm56Uu5QBFXAyFVAhuJEwbzM3fNonQaxYB6yiILKfa9kTwGTBksI3Jbb5KfK9VHIkWi144jZu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 21 Sep 2023 15:18:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v9 10/16] vpci/header: emulate PCI_COMMAND register for
 guests
Message-ID: <ZQxCl7rjAgJb2eDz@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-11-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230829231912.4091958-11-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: PA7P264CA0321.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:395::24) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH8PR03MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: 448a6380-acb7-419c-b5a4-08dbbaa53a84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wXGPnZYICpZTv05Sfn4hErZkwV6/gmfQfQsAJlHMDGj+IdNyNwcO+KElZN/QkDzsfQm+zggvVziegJ8fMeo5b7CZ4nVKWrRQjd8hCQ6n3/y0bpBS9wXOq78VxvJGdkWjX+1bWbFTPABVHtShB3VO6jSZqv9oQKzjxSaAiim5EP0uQYSlwvASCjklwKwcuMJKBeUKYAm6QmaL8wowHfeICjmxdUQjC8Oxta+2sTDPCVrqwktsoCJOyGIPCx/Q4nV6GqNUlE23NjXaf5j4iJ178GNQFiNDpTBlLOdkJ1BrfuHrfXB1Xky2yP6kRPUHXGQUTsJhneCRB4TRqG8aYfnASCCQMGmjteGMQy+zKwB3BIh/esynpETwv7Osjva+qY1XcCofPnVDTyeEfqNZUnigPTBh7yx69isrCtS9Sp/mKja0/fEglch9bWOtpTDeTvQsXEc33R1iXH1pYkFOSj4JQx0IZm+1K6MitTsm9IAEsmATcySoOmfX+nB1Kh4DWR1JLqtjkXzqjKtBmaXffR1/E0W2LIOy0Bv0TZL4glX3PWhNdIxSCkCMe6bdCFYmAag3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(396003)(376002)(366004)(346002)(136003)(186009)(451199024)(1800799009)(86362001)(478600001)(38100700002)(82960400001)(6512007)(6666004)(6506007)(6486002)(9686003)(83380400001)(26005)(85182001)(41300700001)(316002)(6916009)(54906003)(66946007)(66556008)(66476007)(4326008)(2906002)(8676002)(8936002)(33716001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGd5cDgrcE1pczR3ZEJFVG1vVG5xMUZna2Z1cll5cTN5eWMrY1ZrVG56S29X?=
 =?utf-8?B?bnl2dUt4TUoyUURsbUtJbVVnVUJ0U0Rsa3RzRHNiTS9yZi9XSkNPU2ZUWW9B?=
 =?utf-8?B?c3c0NWlITGVRR1A1dmlhbXM4Qms4S0NWREI4MWtqNUVBQTN1TmxwSWFWazM0?=
 =?utf-8?B?YzA5aEpPT21GT3plMmVuSWpzVlpCb2ZxTy9YZWp0TUc5S1lNelVpTHlBYVM2?=
 =?utf-8?B?S2hWV3c5NEEyMFd0bDhrUHlPL1VkM2tndGY2S3dGd0hGbERYS05xbUQrZEV1?=
 =?utf-8?B?QklJUUQyODcrdmVYQmgzaW1BSHdSL3U5dUNCVGlScUJONTkrc3haMGtxTElW?=
 =?utf-8?B?bFZZYnB3MWZtdFNCRUlIL2NTaUpuRGc1YytBVjFxK0xFWWtqVDVyM3d1Tk5a?=
 =?utf-8?B?SXVCY3BpSEdaUHZPTi9jL2Vmb09xbGhTNWRQbFN1NFkrNm9BUXE5QXY5OWVX?=
 =?utf-8?B?ZTRPd3ZFRk9GNzBzelNLR2h4MWNXSHhHRmZ3bDZTOUpVZ2RnZ3RiMU41THVZ?=
 =?utf-8?B?OEpOd2EwS0dpNmR4SEtDeGtEdjJ6WnNDL1YzcGw4MGQ0U0FQYjQ5NHdoalZW?=
 =?utf-8?B?ZzFNTWVod0dUUzVpM2Z0a0ZZN3BsMWs1dUY0V0FwOE80dHVvQjNzUWVvL3B1?=
 =?utf-8?B?TWV3RE9aSnl6WjQ2dUdPeWN6d0hYcjdrQ0lwbjAxOWMzVTZRK2NEcE5teXd5?=
 =?utf-8?B?YnpSSEJ1Q3dvUEFBelE0ZzlHR0EzNk40dGJEeWh3V0pXYU1PWE15NnAyNHFV?=
 =?utf-8?B?YVAxLzg2bUh4K09mV2orMjVRREhkUzA0SnB6S1c1Q0pyK2tiSStTb05SOGFa?=
 =?utf-8?B?Z1VLZ0QyUlZGV29QR1JvZzRxM24zMGtQam5NUUNxNlFUaDZVYUpBNjMzbFl3?=
 =?utf-8?B?S2kxVmJ6bkc0emJJSk5hcXF2Z3BWa2pyMTRmb3dqTUs1QUpUYVpVNmZZcEtr?=
 =?utf-8?B?dUVSR1FwaUZHeVY5REd6enJXNDk4OXlub3Q2enVPdHA1SFF6OXk3VitROGc2?=
 =?utf-8?B?ZmYxa2NjMk5PbXlmL05tYi81UHdKc1R0WWtUL3pLRGJ2ZUZWaEdEODBtMWRE?=
 =?utf-8?B?WjJTRDExNUE2QlNvQURRbUpkOTFjYUs5bi90UnNMc0RydGR5QVJrYnQ1UnlL?=
 =?utf-8?B?NHVCbVlkRCtUdW82Y0FWek45TzYyYzZKVHJDRGVTa3JDVGVRTU52R3diWUt5?=
 =?utf-8?B?UWN6bys4T1JFaEc0Zk9KbUhsUWt4NXg4SGVKMklBYll1MlpFMkdDVEFpTFdo?=
 =?utf-8?B?SFQ2Mm84TFZNTGZSNkxQVjE1azZ0Zm82Wm1PU3Y4WkZFOVlTbExqcjlJLy9Z?=
 =?utf-8?B?UExicHdkY3UzTksxTU1yQ1VURFRBL2VhU0U1Tmg4djV6dGtEek44SUxNb1ZM?=
 =?utf-8?B?OGwybEY5MTc2OEJqM1d0M21zbzdCNUJKcjNXS1JUeFRJVWJ1c0VRd25zdDlY?=
 =?utf-8?B?R2MyUEU0bEtGakRTbGIyd2Y4bVNtNHVCZ2pRbElYV0djYTkvQ29OTDcyeGU0?=
 =?utf-8?B?ZktFdE5LakRpdEc2Q2tGMW82L296YXlnclpGd3c0ai9Md3ZRQXA1Q2Rqc29R?=
 =?utf-8?B?c3I1d21WVWU1U2xxQ3MyZkJXdVo3RFgvdHZ2dDhicE43SUJGZjB6OVZpNzE0?=
 =?utf-8?B?bjgvTlc2eG1zeE9NSmsrd0R2MGRqbUxueWpOaTFtdElPbS8yaStxVjVxWklR?=
 =?utf-8?B?N1hUdzU1VnVZOEIxdFk4djRQRGZZNlBpZTZuNEdrTDYrczdnN0hIVVBBUzFa?=
 =?utf-8?B?QXlVMjdidHJJUEgycEdicDNlZk4yMkwyUEFEc0xhVm54cVo4SEdXYUdxcStj?=
 =?utf-8?B?NXRzenhkVDZodTNBT3puajFxMXBmYTErTENZWUpDYnNnTzJJWTR6VkFhKzdr?=
 =?utf-8?B?TnRTNTkvQUprcXBveXFtUU1EVnBZVkFYZnVsc2UrMGhmb3M4YUcwQVhMcCs5?=
 =?utf-8?B?QjNqd2tIckRqOC93ZkhHcGxFelFpK1lPZTROM3Vzc1U3WEE0OTFTNUlXZ0xr?=
 =?utf-8?B?eE1YTFdjaTc1YnpxUlhkNm82cE1OUFNTNHM1UEhRNGZyTWRXUUtpSFNxdk9J?=
 =?utf-8?B?Q1A2SmtqVUQ0ekpqZVpjUUNrTEE2RUVmRElINHBJSHJmSlhKRVpSR1FUb2xC?=
 =?utf-8?Q?nKLtEn4W+ZgEy5hbUQP3RpbbN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IJb99BiG+ygnEMdVesW8u2fV8l+2to1BHlyreWF94PYsfhoyPzf40LBBS2Oyvw2ee/zKTUDSZEQl29SBg1UXSLZy+oxzo9ijnaQxmrGedbL0/wwqXD/rhn7rpbxjohcJcfR7R9hwlBC9zUHunvSYVryuCakpfz2Y1+fiLFoGLZhtHYl4YJwPFgDdSKHYYQJoVuBOHScc/rcYyc82SwW/TvhNbw8JivsTgTWtUEHlw+64t+ogQyrwOxk7ZWM7VuXjvnKM/Q8OXb2zSQjusgkaCrGGJ5wK2+uH25nt77+Enlrq8kLyx9g5NXDvMJjxbitwI1lVysmJZmiqbuH6Nd+I96sEkCRYNcpxNiTAaCPnX5cZN3CpJCZFo3qjSNV1UXpSqWQptpIGVE++x3dtZpKGB6GazrkQYsR7gpPm29LcQ55EFzM6PFwPPJmBPbAgyHXUgcRy59G7NXlGtchhkRHBjgya1WFFf6Z+huv2eeGgsBxS2czpUcwpHAMqA36U1v2wAxkosGjdYoFTuJXgZCFZ1O2ivmBM4/vu3+OZXEwaG4xUnbVjCHdZp4EF5XRIoq+oS2i6xUKakhbpnzxyDI3uAlrcGdO8zI7TVNppl3X8DHGZkSjZZnamEapPLrMEDog7i+5OCF/kEroSv4gFskaNEhPLFzMSGkPbbSkINLGnVxt2SEQSiHuQPSFJb1ezGICeXZePJG9lEoZwFlLBCfCMnjA3Q9kejGJBCOfiEb91618UW7G2GU0icXO40SQUGoD8DHQ7odYoNwxOCzsaBrW7T4RSCG/wWgYyt3zEd1KGLVviuct/3F+CEhFam+F/EA32
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 448a6380-acb7-419c-b5a4-08dbbaa53a84
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 13:18:22.0732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ean6tlSfSm7P6wXqvEHKPdqqVorOTenu+G4GBV7ddL5V45sSnKn4Za/z1kXfIhxNrsavE0MXGb1P2CK/Cl+gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7306

On Tue, Aug 29, 2023 at 11:19:44PM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Xen and/or Dom0 may have put values in PCI_COMMAND which they expect
> to remain unaltered. PCI_COMMAND_SERR bit is a good example: while the
> guest's view of this will want to be zero initially, the host having set
> it to 1 may not easily be overwritten with 0, or else we'd effectively
> imply giving the guest control of the bit. Thus, PCI_COMMAND register needs
> proper emulation in order to honor host's settings.
> 
> According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.2
> Device Control" the reset state of the command register is typically 0,
> so when assigning a PCI device use 0 as the initial state for the guest's view
> of the command register.
> 
> Here is the full list of command register bits with notes about
> emulation:
> 
> PCI_COMMAND_IO - Allow guest to control it.
> PCI_COMMAND_MEMORY - Already handled.
> PCI_COMMAND_MASTER - Allow guest to control it.
> PCI_COMMAND_SPECIAL - Guest can generate special cycles only if it has
> access to host bridge that supports software generation of special
> cycles. In our case guest has no access to host bridges at all. Value
> after reset is 0.
> PCI_COMMAND_INVALIDATE - Allows "Memory Write and Invalidate" commands
> to be generated. It requires additional configuration via Cacheline
> Size register. We are not emulating this register right now and we
> can't expect guest to properly configure it.
> PCI_COMMAND_VGA_PALETTE - Enable VGA palette snooping. This bit is set
> by firmware and we want to leave it as is.
> PCI_COMMAND_PARITY - Controls how device response to parity
> errors. We want this bit to be set by a hardware domain.
> PCI_COMMAND_WAIT - Reserved. Should be 0.
> PCI_COMMAND_SERR - Controls if device can assert SERR.
> The same as for COMMAND_PARITY.
> PCI_COMMAND_FAST_BACK - Optional bit that allows fast back-to-back
> transactions. It is configured by firmware, so we don't want guest to
> control it.
> PCI_COMMAND_INTX_DISABLE - Disables INTx signals. If MSI(X) is
> enabled, device is prohibited from asserting INTx. Value after reset
> is 0. Guest can control it freely.

I'm kind of confused by the text above, does "Guest can control it
freely" imply that the guest is able to modify the bit in the device
command register vs the emulated view that we provide?  If so
INTX_DISABLE should not be allowed direct guest modification.

I'm thinking that we might want to allow guest access to the first 3
bits only, while the rest of the values won't be propagated to
hardware, iow: guest will get a fake view of them.

Have you checked with QEMU how are those bits handled?  That's our
current passthrough reference implementation, and we should aim to
handle those similarly in vPCI.

> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
> Since v9:
> - Reworked guest_cmd_read
> - Added handling for more bits
> Since v6:
> - fold guest's logic into cmd_write
> - implement cmd_read, so we can report emulated INTx state to guests
> - introduce header->guest_cmd to hold the emulated state of the
>   PCI_COMMAND register for guests
> Since v5:
> - add additional check for MSI-X enabled while altering INTX bit
> - make sure INTx disabled while guests enable MSI/MSI-X
> Since v3:
> - gate more code on CONFIG_HAS_MSI
> - removed logic for the case when MSI/MSI-X not enabled
> ---
>  xen/drivers/vpci/header.c | 54 ++++++++++++++++++++++++++++++++++++---
>  xen/drivers/vpci/msi.c    | 10 ++++++++
>  xen/drivers/vpci/msix.c   |  4 +++
>  xen/include/xen/vpci.h    |  3 +++
>  4 files changed, 67 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 1e82217200..e351db4620 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -502,14 +502,37 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      return 0;
>  }
>  
> +/* TODO: Add proper emulation for all bits of the command register. */
>  static void cf_check cmd_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t cmd, void *data)
>  {
>      struct vpci_header *header = data;
>  
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        if ( IS_ENABLED(CONFIG_HAS_PCI_MSI) )
> +        {
> +            /* Tell guest that device does not support this */
> +            cmd &= ~PCI_COMMAND_FAST_BACK;
> +        }
> +
> +        header->guest_cmd = cmd;
> +
> +        if ( IS_ENABLED(CONFIG_HAS_PCI_MSI) )
> +        {
> +            /* Do not touch INVALIDATE, PARITY and SERR */
> +            const uint16_t excluded = PCI_COMMAND_INVALIDATE |
> +                PCI_COMMAND_PARITY | PCI_COMMAND_SERR;
> +
> +            cmd &= ~excluded;
> +            cmd |= pci_conf_read16(pdev->sbdf, reg) & excluded;
> +        }

I'm not following why allowing guest setting of those bits is
conditional on HAS_PCI_MSI being build time enabled.

Isn't it equally good or bad to let the guest play with certain bits
regardless of Xen build time configuration?

As said above, I would look at QEMU and see how bits are handled
there.

> +    }
> +
>      /*
> -     * Let Dom0 play with all the bits directly except for the memory
> -     * decoding one.
> +     * Let guest play with all the bits directly except for the memory
> +     * decoding one. Bits that are not allowed for DomU are already
> +     * handled above.
>       */
>      if ( header->bars_mapped != !!(cmd & PCI_COMMAND_MEMORY) )
>          /*
> @@ -523,6 +546,14 @@ static void cf_check cmd_write(
>          pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
>  
> +static uint32_t guest_cmd_read(const struct pci_dev *pdev, unsigned int reg,
> +                               void *data)
> +{
> +    const struct vpci_header *header = data;
> +
> +    return header->guest_cmd;
> +}
> +
>  static void cf_check bar_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>  {
> @@ -732,8 +763,12 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      }
>  
>      /* Setup a handler for the command register. */
> -    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
> -                           2, header);
> +    if ( is_hwdom )
> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
> +                               2, header);
> +    else
> +        rc = vpci_add_register(pdev->vpci, guest_cmd_read, cmd_write, PCI_COMMAND,
> +                               2, header);

You have used the ternary operator in other places, I would recommend
to also do it here to avoid line duplication.

>      if ( rc )
>          return rc;
>  
> @@ -745,6 +780,17 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      if ( cmd & PCI_COMMAND_MEMORY )
>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMORY);
>  
> +    header->guest_cmd = cmd & ~PCI_COMMAND_MEMORY;

Memory Enable is cleared from the guest view, yet at the end of
init_bars() mappings will be established if the bit is enabled in cmd.
Won't this create a mismatch between the guest view and the contents
of the physmap?

> +
> +    /*
> +     * According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.2
> +     * Device Control" the reset state of the command register is
> +     * typically all 0's, so this is used as initial value for the guests.
> +     */
> +    if ( header->guest_cmd != 0 )
> +        gprintk(XENLOG_WARNING, "%pp: CMD is not zero: %x", &pdev->sbdf,
> +                header->guest_cmd);

I think it's unlikely for the command register to be zeroed out, I
haven't looked, but I would assume that after a device reset by
pciback it won't be unlikely for some initial state to be set.

> +
>      for ( i = 0; i < num_bars; i++ )
>      {
>          uint8_t reg = PCI_BASE_ADDRESS_0 + i * 4;
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index a0733bb2cb..df0f0199b8 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -70,6 +70,16 @@ static void cf_check control_write(
>  
>          if ( vpci_msi_arch_enable(msi, pdev, vectors) )
>              return;
> +
> +        /*
> +         * Make sure guest doesn't enable INTx while enabling MSI.
> +         * Opposite action (enabling INTx) will be performed in
> +         * vpci_msi_arch_disable call path.

I'm not seeing such code in vpci_msi_arch_disable().  However the
updating of the INTX field should be done after MSI(X) has been
disabled, and hence can only be done after the pci_conf_write16() in
control_write().

I would be fine if you want to leave forcing the setting of INTX to
enabled once MSI has been disabled, any sane guest will do that
itself, but the comment needs updating.

Thanks, Roger.

