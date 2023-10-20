Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4407D0DED
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 12:53:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619752.965341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtn85-0005k7-Po; Fri, 20 Oct 2023 10:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619752.965341; Fri, 20 Oct 2023 10:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtn85-0005hK-MS; Fri, 20 Oct 2023 10:53:21 +0000
Received: by outflank-mailman (input) for mailman id 619752;
 Fri, 20 Oct 2023 10:53:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUGB=GC=citrix.com=prvs=6503d4fc7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qtn84-0005hE-ET
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 10:53:20 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dede1b06-6f36-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 12:53:17 +0200 (CEST)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Oct 2023 06:53:13 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6680.namprd03.prod.outlook.com (2603:10b6:510:b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Fri, 20 Oct
 2023 10:53:10 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64%4]) with mapi id 15.20.6886.034; Fri, 20 Oct 2023
 10:53:10 +0000
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
X-Inumbo-ID: dede1b06-6f36-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697799197;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ae+3Ko+N+5j1OqAl+d58iU2DSWFkvgdyt833uP8mJ0g=;
  b=WXZXd4uMoCM6O9aCnoemvUqu6Ul2NEOgz2o0k0+FEZBtI+N0GAUJtJN+
   /XipzIocquidqVdkjYVYWGEsFzY3/xwI0lrNQL5dCXb7eH3iKekn6cVMU
   qkP0J98aqaraxrH8bhYiwPMMFtkTLd2BmLceKGJiJXqP6RSrcgwam/Ovh
   4=;
X-CSE-ConnectionGUID: riK9FppMQ2S9ev7zAHLVLg==
X-CSE-MsgGUID: bLbIQiO6SwWnzCkOQoSVBA==
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 126600140
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:NkLmMKqdyg2tv/72pxru3lu46/xeBmLhZBIvgKrLsJaIsI4StFCzt
 garIBmEOKuNZmr0e9F+Povn80sP6sXcz9VhHQtqpXgyEyoW8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GhwUmAWP6gR5waGzihNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACoMTUGtn/qT+eiAG+Ry2dYKDO3VGIxK7xmMzRmBZRonabbqZvyToPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeeraYSEEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdhMSuXgr6Iy6LGV7mY3AjwvVHzlmuaGjFyVWPVmL
 Hcq0AN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19KqQrD60ETgYKykFfyBsZRAe/9DprYU3jxTOZtVuCqi4ipvyAz6Y6
 y+OhDgzgfMUl8Fj/6m2+FHvgjSyp4PIRAo4+gXWWG2+6gpzIoWiYuSAyVXd9+cGE4+fQXGIp
 n1CkM+bhN3iFrmInS2JBekIQreg4q/cNCWG2AA+WZ486z6q5nivO5hK5y1zL1toNcBCfiL1Z
 EjUukVa45o70GaWUJKbqrmZU6wCpZUM3/y8PhwIRrKiuqRMSTI=
IronPort-HdrOrdr: A9a23:JKlE6aMlOHg/lcBcTkyjsMiBIKoaSvp037BL7TETdfUxSKfzqy
 nApoVn6faFslsssQ4b6La90cW7LU80jKQFhrX5Xo3DYOCOggLBEGgF1+TfKlbbehEWmNQy6Y
 5QN4JaJOLdNmVTtPDfzDSRPv4c6LC8gcWVrNab5XJgUg1wVql42SNUNy7zKDwVeCB2QbUfPr
 qwj/A33waISDA2aceHBn0INtKzw+HjpdbDfBZDPRg68wOD5AnYk4LSIlykxR8QXDNEhYoz6G
 StqX2C2oyz9/y4yhuZ0XbP75JQgrLau6J+OPA=
X-Talos-CUID: 9a23:RV+0Fm8O8PTD3WdeIv2Vv1QVOZELamX49S3rckKmVnRAaJmrbVDFrQ==
X-Talos-MUID: 9a23:uhXyMAmZr4lRcIxYKV79dnpoEM1J2qWJVnsSrpMUkMqjDCtLBR202WE=
X-IronPort-AV: E=Sophos;i="6.03,238,1694750400"; 
   d="scan'208";a="126600140"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtYHY6c3TWJ93UAnstcVvUDi+SOb81SAQs/kx8YMRUFBUsgcg9b1D0/kbODd3KRetwDkKgtmL6yScnzJ+w5zZ1DLfCKTxPmaqMIcrpEvZyQD5bnuUwuRulqDWBKwT4gg69E12pX2dwUu6wN8IDJOk1MVWzI6ogV6KBFPjXoRMv0ck0KegBXKQUAHINAcXjNeN31QbcjqSsk9hZhvt2cGmDTbUbL3zDpp8NfH2CwtLhwDSGRlCHSLeSDQ4TY4vjEMlPicK6dgjV1mnRscbY3HVo671PxmhNvWWAz1A8A/+7yke8k8FWdNLGx/mqv+XptP+HRi2Z8sT3eO7O/W3zOmNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7WBWg0w4CiKSxgeFcL0cfjpZ9HsA1QZTElgoVPM4tA=;
 b=ko1r4Q9SrdpoFa6n5ajWKIufVnDb/0oaN9mUKn69t2LCzR4KPhVo3+I1eluAkSyMK6SRtQK9eKih5e0PLHZiHDvYh0aaLNh5XEFcGefmXYxy1tQiOj6qcl/Ov4nD9HtpSCpM+tkefZcOqUqmDEb0xRnYXEHcUUy14LLV/QKKPpPZPXwlNS5HaPvP+YGQAtcjPdnRRwr9LWkeCsVcGMObK1n5BQIW9B9gIOIOPIlqH0sbgEXLhxh5k2YSXvEulSWPprEA7fE0VOpbqjUZHhHHlElqYZ5u3tLwWywUzMaWpbf6N1MNNJ3RV5kDaLvmJIiddg+VQ39k/KzFPisf4lU8qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7WBWg0w4CiKSxgeFcL0cfjpZ9HsA1QZTElgoVPM4tA=;
 b=KPovnaMqSLGAENQ4fwE/+8z7dCEzFEIRjCy4rMTNm7ZWA55GH06LVZQP6lJ4UlnNPsmOIiSloSyoxuQyD4KRjFbCJVAtUnrF3bluAtCZ4BpUyPz9YNeZh2TlmkyhYYApWELrrpMxGpgYJa/vKDxHcCpjy9R26Phqg+xBLtokyx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 Oct 2023 12:53:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v4 for-4.18?] x86: support data operand independent
 timing mode
Message-ID: <ZTJcERG9yD8ejHFR@macbook>
References: <34aefb5f-252d-2992-c561-a73941429c4e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34aefb5f-252d-2992-c561-a73941429c4e@suse.com>
X-ClientProxiedBy: LO2P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6680:EE_
X-MS-Office365-Filtering-Correlation-Id: c7864b72-8736-4f63-4da9-08dbd15abffb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yw49pq2Qzatizy3jTFbOJbtlGBT1OcY7PLMyLsdk24M+JmIindZr9DXdP+9t/V6aZJfMsMyItBUYip+E+H0VROuv0u2b5WjiJAgHYHEXBrEpIp16fuTg7QPVp6pH6FJc8zS0lREsKzQhvIhhBHJfEmysoO0V4rEFF+S4wPci6Ggb5iqRKZ3NFeLH1k0JevRtgUh+Bc/oamlRTDqzNCFzPvqf6KrvIm4gPVyRo0RzfyiyCnOOsQKFgEWSV4Jt2IUDPJXTmIPxkCXTpe+GSy9FZw0FQ4b7QlXkI3fWGOPD0oeq4WY673Mf4ljUKy0KonpjBb0blwTCUbDgdi4w1oIUhAJ2J3xsMItMFdlHy0/J6Kqrzxw1mNk5wn1WMZrsQiWW7j7ex6Np8GJrBG6z8qSRkh6aYbbbn+/jkjyzdzjybeUN1zKFlJ5bVPu4sS6FaaPLDjzT00zuNPOK+zEEyzAbJ0H08Qj22TFxxxWbmh6C/U32eMdp1dsx7XYZ/dgN/wJT5kp1QAjZhKIpGp8gsuKBy95TBtBLqUT914V37LyvTkY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(366004)(136003)(39860400002)(396003)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(85182001)(86362001)(82960400001)(6916009)(26005)(6512007)(9686003)(6506007)(38100700002)(66946007)(83380400001)(54906003)(478600001)(41300700001)(66476007)(33716001)(6666004)(2906002)(316002)(5660300002)(966005)(66556008)(8676002)(4326008)(6486002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmRmOXE5RHFhUmRzY21RTUJJdFhmVnFUV1hJaVJRb0NQY3I2SG1VQnpRcTZH?=
 =?utf-8?B?YjJJbzF4UjdiLzRlWDN2TVNMa1VTT1dYdVJLY0tvSGlrZU1wdmVCbUtIdStP?=
 =?utf-8?B?WmVUeWMxRm5wbnNCaElaRVRHRGNzRzhKams0STJxenpveS96YlUrN3RGYkJY?=
 =?utf-8?B?T25aemh0aktvWXFIWFZ5dHEwVlFXcm9MUCtkQjJEcWhJWkxNRFBIZTZqUHRp?=
 =?utf-8?B?SlZSanFHTS9ma01rMS96d2oxUjFKeXB4bjZmdG14emQrQ2ZHakt0eWRkY2hr?=
 =?utf-8?B?bXh6cFZ1OGZacytIK2pndCtQd04zZ2I2VUdmNmNLRi8wdkdrZW9iSjQ5WFJM?=
 =?utf-8?B?SE5CZ3QrU0s2OFhjM0xCZXBpQjd1VURhUkZTK0pBUnZyMExSeVBRTEUzQlBH?=
 =?utf-8?B?MzI1bTBEM0FHejhtU3JEaEI5MUFpWlVNemxXMnYyWi9McFlGL3BCb2dGNGZI?=
 =?utf-8?B?TlRZUEJNVUI5ZXYxQUhBRTB0aERzN1d6M01jQ3BkcjFrOEY2RE1jMWx6d25I?=
 =?utf-8?B?dGg1Tm9xTWtaTThtbDhyRkIrNHM3YXVzU2NleTBKQk9vYmQ0aHRRa1JxeDZQ?=
 =?utf-8?B?ejMzSlEyTU1zdlJoRUtCRUc2VFlNblhHeFdqMEczZVkrNE9NRVdIaUphV283?=
 =?utf-8?B?c1Z4aUdVUjM3MVBubWpJeEppbGNZVUNPNXcvd1NVamRBRUxDVGpLTEVBT0Fy?=
 =?utf-8?B?bHptcC96ajFBaldQbHo2bTEvRkp1RVBZakJ2OCs2bjRTOWVoZkh3aGwyaE5o?=
 =?utf-8?B?aFJPck9MY3ZwLyt5QXF2eG1JVFFaY0dkdTZOMW9NMlIwQzRQeEhpK3RTOGtt?=
 =?utf-8?B?SWdsaHRCRnNwVCs4WXdRMENrd0pHdHA1S3czdGNIVFJlQjFsQXUvWEFPeStL?=
 =?utf-8?B?SWRXam51Ti9oQmI4dEdPR1NHeTN5a0d1RlRqSFRubEZ6ZHVhNVVBTHRKaHo4?=
 =?utf-8?B?amV0b09Dc2l6azkwT2Zzemxibkc4eFJFMkNtVmJ3MGhiZWdOWWlIeGJDZE1w?=
 =?utf-8?B?SWpPUmorUnJVL3h0Rm9uZ2JMQlN1YjI1Um5WbGlhYmdrTUt2ZzBlZ2RmdE51?=
 =?utf-8?B?ZERuL0d6VUFiQVhCTlB2aW1oNTlzSGRIOFhiWStndStyUWljaVQ3QWlMKzdy?=
 =?utf-8?B?K0NSaSswcmI3QUUrSFEzNXY1dFZ5RHN6aFJyMjVzdjdNblhFWGQzSGRXTkdU?=
 =?utf-8?B?aldIZTBtSU1LdDY5RmdXaWF1d1N0RDNIUllzclVHb0NrRTFMWGRxMURnRHRa?=
 =?utf-8?B?MVpwRGNuajhGOHpjYWUzSk1BSlFJNXUxMEJRZHhTY2VwSFVNenlnMThpWmFN?=
 =?utf-8?B?RkpFalpSTTBnU2h1eWJmSFl0TjVKbFNxSnQxWUtRZzY5ay94cVJPaTZhd3hj?=
 =?utf-8?B?Ly9GaUQ1VTVaMUtodGF4NjJGakNSR2hqVTBBeUNQelhyMWg0dTNhRW1vNVEz?=
 =?utf-8?B?YlByeEV5Ky9XSk1HeWhzNTN4aHRMUU1UYitmTE5kTTRPZllRMzIzaEhtOGZ1?=
 =?utf-8?B?WWYwZ1Z5UjVwNExtR0VRYVBzUEdyV3FrcnpKRmdpaVR1b2ljaGk2aDlROWpo?=
 =?utf-8?B?VkUyZm13WkJWdjByYjkvVzVsRE93YnJaMzh2NFNuc1NuZUlid0RTelZIRXdP?=
 =?utf-8?B?UUU0TEY1elJSTjhqeDNBNGwvNVZQb3hQcHRkMXlldXNFdHJaSVFFRUI3WXp1?=
 =?utf-8?B?Zi80YXhrT1J3Mlp1aUxaQjVsRS90Q0lMWFJDNVh4K3hScmRIYjVhZ0xqMXZ0?=
 =?utf-8?B?SFZwQ2RmNi9iTkVyd1FWbnB4cUZRcW9zVE1YTGZXa3RJRHB0ZnZWeUhCcEph?=
 =?utf-8?B?ekZzanZNNXg5T2V2Y1RjeVNMZWl5WVhDTXlyWG9nUFZ2Z1hXM2hMY3Y2Q2lr?=
 =?utf-8?B?Rm9WNm53eVVhMXVlSEF2U2pMeFVkeElJbFBMaFUveDRvY3cwTTE0NnlTTjYx?=
 =?utf-8?B?NEJnOUJoRjhNY0lHejN4THB6Rll1eXNaQUNmTHpaZEJqTkRCU3Q4N0tKK1Bx?=
 =?utf-8?B?ZElQYWllcWJBSGhpY0d5bk1oMWcyUTNESDdpZ1Joby9rQ01TYmdYaUFPNnNH?=
 =?utf-8?B?N1pUNzl5VmVlWGM1M0dJYkFvTGFFZXhIZ096NmdLTkRCK0xTVDVDemJlV3VX?=
 =?utf-8?Q?2tkN2+Xcj/wtaO8ahN4Q8Ry/I?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?aTZqdUYzaldEOEwyakw2Y04yNm1CcFR2cysxV1I1SjRYa2pTTytyNmNVYU9F?=
 =?utf-8?B?V05DRTUvWTFsa1VLbTJPd2RTSGpoM3FkZ1hKcTl3dHBQdlJYcFplWVE1ajRq?=
 =?utf-8?B?ajFkZDFkZWFOTVRtRmdhenRXQk92d3VCM1JrV1cwcTFZTE9HNFFHWkFxY0xx?=
 =?utf-8?B?OFNBSW5lNWlFWlI5VXR2enVjNGRNT1JsKzBsZ0NQUkNwRXJvL0I3dUticmpJ?=
 =?utf-8?B?V2dtSXUweXIzUjBFTmZLeFpYdWR4QUp0WSt4TGY4NDFVMEhZWDh6VURNNmFs?=
 =?utf-8?B?SDZEZGt1WHpjYWNMUGoyY2NsQTFlQm9DTDNwWFk4VVhoanNJckRkamxmclZL?=
 =?utf-8?B?NGIwL0RwczZHcHRGSzhZaE9hM1JBVWdxeHhxVXJ1RitCWnU4WnZ0UjYwcmt6?=
 =?utf-8?B?YkdTSFRNRkh5NGhyWXM5ZDJnZzVldjRIdFRxYUhoSEdjY0ZwbWQ1SkMxSGlM?=
 =?utf-8?B?UlI3bW5wR1pXZlBXL3p3RmVsVy9xVTd4bTE2b1F6NEtyRU5pZ3FiNVVOeUNk?=
 =?utf-8?B?ZFpWdXE5emladDlONldQa2MzWlI2TEpuaG93Y21GSlFWQmFBaWx2cVdwQ3N6?=
 =?utf-8?B?RWdDa21RV0pnUng3V1FPa280MGR4Mm56bE9KMW84U0xTd0VoT2J4RlhWSXdz?=
 =?utf-8?B?cGs1ZjI5OU43bHM4Tys0RDlnVXowVFFUZzhjS0JOK3F2dnFlVGF5Q0N2WkVv?=
 =?utf-8?B?QllpeXl5Q1lQYURqSkJlVGFMeHJLd1U5cWZpb1BYQ2Y4MVYzM3BXNHhOaSts?=
 =?utf-8?B?akFOekcxMFpxUzhYQnhZOUFQWEdXYVJIZUV6L3laU0dUTTg0ZHU5MmZ3RmJN?=
 =?utf-8?B?akVmWjBISDlzZFFyTUFZQUVBbUdLcUZQN1NmVGtkZW5RTWwxZDNIYitHZTRM?=
 =?utf-8?B?RHJLVzZRUnc5QVh1azBraDVMUWpST3F1bXdGNnE3anp6MEhyM1VxTkdqbVJI?=
 =?utf-8?B?d2FQU0tjWGFPN3QvTUJVeTlPUlZXWEh0UkRiQmNOeXdJS09pUnlYaGNBbGFW?=
 =?utf-8?B?eDNLT01NTUM4MXNsTnY5Wk5XQ1dsa1FYbUlKT2p5dFczMWdaQW1tSnh1QVBh?=
 =?utf-8?B?SFhlZ0pTRVl5RlNFK3R2anJoN0UrTktMdklQckNoOTA0aEx2bWxhWUcwVzJ6?=
 =?utf-8?B?UUtYMzlEc3cvWTNKR3RpaHE0TUJCMGpGSTNKaWdEODh3R0NRMHp2bXRZbDJC?=
 =?utf-8?B?Y0xFY3BMYlJoOFdFdUdTTkNKNm90N2ptbFg5K3Jod3FOK09qZnhoQU04a3g0?=
 =?utf-8?Q?/ObWZJkIqlOZA/e?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7864b72-8736-4f63-4da9-08dbd15abffb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 10:53:10.4454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4MmFBX6OmoR35M1b0cTial91DLroufAMKArwDIKCi12QFGziI2iQLKZjWucmh/mPkHBk6KCyYPwUcrweqbgzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6680

On Fri, Oct 20, 2023 at 07:53:51AM +0200, Jan Beulich wrote:
> [1] specifies a long list of instructions which are intended to exhibit
> timing behavior independent of the data they operate on. On certain
> hardware this independence is optional, controlled by a bit in a new
> MSR. Provide a command line option to control the mode Xen and its
> guests are to operate in, with a build time control over the default.
> Longer term we may want to allow guests to control this.

Couldn't we just expose DOITM in MSR_ARCH_CAPS (by setting the A flag
in the feature enumeration) and handle accesses to
MSR_UARCH_MISC_CTRL?

The complications would be with the leveling of the feature across a
pool, as AFAICT the bit needs to be OR'ed rather than AND'ed across
hosts.

It would also then need some special handling in order to allow
reporting DOITM on hardware that doesn't have the feature (and writes
to MSR_UARCH_MISC_CTRL won't be forwarded to hardware in that case).

From an implementation PoV we might want to treat this as SSBD, and
allow Xen to run with the guest selection.

Anyway, likely much more than what you want to do

> Since Arm64 supposedly also has such a control, put command line option
> and Kconfig control in common files.
> 
> [1] https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/best-practices/data-operand-independent-timing-isa-guidance.html
> 
> Requested-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

The only concern I have is with the Kconfig and command line options
being named DIT instead of DOIT, which would be what I would search
for given the documentation from Intel.  Maybe that's for unification
with Arm?

> ---
> This may be viewed as a new feature, and hence be too late for 4.18. It
> may, however, also be viewed as security relevant, which is why I'd like
> to propose to at least consider it. Note that already for 4.17 it had a
> release ack to go in late; just the necessary normal ack continues to be
> missing.
> 
> Slightly RFC, in particular for whether the Kconfig option should
> default to Y or N.
> 
> I would have wanted to invoke setup_doitm() from cpu_init(), but that
> works only on the BSP. On APs cpu_init() runs before ucode loading.
> Plus recheck_cpu_features() invoking identify_cpu() takes care of the
> BSP during S3 resume.

As I wrote below, we do not seem to be very consistent with where are
such setup functions called.  Would be good if we could unify all the
CPU initialization in a single function, as that could avoid
confusion, and mistakes with forgetting initialization in the resume
path.

> ---
> v4: Re-base.
> v3: Extend command line doc. Add changelog entry.
> v2: Introduce and use cpu_has_doitm. Add comment "borrowed" from the
>     XenServer patch queue patch providing similar functionality.
>     Re-base.
> 
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -33,6 +33,8 @@ The format is based on [Keep a Changelog
>     nodes using a device tree overlay binary (.dtbo).
>   - Introduce two new hypercalls to map the vCPU runstate and time areas by
>     physical rather than linear/virtual addresses.
> + - On x86, support for enforcing system-wide operation in Data Operand
> +   Independent Timing Mode.
>  
>  ### Removed
>   - On x86, the "pku" command line option has been removed.  It has never
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -788,6 +788,16 @@ Specify the size of the console debug tr
>  additionally a trace buffer of the specified size is allocated per cpu.
>  The debug trace feature is only enabled in debugging builds of Xen.
>  
> +### dit (x86/Intel)

Why DIT and not DOIT?  That seems to be the acronym used in Intel
docs, and what I would use to grep for in the command line document.

> +> `= <boolean>`
> +
> +> Default: `CONFIG_DIT_DEFAULT`
> +
> +Specify whether Xen and guests should operate in Data Independent Timing
> +mode. Note that enabling this option cannot guarantee anything beyond what
> +underlying hardware guarantees (with, where available and known to Xen,
> +respective tweaks applied).
> +
>  ### dma_bits
>  > `= <integer>`
>  
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -15,6 +15,7 @@ config X86
>  	select HAS_ALTERNATIVE
>  	select HAS_COMPAT
>  	select HAS_CPUFREQ
> +	select HAS_DIT
>  	select HAS_EHCI
>  	select HAS_EX_TABLE
>  	select HAS_FAST_MULTIPLY
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -204,6 +204,28 @@ void ctxt_switch_levelling(const struct
>  		alternative_vcall(ctxt_switch_masking, next);
>  }
>  
> +static void setup_doitm(void)
> +{
> +    uint64_t msr;
> +
> +    if ( !cpu_has_doitm )
> +        return;
> +
> +    /*
> +     * We don't currently enumerate DOITM to guests.  As a conseqeuence, guest
> +     * kernels will believe they're safe even when they are not.
> +     *
> +     * For now, set it unilaterally.  This prevents otherwise-correct crypto
> +     * code from becoming vulnerable to timing sidechannels.
> +     */
> +
> +    rdmsrl(MSR_UARCH_MISC_CTRL, msr);
> +    msr |= UARCH_CTRL_DOITM;
> +    if ( !opt_dit )
> +        msr &= ~UARCH_CTRL_DOITM;
> +    wrmsrl(MSR_UARCH_MISC_CTRL, msr);
> +}
> +
>  bool opt_cpu_info;
>  boolean_param("cpuinfo", opt_cpu_info);
>  
> @@ -599,6 +621,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
>  
>  		mtrr_bp_init();
>  	}
> +
> +	setup_doitm();

We do not seem to to be very consistent about where features are
enabled, we do seem to have a tail of features that could also likely
be part of identify_cpu()? tsx_init(), update_mcu_opt_ctrl(),
MSR_SPEC_CTRL.

>  }
>  
>  /* leaf 0xb SMT level */
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -202,6 +202,7 @@ static inline bool boot_cpu_has(unsigned
>  #define cpu_has_tsx_ctrl        boot_cpu_has(X86_FEATURE_TSX_CTRL)
>  #define cpu_has_taa_no          boot_cpu_has(X86_FEATURE_TAA_NO)
>  #define cpu_has_mcu_ctrl        boot_cpu_has(X86_FEATURE_MCU_CTRL)
> +#define cpu_has_doitm           boot_cpu_has(X86_FEATURE_DOITM)
>  #define cpu_has_fb_clear        boot_cpu_has(X86_FEATURE_FB_CLEAR)
>  #define cpu_has_rrsba           boot_cpu_has(X86_FEATURE_RRSBA)
>  #define cpu_has_gds_ctrl        boot_cpu_has(X86_FEATURE_GDS_CTRL)
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -56,6 +56,9 @@ config HAS_COMPAT
>  config HAS_DEVICE_TREE
>  	bool
>  
> +config HAS_DIT # Data Independent Timing
> +	bool
> +
>  config HAS_EX_TABLE
>  	bool
>  
> @@ -187,6 +190,18 @@ config SPECULATIVE_HARDEN_GUEST_ACCESS
>  
>  endmenu
>  
> +config DIT_DEFAULT
> +	bool "Data Independent Timing default"
> +	depends on HAS_DIT
> +	help
> +	  Hardware often surfaces instructions the timing of which is dependent
> +	  on the data they process.  Some of these instructions may be used in
> +	  timing sensitive environments, e.g. cryptography.  When such
> +	  instructions exist, hardware may further surface a control allowing
> +	  to make the behavior of such instructions independent of the data
> +	  they act upon.  Choose the default here for when no "dit" command line
> +	  option is present.

I would word the last sentence as `Note the build time value can be
changed at runtime using the "dit" command line option.`

Thanks, Roger.

