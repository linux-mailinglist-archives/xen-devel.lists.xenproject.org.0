Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5FB62C4EC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 17:42:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444349.699457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovLUf-0000Bt-Iy; Wed, 16 Nov 2022 16:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444349.699457; Wed, 16 Nov 2022 16:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovLUf-00008g-Fn; Wed, 16 Nov 2022 16:42:33 +0000
Received: by outflank-mailman (input) for mailman id 444349;
 Wed, 16 Nov 2022 16:42:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NgR=3Q=citrix.com=prvs=31293058e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ovLUe-00008a-4I
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 16:42:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8454c21-65cd-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 17:42:30 +0100 (CET)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Nov 2022 11:42:27 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6459.namprd03.prod.outlook.com (2603:10b6:303:122::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 16:42:23 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Wed, 16 Nov 2022
 16:42:23 +0000
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
X-Inumbo-ID: a8454c21-65cd-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668616949;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=OA2UOlmEK0jhWbsT7GVJWWYil+xhxHaqWbkLy+dxszc=;
  b=gXsE5MG70VsLELGHgdIjkOaU8dt08T/KOoxr5FopZZXBKhOEqYA6p4w+
   zspSnaCrrX5BZD68Q+oJLa9nKVDrP/TD5O2BDMby3glCoYSu84iguAiub
   /MsQ7+scbClaFkJFG1F5U1K72ndDRWRLgs6H024d6AxMaXjbuVBXwSl09
   o=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 87497199
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:X4kcq60PncS+gHjB0/bD5fdwkn2cJEfYwER7XKvMYLTBsI5bpzcOy
 mAcXm2Ea/fbazfxfop2YI+29R4H68WHzoBjQFY+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVnO6gR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfE2Vg+
 /w+LT83chm4q/rtnZ24Fvl2mZF2RCXrFNt3VnBI6xj8VKxjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxpvS6PkGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iLz2r6QxHKqMG4UPOyY9fVBokGv/WUoODI9VFDjkfaFlVHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAGRDNcbN0ttOctWCcnk
 FSOmrvBGjhHoLCTD3WH+d+pQSiaPCEUKSoHenUCRA5cud37+tlv0lTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPuZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:sMDnXqixb2LVCl4n5Tb2EX8EU3BQX6523DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK/yXcT2/hoAV7CZniehILMFu1fBOTZslnd8kHFltK1tp
 0QDpSWdueAamSS5PySiGfYLz9J+qj8zEnCv5a6854Cd3AIV0k2hD0JcTpzX3cGMDVuNN4cLt
 6x98BHrz2vdTA+adm6PGAMW6zutsDGj5XvZD8BHloC5BOVhT2lxbbmG1zAty1uGw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69B7icbs0dxKAe2Lk4wwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86isIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRu9jWH4qcL0aTomA44Z7LgpBCfx2g4FhpVRwa
 hL12WWu95+Cg7Bpj3045ztWwtxnkS5jHI+mao4jmBZU6EZdLhNxLZvi399IdMlJmbX+YonGO
 5hAIX14+tXS0qTazTjsmxm0LWXLwcONybDZnJHlt2e0jBQknw85VAf3tYjknAJ8494Y4VY5s
 zfW54Y2I1mf4szV+ZQFe0BScy4BijmWhTXKl+fJlzhCeUuJ2/NkZjq+784jdvaNaDg9KFC1q
 gpbWko9FLbIynVeI2zNdxwg1rwqVyGLHvQIpo03ek7hlX+LICbQRFrBmpe0fdImM9vfPEza8
 zDRK6+PMWTUlcGYbw5uTEWe6MiW0X2A/dlz+oTahapnv/hDLHMm6jyTMvzTYCdYArMHFmPSU
 c+YA==
X-IronPort-AV: E=Sophos;i="5.96,169,1665460800"; 
   d="scan'208";a="87497199"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXZpNs3dEAqCL4OVsYaTDmbg9RqX2OX3kEB3FIiDHpELblIyeBd55rm/oU2G6wsM1rzBWs8kpspAUL+e94V4Rv+XiMGv1sz9aXEPWis2Pbu+KM9ZTubJkXgjk6hfqtVM9xnUn/DUx16l9AG+PX1VyQ/CWQEH18IeN1cF/4dVamsua+KSl5stBYeMMI1yZxvWQPysk4ncIwpkRsukiqEVulYg3Fgq2+TlSx/YzXezwZcLcDsHD1dKkq0vw7N5/xYdvvZIaEDqMemfWkQPVhUV7VWPR8G7X1YNUAMqzTXCXTCsXUBW5DtUIvodbsZNNkXP+KZgqctQX5NfAH7YsNm86Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFM5IxYv79F1URZqdOEl6KHRKVswx03RtDforc8iMsw=;
 b=SnzpgapDV34Qrdq04llGxCjAb4thEal0l3q9ji1ohBDUiF03l4aAr5813X6OASdM9YlVsIfhOQnNaHr3QTv1rfE4W3k9NzXzDAhv3dGUD7S7vIqNNkCmED2hfPDql5ZvsSBoi4aTRJ52LM5tcUsIx5ID3HYnOSmLVX80Obuhz/O/0bNQPhwFKupz4wblz+gAmZyfgzQ3VOsIdvXPK5YeAR9x7g3a+jQOnkUbnMYnpEi66JorKVFWTNu3w3dUaWEQaqeUdebhCfSwvxW7PcfCeJdczkej/1bAK2zu5xzSTkMyBTCWaM19klDMUOK20D+rzlwate1b68bHSZ1hY6TN4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFM5IxYv79F1URZqdOEl6KHRKVswx03RtDforc8iMsw=;
 b=OMIHJL2YP0LdqShSRXMAbpoJhkYgnYhjzDfe6I/p+rMr+rXi+2TdgkyCn70x28EliY23dVgrAdU6lEQYgcyzriHCN4BR+V7D3Ylbo2JrhDiHpjkrIkVQ2P1qIe6m1fINUxq+FtA7tdnoh8ZQAUAKyGBkblb+c8L9f5/bD4kvqOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/pvh: do not forward MADT Local APIC NMI structures to dom0
Date: Wed, 16 Nov 2022 17:42:16 +0100
Message-Id: <20221116164216.7220-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0364.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::9) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: ed775fcd-fe09-4301-f07e-08dac7f18933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X7tJmPJ8QTMiVdpgdBB+2K1wc8fwHZFdjl37V5D9h1M65TWyrHwwVU13zdaC/8C28gBJxIcTZEtOV2oTkdQXRlV/E//VJSK/JU7gZmZ1mLg+Vz0p9779qCdPg57ibj4STgFLr3rN6CRAjRl3AWUp+ihdZGVEgwk0ZaloNVO5uksVOYuKXEc0L47b/lbEOZGjMJurKdXhdOCtap+0YaIPPUSNQdNlab3p/BLdYdF32Tgn8HiMrOxqVs3pIbF9/Q+11XDqdl+SeqGsh5zoRagoD1ApE6C39Crg0VbVaKi9/oiV3graAtUX3NanHrAM5JCWKimBoRzdG7K4rdxHLnzwakKUX0K+mnUy83hO6U9x39hTy9OKRQgSjsdIArGuCHf7FDCtCaKLJIYk7GhWhx3nfmD++DWZMjVTX7HII6QMo/rn9lrFXgp03G6aLcRXfjAAXo9Z03yl5kuhCNSjm5r75GXCXIT0FBmzofgH7KVzrrJJRcoAvvs5mX4WCj+96SYiwMaZOxNL5aUi70y/8X9fezOdPTwJKKzD+e1IzpgGniGzgEhRcZ2SQt0ukfGLzzGVlVvGeT+GXg+mOsUlJ6aH+t6v1K7SuO7E1FQ4ZjpFmrDqvVluvBrUxCbw9TNUqcFb7Q5fbr+aeAv6Y4FUVEQrXPZ898l23ztfAhKW7QBnduUc+MhJHkk1BvCfN2/XBlo30+6lBhhCttyKyLUzyui8Wg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199015)(83380400001)(2906002)(8936002)(82960400001)(478600001)(38100700002)(186003)(5660300002)(6486002)(1076003)(2616005)(6916009)(54906003)(316002)(8676002)(66556008)(86362001)(66946007)(4326008)(6512007)(26005)(6506007)(66476007)(6666004)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWVvdkRSYVp4TTJYbmV5M3ZFejJ4TE1jL1pqTnRjOWVaSjRoUEdabzFUMTRP?=
 =?utf-8?B?cjMyNXJJdDFjN0lMUXpZY2s3RWtQcGZRRXFqY0hBMkw4Ukdsd1BWM2RBLzdK?=
 =?utf-8?B?eWZWeWJwWTdzTGxkN2JjQlg4aEp6cXBhOUlDNnFVYU9VVGJZZWRyZGZ0Y3BS?=
 =?utf-8?B?UGJ6WmxUZ2twSCtndHlSNUJQMEZHVlVGZGdZTmVSaTlUNFVUZzYrWEk5N1Vp?=
 =?utf-8?B?N2JHRnN6Q3hEZXdLeGVDYXJtNTlveW1MR1JEaFBHUHRmNkpocU4raEJ4OUd5?=
 =?utf-8?B?OU53enRyNTVSTGkyTVNNcHlKbmhCTVo5ajErR2xZdHVtQk1pdEwvUlM2aDJ0?=
 =?utf-8?B?ZVNTUCtwMkVBTk02dXAyWkw5TjR6R29IajNJbVBxUXdkRmN4MnBxVUxHTS9D?=
 =?utf-8?B?ZnArRjZEM2c4cHZXbmV4ODJkS1V6aTNabjM2VkowRXorL2Y4cjlJNkh3NzQ5?=
 =?utf-8?B?QWxldG5SbTU3Rm90dkFrMU9GR1Mzd05iaXR0UkpMRDFrUTMvZGVvWTN4Mk5F?=
 =?utf-8?B?YU5jdUJXRVhJN1JtdEpnbFJQVG5iM2V0aGlhaWsxeWg5TEdidXM3RWJKeGgx?=
 =?utf-8?B?eEpNU2RkWVZ6UHpINHlJdVpFZk9KYXlZd2ZvU0FLcExhRE1qUVhicy9LU3BJ?=
 =?utf-8?B?MDhQT2dHWkVSWUFZQXlOcTRPZ3BudFJCaERQVkJ6MHRIaGxLbGpyRE1xWndy?=
 =?utf-8?B?UWthcmRNcyt4REdzZ2JiUTJ6Z2pUemx1cndkcUZZdytRRmVmNU5QUWJ4NnpU?=
 =?utf-8?B?eE9CR0lzWUNSOFZ3SDNIUHBxMCtJS2l5YmJnR3l0OHB2c0FJOUtZWk5tb1M4?=
 =?utf-8?B?ZVY0RWFkazBKVGtKR3BkZUFNUUtPWGRISk5nZFlaQlVSQ1hBd2tIWG9GRjkr?=
 =?utf-8?B?YzFCdk5ueGtReXFwWDFQV1lIK0dnYmEwVFhtamNzNzJlak1RZ0d1WFRoS0oy?=
 =?utf-8?B?clRmeTc1TXZIejJNSzhzaU9oaG9jUjFsMzk0b0dmV09WcjkxRk56bXgwMXpC?=
 =?utf-8?B?NXNNeWtaNkQ1KzdBVFMzM3A1ODZYQ2l5US81NlpXSUlvWGwvOGVEbTAxZkhs?=
 =?utf-8?B?RTZXemVaYmcwT2VWZmhBWjBMRzEvZnN1R1NUNjU2a2dmVWlCOFV1QnhseTY4?=
 =?utf-8?B?Q09Qc3Z2NUFJemFaeVYzUnQrTTNaN0dlNDJBQ1VneDFTcjBiY2MzVnlGZmZo?=
 =?utf-8?B?bXBxTWFhWmxMZWlLa2hpMkJjbFFaSFF5MWJFY29XZGE1aHZRczFPVGtiZElN?=
 =?utf-8?B?V3V0YWF1QVhUdDc5dkpxMWNSMC9PYWJUd1RDU0F5VjErdVJMdjR1aDdhazln?=
 =?utf-8?B?alNXcXpKamM5YUdmWmp4Tks2MEZ4OW9lNXpDS1IzdERXVEZMVUVZZU45bnlI?=
 =?utf-8?B?dGt4cjJnMXQ2cEJjYXh4OEpxcStxUDgvckViQldUOGRmeDNFdkhaTGYzdW5E?=
 =?utf-8?B?cEtCWS8zQ1RTRXA3d2o1NjBweFZLazQyL2pJNGpDcTgzMGVJYm1IekNtOUpn?=
 =?utf-8?B?SHZtb09Hd2RJMlA1cW8rVUp3TXVDYi9kNTV1ejY0L0dIZzJ6d050RXQ3UFdR?=
 =?utf-8?B?WlAyNjY2NzBJY240dC91VGFGK0hrUGJWMkxaRnVHMUdwSkxydUoycUJkemFC?=
 =?utf-8?B?WnBNem5ad3N1UFdJbGJYaENpTWhhT2huU1hWSTdlbWw4d1lVYVVJWHVDNm9R?=
 =?utf-8?B?STVmRFoyYlJMbVhHZVJYVEJlZDZxdlpCZEVTek84STFUcnBRb2Z6cXBHNVVQ?=
 =?utf-8?B?Zy9ORlR2RlBhNjlXRFpLWE50ZTZrTnpZTWhNSCtHTlp2WnlSYnlQbEt3TDdp?=
 =?utf-8?B?bGZvVWhxdml0Uk9XK2EwN3ZkWlNJdHFQYlhrNiswaWF2M29aQ3l2VVZoTGc3?=
 =?utf-8?B?dER6NFlhd3FETlFibjhiS3pGQjFFL041aE0zNUJxWW9sZ2gvR0VFQ2prRC8w?=
 =?utf-8?B?ZVJrWEgySDJuRFN1UXB2UWhDRHNpNU4yNkdpK0gwU1dGOFRadVQwSVZaRUZv?=
 =?utf-8?B?cWpKd3k1WDl5ZHcvMDRPUDJtdnBXZVVTTUZzUGF6WVp4S082K3lVUFJkT0ds?=
 =?utf-8?B?MUhReXhQbE9rc0FGdmtnRnU3T1dxeWsrWUdsckQ5eTFiSkdBVERtcUJrOFBo?=
 =?utf-8?Q?Dd67ViO11Cay7zW6p3NkYw4s5?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9J/g1hLBJJspCvMwQXAXsWy5Ze9PCLbZ2Fcv1qlquS1GcOHd5a5CYOIrC2GNlQqYvYcKwOIlslf5iqWpLfIwgduzZTMH1rSwxyAtpdgUHoI2lFp3MfpfOJ2WRZW4yPcujwj8H5rgveMcSY2iSOM+xqL3pWI+Rsni70C1eA1nogTgVZst4dlFjrPzz0rOLhszEwLwBewD/NPhjrOc2CoFTRUprFxOkxsl4EtLLXHXX6KX5XphYaGsRyUe0l9SB5jiHe6tlDwPaOAyHZoGNCkNISPC7h05cpIcZy2ocuZ5TeuJgnXvNJyu/fGGNsFlZpQ2B7OY2hNhfvi1M9vFetfcCx+ypxG4xydygjzQE1iaRpdCmN03wzMp+2jsuS2b4ULdpbjpbCr+3RA5LGEkEw6ITwsYI9HsB+GjTmW8SwioH4RAFW3II7tl1jGs8r+SWsCCtIPnR7FOoU//V/7iLZ+Z7DD9R7F+V13i6ueXOrag9T5+vKIQcEFYbb7/4s3JTWyA16CojOUELts/R1sRs8amafkRR6xZskd3qcDjnY76Lez+1dPOyLZWsS9CNuCpCliyFEk+nNghg8AAbuBgarHtcHVIM8TF5JEkPYw3Nm4dW34F3R3xC9eU5+YDRi3KugqTYL+gVi26ZjpCDH/vdoji/T2H/J0VKfAeXM7bHpl/0mkv1onPfESKCAtqqfzahLfu1yXQYu2/69KwmuZR+QpVGvIVWVp7H6Ig/0a31f4gOCn7HxVzvGmxciABIJfAz9gss4uEyR/2MoLR5ZDyiDSUHmFsXuvrCRxGiALIKoCu0Zxi/HBEZXIVy4ipK+6f7ebiT5tZFM/hCGnwoMu0xpvnZw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed775fcd-fe09-4301-f07e-08dac7f18933
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 16:42:23.3180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPk6UnnvlZAoLNGsZ40K621HH3WsnOVPvKS29xyXwM/KeLqPs8gFC2SJ/ojpSivOQlxSBzgjNOWGzSmZ/T5C/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6459

Currently Xen will passthrough any Local APIC NMI Structure found in
the native ACPI MADT table to a PVH dom0.  This is wrong because PVH
doesn't have access to the physical local APIC, and instead gets an
emulated local APIC by Xen, that doesn't have the LINT0 or LINT1
pins wired to anything.  Furthermore the ACPI Processor UIDs used in
the APIC NMI Structures are likely to not match the ones generated by
Xen for the Local x2APIC Structures, creating confusion to dom0.

Fix this by removing the logic to passthrough the Local APIC NMI
Structure for PVH dom0.

Fixes: 1d74282c45 ('x86: setup PVHv2 Dom0 ACPI tables')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/dom0_build.c | 34 +---------------------------------
 1 file changed, 1 insertion(+), 33 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 307edc6a8c..d44de7f2b2 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -58,9 +58,6 @@
 static unsigned int __initdata acpi_intr_overrides;
 static struct acpi_madt_interrupt_override __initdata *intsrcovr;
 
-static unsigned int __initdata acpi_nmi_sources;
-static struct acpi_madt_nmi_source __initdata *nmisrc;
-
 static unsigned int __initdata order_stats[MAX_ORDER + 1];
 
 static void __init print_order_stats(const struct domain *d)
@@ -763,25 +760,6 @@ static int __init cf_check acpi_set_intr_ovr(
     return 0;
 }
 
-static int __init cf_check acpi_count_nmi_src(
-    struct acpi_subtable_header *header, const unsigned long end)
-{
-    acpi_nmi_sources++;
-    return 0;
-}
-
-static int __init cf_check acpi_set_nmi_src(
-    struct acpi_subtable_header *header, const unsigned long end)
-{
-    const struct acpi_madt_nmi_source *src =
-        container_of(header, struct acpi_madt_nmi_source, header);
-
-    *nmisrc = *src;
-    nmisrc++;
-
-    return 0;
-}
-
 static int __init pvh_setup_acpi_madt(struct domain *d, paddr_t *addr)
 {
     struct acpi_table_madt *madt;
@@ -797,16 +775,11 @@ static int __init pvh_setup_acpi_madt(struct domain *d, paddr_t *addr)
     acpi_table_parse_madt(ACPI_MADT_TYPE_INTERRUPT_OVERRIDE,
                           acpi_count_intr_ovr, UINT_MAX);
 
-    /* Count number of NMI sources in the MADT. */
-    acpi_table_parse_madt(ACPI_MADT_TYPE_NMI_SOURCE, acpi_count_nmi_src,
-                          UINT_MAX);
-
     max_vcpus = dom0_max_vcpus();
     /* Calculate the size of the crafted MADT. */
     size = sizeof(*madt);
     size += sizeof(*io_apic) * nr_ioapics;
     size += sizeof(*intsrcovr) * acpi_intr_overrides;
-    size += sizeof(*nmisrc) * acpi_nmi_sources;
     size += sizeof(*x2apic) * max_vcpus;
 
     madt = xzalloc_bytes(size);
@@ -862,12 +835,7 @@ static int __init pvh_setup_acpi_madt(struct domain *d, paddr_t *addr)
     acpi_table_parse_madt(ACPI_MADT_TYPE_INTERRUPT_OVERRIDE, acpi_set_intr_ovr,
                           acpi_intr_overrides);
 
-    /* Setup NMI sources. */
-    nmisrc = (void *)intsrcovr;
-    acpi_table_parse_madt(ACPI_MADT_TYPE_NMI_SOURCE, acpi_set_nmi_src,
-                          acpi_nmi_sources);
-
-    ASSERT(((void *)nmisrc - (void *)madt) == size);
+    ASSERT(((void *)intsrcovr - (void *)madt) == size);
     madt->header.length = size;
     /*
      * Calling acpi_tb_checksum here is a layering violation, but
-- 
2.37.3


