Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C8A636457
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 16:46:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447634.704096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxrwb-0000SI-Cr; Wed, 23 Nov 2022 15:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447634.704096; Wed, 23 Nov 2022 15:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxrwb-0000LC-8z; Wed, 23 Nov 2022 15:45:49 +0000
Received: by outflank-mailman (input) for mailman id 447634;
 Wed, 23 Nov 2022 15:45:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nECt=3X=citrix.com=prvs=319181206=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oxrwZ-0008Tc-RP
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 15:45:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e55031f1-6b45-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 16:45:46 +0100 (CET)
Received: from mail-mw2nam04lp2172.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Nov 2022 10:45:45 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM4PR03MB6935.namprd03.prod.outlook.com (2603:10b6:8:47::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 15:45:44 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%7]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 15:45:44 +0000
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
X-Inumbo-ID: e55031f1-6b45-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669218346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=j0eqFRB2p2CzTLiPH9LllAVmtry5VuOqjlnAIGu853k=;
  b=T0zjxfqfPnY3WYRtRk0p8R0U9d60vJq73sdEMpKSRwadpIEjheviZmyz
   3aO65y7+DBvEOB6VNXi3Ss7sUXXDq9HzdceGS2n8digoLiC0Evo5RKF98
   PXDQw7JSvuI4eNL3lT06BJ+qBTwAnVQ7KFRbgv6RWNBnfFEqyhcs0NaH7
   M=;
X-IronPort-RemoteIP: 104.47.73.172
X-IronPort-MID: 85425901
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5SFEIKPAZ0FZstLvrR2XlsFynXyQoLVcMsEvi/4bfWQNrUoihmNSy
 mZMW2uDOPzZMTb1Ldwlbdmy/RgFsZHRmtEyTwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpB5AdmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0txzX0pis
 r9AEhAiUxujjtKxm7TlbcA506zPLOGzVG8ekldJ6GmFSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vFxujeJpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+toi/w3LKexXqTtIQ6JpGl8Po6h22qmn0jCyMPFlLh+ceGlRvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLm0NVDtIctElnM4wWz0x1
 1WNks/pBDpgq7mcQzSW8bL8hTG4NDURLGQCTTQZVgZD6N7myLzflTrKR9dnVauq1Nv8HGmsx
 yjQ9XdkwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBd8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:xytmS6FnxK3LjzTdpLqFiJLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LK90c67MAnhHP9OkPIs1NKZMDUO11HYSL2KgbGD/9SkIVyGygc/79
 YeT0EBMqyWMbESt6+TjmiF+pQbsaG6GciT9JvjJhxWPGRXgs9bnmRE4lHxKDwKeOAKP+tOKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0L72fBIcABYjyQ+WyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjvdTGcCWjcARCzP0ziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU511rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ej0XigzBcZtjZ9QNkKx0TtpgPhMlI
 Zwm06JvZteCh3N2Az7+tjzThlv0m65u2Arn+I/h2FWFaEedLhSh4oC+149KuZIIAvKrKQcVM
 V+BsDV4/hbNXuccnDip2FqhOehW3widy32N3Qqi4iw6Xx7jXp5x0wXyIg0hXEb7q8wTJFC+q
 DtLrlovKsmdL5ZUYtNQMM6BeenAG3ERhzBdEiIJ078Ka0BM3XR77bq/bQO4v2wcpBg9up8pH
 34aiIZiYcOQTOsNSXXt6c7sCwlAV/NEQgF8/supqSQ4dbHNf/W2S7qciFdryLvmYRaPiThYY
 fCBHtnOY6cEYLQI/c54+SHYeg1FZA/arxghj9pYSP4nuv7bqvXi8f8TNH/YJLQLBdMYBKNPp
 JEZkm/GPl9
X-IronPort-AV: E=Sophos;i="5.96,187,1665460800"; 
   d="scan'208";a="85425901"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJ4a0y/tFxin3qYVu+bKWAq0oq4wM9wPjnLpNNYZjR6YzIz5+LCiL9Wi4fU8fdjco40x2U0F4CZ20MfWynzvNbHYsC7ECHnE2CnNkeSU0D4yMjCH3s7e0Jf5KaWKVJ9pHSCwqito5mCDkbTw9AipoiSFDXtZXmFMQHe0fviAUxwQZrmsva+WgWs9J/lsJ+4LPHp3vGLhPwRxLQZHphwcEjb43235/ehhqsn1rIgdB6+WZ8U1jeV6tv7Ngwi66CQThcTpgdta0ozDsi+dtjCaIBGaUeDfwhe6eEc4lO0CxANPpqj0kh/bldYaCq/9DuF8XiJ0JvjREvTudUNb5dCvxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdFMrPR8EW2lv0Zu+hrAeX4u8IAlUd+YRN8dsbbLR0w=;
 b=hrVq7CLn6q281VG5Nl1ocisnoL4RR+HqREpD9w2QJjPfy7y3jQAbsnI/C69yshHd5Xc7sOSmmUwzdlzwoRh+e8j6PybGG/q3XBV1ZRvZU73W7+P6rRJ2BhLW4z8pzUwieX7uOGJeuef9jFN5pc5knhpw+Ifv6H5hNnNeU+JHxIr/rr3k5/G2O1P7g8EIj8pOtQ4sIOLpqr7ek4hXjlRz0UaB+UuwYcm2SC8VDoHarMTXkVE+4AUo8e88B95ULZ19oeXg6Wy0PPfa0GrOuHizPk40ln6fzxX8lddIlEBf5KtekqV5n2UByyAawdqFld7JVnDEJs9nOQVl5eK9X1wpdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdFMrPR8EW2lv0Zu+hrAeX4u8IAlUd+YRN8dsbbLR0w=;
 b=SmM12KcP/rDrmP4RRsaN168xiBbB87PoP4LKnN2eYmoNQoe26oItG9feFA01p3lUZlabWhIxSNWrHX2brarVUx9zRG+qGXXyLD/xgZ4IsQ7FkW58BJYRBawmaCWmyQo8lu6GgMFBKitZNAY6Aupe5OaTriLY+9vZHqMyZ7jJrWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: marmarek@invisiblethingslab.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 2/5] efi: only set a console mode if the current one is invalid
Date: Wed, 23 Nov 2022 16:45:21 +0100
Message-Id: <20221123154525.63068-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221123154525.63068-1-roger.pau@citrix.com>
References: <20221123154525.63068-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0643.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::10) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM4PR03MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 11e88ea3-9595-4c58-4c31-08dacd69c82f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W1dpZhMnbvcp/o4BJH1sG9USCrFn8I6r6HZlSiRvjqc/2JsNlCqWM1MYBIWlTy6X6at1qRGQC+cvzJcL7g2E1Ik7c0yQdWLvC5Aa2qele5CDjWXg64pmrwjpViMk0P5w8Si1EJRSdkP57bVNKj8nxuhvSBxW/J0eYpegm0XKELXlSSHTnQkbE1oaItVO1ezdYYDNum3FbXY0KInc/i/ENeCidR+PKRHDX7efef/9J3r42Of24Q6LN3oDwTTY9F01wKiM61ZxIttaAMYSxXoyacoVySoo0PrE1c0T2y2+BV1FMxlahtfFnT5rPnmljEVDj4isZe4fdaslkHyn8VSxSO1ngO+gV0FfgN5bmKpCVTD10JVUPrabEnDgYhd4GrL1HYlaQTCGGbrsiEJHqi+iaSMh/jX78qmH+3M7fg1GmO8B7t+09wdXF1dYIUY9UVl5BeE1OhQkPnR3iIYozWCMUVB19Dwy5eS2Cmf1IV7kLSUvUYbzK5Vm5p/bXpHE9Q1DYEYd5ESg9Anz9sYRSgjL+WPqRsj/qRD/me3O7HM108t5qghiZqKFKSYFrTsN9+Z7MABgJHYMQeDwb6rgiYN8iSinXW6ZIvD7b3qoC6UYHc7kQRkqDEj5b1E6oc0zIU3TSKB3oqUbJPfH3retIQzQGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199015)(36756003)(86362001)(41300700001)(66556008)(66946007)(316002)(66476007)(4326008)(8676002)(82960400001)(38100700002)(6486002)(54906003)(6916009)(478600001)(4744005)(186003)(2906002)(5660300002)(8936002)(6506007)(2616005)(1076003)(26005)(6512007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzVSWWJhOEhzcnR4STZRSUtOYS9xSHhWSkhLeWVaQmh5RnZFZXBmRFhhWkpD?=
 =?utf-8?B?aG00cUliekJuS3BvekFzeWYyRmRUUnowNFh1eDd1NjAvenZXVGVnb2dCcnQz?=
 =?utf-8?B?bGM4QXZlbkN3VVR5SG5sLzBlRHZrUElpUUl3ZFFheDhOZm95V0FZc1hVckNK?=
 =?utf-8?B?ZVR2ODVpWTlmY2xwUlE2UTgrUlVLRkJmYkhnV1FyelJjU25obU02dTNtenE1?=
 =?utf-8?B?TGF0TDZqRG4xbXJGNTBkZXg2Skxua3p3TU1wK2hyV3p4WU14dWdyUU96WFI2?=
 =?utf-8?B?RXNUbmNTRCtWdGNRcys2MVpHcEpIQlUwSUJhMnZkLzVLVlZiajVMU3V3ZjZO?=
 =?utf-8?B?ZDVraGkrT09IWEZzblZydFA5cUhhZEtvWmtJTDR4V2RkZExOcmdvRGFIdk1Y?=
 =?utf-8?B?WnhEZDBSQWxhSmxvYlpZK015Tnc0TDdFaytBeGZUdFQ4ZTlKRVJzS3dPbkww?=
 =?utf-8?B?dnVYaWlvM01wWHJzOXVXTjFuYW91NmVNZW13K3pxRERLbFB1QmpHSFBGRzVT?=
 =?utf-8?B?dkxhRGNWanRmQytDWERlelhUTXIycEtreHlJZkZpdWRQRFB1dTBWRHJxUmw4?=
 =?utf-8?B?RnlEQVFiQWJCYWs5Z2JRTDAyNWRHUTFOaWUza0h5S2M3bmxDZk1uV0lCUjNO?=
 =?utf-8?B?eXRScE9kQ3BGQXBpRXB1U2FJaGo4M0QwOWVPRFdWL0tTQURZUkJKZWVaTjNZ?=
 =?utf-8?B?NDFaeGRzQzJOSTMxeVc5WlhlRGliVUpoUm1rQzZORzd4Tk9HV01nRmxaMVI1?=
 =?utf-8?B?RUxIdDNqUVljS25BQkZjRnVFZXlyWUFCeVZ1R0dLUndsN2dkcUM3UDVXemhq?=
 =?utf-8?B?cUtKNDdhYjFYeSt4MkxPcndDd2lnSmNFMS96MVpVOG0ydUZvYnpwWk9OaHJk?=
 =?utf-8?B?Nk9vTmhlV0E1aFpzMm5FQS9jSDNnd0UzMU1haWtwWno0UUgvZXJjQUdmd1Uv?=
 =?utf-8?B?c1YycDJ2WlR5M09aeEwxMEVFc1h2TEh0azZuL2RFZEMwYTNxWmJZK0lmM2FF?=
 =?utf-8?B?Y1k1M1M0VUNlRTdXd0pnaGdsRE4zODlQYVRXK0Fka2FyWEJId1dLcjBGK1E2?=
 =?utf-8?B?WC9LS3JUMVJtbEhaWEk3dzNGSGFUV0puYzhyRmdWbVJTWEppNXI1Y1NWOTBQ?=
 =?utf-8?B?cmx2ODBxZmNhejhOMk45ck0rU1BxdmI4RThSVkxxTlRuUUV0bWcveFhJM3gw?=
 =?utf-8?B?bGtieXJmQ216eCt3NmpjRGtWVUJTWFFBaFNUa3pGdXFIbEcxWG11dVk1d3M3?=
 =?utf-8?B?ZGprdFJKVWgvTlQ2QVFmSG1UT2NkaGdsM0ZnM2RhK21qeUhGTkZRYnZjck9l?=
 =?utf-8?B?MlR5bXA4N3RUNWxmWENGMW1xdTJpSUdvUjZzZHJLV0x1NmszMGtaL1gyMnZr?=
 =?utf-8?B?cmFNVURJVmNKUU9IYmlyekRyTENKWExvZzVNWjJmMW9OZDc0eFUwSVhMNUpT?=
 =?utf-8?B?UVF3NmxBV05ZRGRkOWVIcW1YSlo0NnM0dlI1WVZnME85cnk4QUJkZjNnYjZz?=
 =?utf-8?B?Q0NUSWNtU3dUMTlYOWUyMjFHQk1mU01NQmhpRk8wTUpqTGNJdk9ieXVjUnFy?=
 =?utf-8?B?Y3ZPQ3dwOW80US82VXBrb2lEN1FFS0ZNR1dQTm5LZGxaTVBPWXIrVGZ6RlBz?=
 =?utf-8?B?L3F5dXN6RzZwR2xvbm9oZHFSSmc4TExoZC9RWVVUZE1VZkhsc3Y2U0h0NTV1?=
 =?utf-8?B?SUJiallJOTlrZ3ZrbXFnVWRPaXFkRS9IWVBZRDBVVkpBdzZ1MTQ5Q2hCK3BF?=
 =?utf-8?B?bVFoMFJKbkJYZldZNVVWNkZzNW4xb3E4RlNZNXdmT3VDZzdjNDNYN0hjR3o3?=
 =?utf-8?B?SHpFb2Z3c1VmUjA4dGx6RjQ5MUJoQ0xKcXNvOGVUZy84MVlQcHBHQTBOSUU1?=
 =?utf-8?B?d0ZETnAvUTY4bWh6a3QvTkRsNkErbTdHWXQxbzR5SnZNUGhZM1ErMzd2ck9a?=
 =?utf-8?B?QzVzV1Z4MGtvalhUcjhYSlowL28yWUhtcmorOEU1OEYyeTBhbVd1SlFYNWRa?=
 =?utf-8?B?andsNi82SkZ1Q2ppelZWS1V4QkZzeEVGekJ2K1UraU9vNGNNci9Sc3pKY0ls?=
 =?utf-8?B?MjUxQVJWMng2SXF0L0cvWGl5d3lncng5MGJ1MitIUHQ0UEJNeGp5SnBWRkI2?=
 =?utf-8?Q?Ur77vRSkKUELgfiLHCJdIgST4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sQw0d2R/4kXK8gFxVrllvMenlohL903dxhsTBiwYgw54d5bBlCa0woxdhW0O9uFbnIdW2lHImtUW/Gw1GDCrChxZZNPybG+ZH79lgJzutmO3AcS0lHdwtibcz1hEbIcuIKMuEhxnnZ6abJtbRMqiAwpVdVLT6nrtbiJsVeM2AhU1NGMOamTTcOxS+LjEDbGYKA8O8erp3Cr/gU+DXbQL+HtUoxVAgt2sTmzj10+bM8HkaubyH+DGLvNZfqrdSJCJqCRwRFqGZWtuRxXGgQjF8td95R04CtzBtoyynjNnxcTQQt70EHGJItVXXTfZmJqECCjZfZLdoQGA2yMv0khnUs19SEYp81GX9KQvrH/dg2EPJFgeZH7uh8qfgAtONdAlrhj4RKNSLx8v0jUnMIf33Eveu4l5XG0FBePqqZNi6UshVfX8LLzRppYtpEs4A+WoatdCsrAhsEE2PwgpLCmebah5ZkY5xSt3VZaojPqIlq9YHdbYYPLQpz0wIfAqO4kwUayw4VSkXJGfNysJk8D7AGMHEAV7IqeSbvaj5UzIcM9r0OQnlNkCHQ9Adeq7pauNuto2ViMe5EXs/4fmdTZDvjCVL0GZ+FA8CzyJNNfRzmyaZ4JzFdGOYSifV4sERrSZJQl3EXJpTNTHJEOrbVPPFJ4Am7dz3Wj/lh9CWMQ7zOqwYC6DmunWChXhFh3fAWFQ4DzJVuMEtbSlECmfLVk/yVWR78WmAXYcvtuWdxC3P6qLZefUOuqWTxp00YzuMUG3dxfZp4WJ/SwCkHGLVoX1bRQ2abHlu9SoxMtJo6ETCQRcoz7pXgMGGQIPYsLWKGUq1yg+3rT0JFRPoV/9jENqFV0AB4ffZYuLrQyzNLIJWuo=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e88ea3-9595-4c58-4c31-08dacd69c82f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 15:45:44.1711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GJU/zOriBRiTh0AE8G8o3GOpcn2XGN3AdFx4Ht8iBP1f9mSJUaoOi2SaGnjlmevoIcs6XOOAKc8yABYEYCC6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6935

Do not unconditionally set a mode in efi_console_set_mode(), do so
only if the currently set mode is not valid.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/efi/boot.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index db0340c8e2..7e8a8b7857 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -799,6 +799,11 @@ static void __init efi_console_set_mode(void)
     UINTN cols, rows, size;
     unsigned int best, i;
 
+    /* Only set a mode if the current one is not valid. */
+    if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode, &cols, &rows) ==
+         EFI_SUCCESS )
+        return;
+
     for ( i = 0, size = 0, best = StdOut->Mode->Mode;
           i < StdOut->Mode->MaxMode; ++i )
     {
-- 
2.37.3


