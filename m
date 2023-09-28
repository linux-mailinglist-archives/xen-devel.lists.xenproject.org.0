Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7697B175D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 11:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609396.948465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlnJU-0005vo-Vh; Thu, 28 Sep 2023 09:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609396.948465; Thu, 28 Sep 2023 09:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlnJU-0005tL-RY; Thu, 28 Sep 2023 09:28:04 +0000
Received: by outflank-mailman (input) for mailman id 609396;
 Thu, 28 Sep 2023 09:28:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJIK=FM=citrix.com=prvs=6283bbd10=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlnJT-0005tF-K8
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 09:28:03 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 504abf5c-5de1-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 11:28:01 +0200 (CEST)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2023 05:27:57 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB5316.namprd03.prod.outlook.com (2603:10b6:a03:220::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 09:27:52 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Thu, 28 Sep 2023
 09:27:52 +0000
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
X-Inumbo-ID: 504abf5c-5de1-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695893281;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Yoo4vDOafjR4Mh7MJsww1hzSC+QIKXwtOqckr731rjA=;
  b=BCgcz3WJZhxeSg1A1q7wWaCrRfFZ7BYT/zy6rfMHH5VkQPvXT0MVdITc
   LZd2gDCc0Ctaj6+KH27AviA1E4CmtejVqNrOi+YENwYQjOvC7o29gdlLs
   pma6PITO3LQ/eRalesxGGlCpWvUptO+HbsdixMNKPw4s0ItdmrR2OXrPt
   w=;
X-CSE-ConnectionGUID: hfg0uwQ4QmmOA4SLqaQiyg==
X-CSE-MsgGUID: j80VDoFsQeqkhJhs1qtwNg==
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 124052886
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:jUYI5KxRO+bWnIEPiy96t+ftxyrEfRIJ4+MujC+fZmUNrF6WrkUAm
 2QXWDiBb/uLZ2GnedhxPISw9kpQvpOAm4BrQVY4pSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EgHUMja4mtC5QRvP6AT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWFA+
 qQFNwlRVxWGoMvq+5aiQ9Btl8t2eaEHPKtH0p1h5RfwKK9/BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVlVIguFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37WTxX6hCNJMfFG+3vw62GO/wUIIMRAPVluZoeLgk1Khfd0Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHsqCRSH+b3qeZq3W1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdpsLxMSH9x
 XaNtidWr5Uei9QakZqy+1/viiip4JPOS2YICh7/W2uk6kZ1YdCjbonxsFzDt68efcCeU0WLu
 2UCl46G9ucSAJqRlSuLBuIQALWu4PXDOzrZ6bJyI6QcG/2W0ybLVehtDPtWfi+F7u5slefVX
 XLu
IronPort-HdrOrdr: A9a23:Ko9u0K1dInMxOJCYZkUSlwqjBGgkLtp133Aq2lEZdPUzSL38qy
 nOpoV46faQslwssR4b6LO90cW7MAjhHL9OkO8s1NWZLXPbUGrBFvAb0WKK+VSJcE3DH4ZmtJ
 uIGJIOb+EYY2IK6foSIzPVLz/j+rS6GWyT6ts2tE0dND2CopsP0y58CgKWVlJ7XxNHA51RLu
 vg2vZ6
X-Talos-CUID: 9a23:n5PkD2CUf+l5ql76Eylp+xYJBfl5S3jY616MGGuhAF9oWbLAHA==
X-Talos-MUID: 9a23:C21UZQsiCt5AByVxGM2nhmE6Cutvzb+XBVkOkbcGoJCdKTNWNGLI
X-IronPort-AV: E=Sophos;i="6.03,183,1694750400"; 
   d="scan'208";a="124052886"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Np9QR1CMFeN8UGmHCZGd5O/HiDxogcoHoO8GoIyNzUY6Zd+xKiNZjKaQ4uqfw9sUeE/zi+0mfqltfrSyUEZV3pIV9N8PjPpJInUajE/fuJyO34abw2b98f2IadwMa7q6mqTipB1whhFsldl8pW8ULDqExOIzMFXxq8isOkbqnw5zbhNODI3WBwBhlEP2y3q7zNPs7DaVd7tuQBaxVOZZZ4hc78W07gTZU3gIOxsc4lcDVrk+g1IiO6UdkCF4K9iLK8/yRLjHlOQNqYcZcXGY/w/iMK1ZnDTbBoxhlSTcF/42wSqMDpWpzn93HYneP4mlyg4o+ERexcQqHpILJk0LoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01StaotK0HgDkezeeS6/FMdcFVkO0Ft70QaH83mTi3Y=;
 b=HB8Rh9nXubOfb3ZiwC2znzpjZVCPkM7DpAkn3+RaL9FYWOyWOJ+bfvefYzizYS10GetjSrZp/7mtCd6eNe9C6i7DfdDnXrVeknj1wgJQZOQYJvzTBWN1M4Jb9UF4ovpviPTtPPdEC9WurTf3ZQ262oi+/xbAMEhuNOz0KPvjvaSkjPSTx61I5PqPvPkXWmg2fAlYIojIn7JNbth2IppEfeR2gl0T4wV+7mFoL2cI/9jlT13XYgSxraigggWkTAFlB66n5+j3zYXK7JGgIWMYkvi88CoodOWpoCYnp+7Mzq9k1EvGwpz9nNY5r6XchJqkeWO6BGnJ45YNGZLXjRapZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01StaotK0HgDkezeeS6/FMdcFVkO0Ft70QaH83mTi3Y=;
 b=hXwDNenzQIs6M0CxIy6RH3SQTbzKfBWAFrhugWumsvvajfotsmGh3SxKEuQ+mI6w9MtYi1DJHkdtpfT0mkFunxtX5cfh/8QhBeQo+M4JMiSa0Xm73burILBUDeXrW8TDYUioFMdg0T6m1jReBAvekC/BGyuHCZ9h5mofBEFTpf4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 28 Sep 2023 11:27:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v4 1/9] x86/shim: zap runstate and time area handles
 during shutdown
Message-ID: <ZRVHE5XADO4mBtN9@MacBookPdeRoger>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
 <91db0bae-5485-680c-ef95-7316328583a2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91db0bae-5485-680c-ef95-7316328583a2@suse.com>
X-ClientProxiedBy: LO4P123CA0598.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB5316:EE_
X-MS-Office365-Filtering-Correlation-Id: 2823fc2b-c93c-4aae-55e1-08dbc0053081
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hRA2U12I5wXKE7QB6AB2xCLzHNeYBPU/pKXCP15EDpHpA3+0Uwr5hfHlMq1uuHNRo4TZOFo0UCV5+XLeYcvrKOT3E36d6eyi4Odwl/4W8PwrftXbieRxaiqxj0qna+y5yZLGLcl1lco+mCEP0lhODtQ57uPBHG3CsNLTBqMgGYnk6NmCd23vXl1dhqmezOKxACZbDb0q4ggbgrJF0iaW6XXA6RjbnxoOlJuy4gaVMrtV2jBMaPOuKlMRM8Spj4lWY83PPNqb1EC96cMgEkB4fICfxo59G6LZ1m4ugys1tsKY898FNzq7p+DDPE3HEszIrJnqm6NEqpEoo6r9Eee6lOcvsYC7DTrUnC0vwOTZLYklTHCQO+aOl5oKam9XLSBzfFbxKu9f2Whfs512X8kEskGY5HNuKf5SVe545TIN3utYkxSAFzQMClyQGbjCM+3EuAZ/ltX5TOtqUnfu6f1pz29K7TLUmaSbmw+EkQgSdunS2rHiP3+15O6boC4dxYn2P1z7UNHwAUtfobAY9hLrgcBEo4NP5UQWJCSwixEXw7cTJLW6cPaL/D9VQ3yE7nwm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(346002)(39860400002)(396003)(366004)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(66946007)(6486002)(26005)(6506007)(9686003)(6512007)(85182001)(82960400001)(86362001)(38100700002)(8936002)(8676002)(4326008)(316002)(6916009)(83380400001)(41300700001)(66476007)(66556008)(54906003)(5660300002)(2906002)(4744005)(33716001)(478600001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVNnVHZjd0FFbUtJcmZENExkT3BMQVVUMnJaS1BPMEpKWHBOa3pLT3U3dmtx?=
 =?utf-8?B?QzdHdFErcVVNOEZyTWhHb3cxRHRMZ2g1MnZpZDNIR3FIL0hTTStSQXEzaEk1?=
 =?utf-8?B?Z2ZqczduMlgxcDYzMlg3aEpxTVRuRUs3SFJuUU53OEh0S3FQSk5XYmlOc1g1?=
 =?utf-8?B?dGlyL0xQZVI3ZmY4eWlHMVh6MWFZbFBNeXgwYmt3cXRMckR0TXhJSGFMNnhK?=
 =?utf-8?B?SktmM2htR3FmK3ZPekRKY3RnUkhlNDFuK0VNbFZUYVlvOGk5aHI3OGNDclNB?=
 =?utf-8?B?TmJQdU9VVG5tOW1YaEYrTHVqemMwVnU3TEI4Q1dCOTE0RDRmeXBQVEt2RTlX?=
 =?utf-8?B?cU42dzYyT28vTUZhM0FTNzcrS3Jkb1g5a0hmS1hOZ0NEb1NJRGw4Ti92RU04?=
 =?utf-8?B?TGtab2diTURtbXFlVmNZbzhQazBESFh4aVl6UkUyUWJIRUVBVytDbjBaWS9J?=
 =?utf-8?B?RUxwQ08yNDJRSlNhNml5MU1qTGkvM2t0dHFpZ1A3cnY3NUtyYlFSMzQzMHhn?=
 =?utf-8?B?MHV0Rjg1bHFJSVBCNVVpMlF5bEtkNjY0S3BTbFA0QXZ4bTgzZ2h1SDNHSjdr?=
 =?utf-8?B?Yk0rQ2ZTZkRlVlVWTnFqaTNGSG96Nll1b2QrSVFDMXBkKzY2WlhqdUhkUWty?=
 =?utf-8?B?b2lnWTJrSEcwZDNjRVRlTnMrM2dhVUZUWVVTNVlnQ1dldDFlNjJNalVhN0Yw?=
 =?utf-8?B?TnhSSkJpMlU4dDFuYjZtWTlQNlRoem8wUUJyS0lOVWJCWTE5REVySnF2Yjdl?=
 =?utf-8?B?U3UvOVRrUEY5dDhGL085bXJhcU81Sko2NExlbk02VG82QWtzS05NMEVyS2lU?=
 =?utf-8?B?Y0dNR1h0RjRuZ2VNUUIrNXk3Y2RFYkRvNU5kM0FqOHJ6cFdZeEVOWkgzTFJ2?=
 =?utf-8?B?VGl6SVlVMmlWb3d0V2tha1lNdEpnUW9aQXJsOThKQnozWmlOOGVPSU5rSGNz?=
 =?utf-8?B?V01rWVdvcW0yU2F0cHlaZDVWME0rWllSN3c0Q0J1SnovT1ZlN1dnVnJRVGhE?=
 =?utf-8?B?WnF2OXBETE42UjBEb0lKL3M3UEdZdUZOWm13bElmZWFSNDJ6N3ZLL1ZWMkdq?=
 =?utf-8?B?WWVYWGxXMUloKzdHbzZuTmVvQkRwaGM1MUxMb1lVYlpVZG1GNUthaEdLc25m?=
 =?utf-8?B?QXphSHV4c2x4YjJCa0tjK1p1bjQ0d1FQWWR2NlRoWi8vc0VFUjhVaWVoZ3c4?=
 =?utf-8?B?Y3FtbHQ3Y1ZlaUYwRjlvQitLNnRWUS9mVEh3SlN2bzBCUGNpcUQ2cmNjUUo2?=
 =?utf-8?B?YnhGQjBRTThpdVoydE1SMGYvcVFLOFV3aHhzS3RDR0NZaEx6MUtYZmhQeDhU?=
 =?utf-8?B?ZC9LTEhUMS9MOXpwQnNFS3daeVFxdUV0N2lIWXBTLzN6aWZ2L3VDWjFnTkRw?=
 =?utf-8?B?ckNXcEg1OCtlenlNcUtsVWg4cHdrS3hCMWltcDJPZVVRSW9HRlZBdldSd3NV?=
 =?utf-8?B?YW5paHdrWnU5dDRGZDJWT0dWODZZb3MzNWxzQkRpSTZWMmZ5UkE3RHFaY1BB?=
 =?utf-8?B?dzMyOWorMTRTYWdSbk1GWlNueG5JNk5hK3ltUGEzb3VudjRpc3ZOdEFnSDlx?=
 =?utf-8?B?MGlRZUhUSGpMT3lyK05jUjhtVm9UZVJDVWFqak5hakxGVkkrM1hjNkJla1cr?=
 =?utf-8?B?YlE0UjJuS25rUi9VbDY3bER6N2dqa0IvSk4zL0ZqT2VXODByd05qWDh0VkZ1?=
 =?utf-8?B?R3JEZUlRQnRPci9CeW5LQzF1TTBRQXZtS2x0TExjeExISVNEb2FiaGhNZzJr?=
 =?utf-8?B?Rk5jSWJBMkNMaWNXMUN1V3FtSHlNMkh3UnlHdlhJN2F5dzFHUTRmeENIMmdy?=
 =?utf-8?B?TFFHaWhUWXpsYXZCRmNHTVpYdHZ0cVlGbWNFUFpuQzRsYUJyd1dTRGxqK2lH?=
 =?utf-8?B?USs4S1ZCMmN5UGJ6SEV3SFZ5ODFhaUVDcXFIWGlTLzhUaFVRTDZzRngwZzU4?=
 =?utf-8?B?NmpKMC94SzR5OHRUR3JLaUZiWFZTd3RDOExoUTJ5YjVzcTdqcUdndWdYc0JG?=
 =?utf-8?B?Yi9ra0ttUDRkRDlyd1NJaS82WjdqYVpObVV2R3VJd3FpRUtJeGJYSlNyN2Fw?=
 =?utf-8?B?RGlNZFNrR3Z5YVNYUk1PK1hFYTRMVXEyT2VHWGNtTVYrNHZVNWFWMFRsZ0NW?=
 =?utf-8?B?UnBVajYzQXp5dU5oTmpsdVJybjNiejBJUWxoQ094aUFYc1JqaEtCdENlTXhH?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p5+iJtOoMSWorC+XzTCHoRxArK4t64gtwjNYnger+pNtS5zWm7wMwXIK+I+ZT24UUMW1+iIeiRzaDgT6sqLpKu3VN0rReYXFuHdmSYzZ0KAwZWJg+QewIOgTZv8M9I8lLGP1hUjjFZUGgGzZCs6b39Bo4GrjFoh359CLdnUMYke2ywLYOJ4ZbCEWus9k7LHCgtO1gKY8k/Hbt5/7dTbVv6Vh/RqhVeM/kMnJdstmQMCllR2v0rqHNvhg7IGxn2HUC7sAeBDJd3RzPYnLKn2cED+OC1cV+jSXRkQGSSIaHLZeQaUcxja0m9gHn5gcd6SWduQXqEhmdyk13fN0M2+SXjz2bXDt7phbtQc/WbSMqcHU6C0gN43zFAJGG6C7wIcz2raCjtDRY6cjErFk2A7jgkEVka3u+ueBKJhC/2Y5R2BZV83b93eA0g8FenVWS9TWZDM0Wv5q5rUJIswQIlhpsK4wxFYvPAuIOwfUzvhUM/ZmjZildLVh8OOntOLHIeLScEOrfbJpdP7hKcevpELCwjOpbkcIiuAXsN4yBGVteVLaA8KZeEG0Wa/bfiUdJyKXy2aB6y86vgJ4Mp6fG6+y2t0FT8gJZSgnGfvI2+bIlJf0sE+1wA/16+lckFCVA1q/V42B08M/KS+j/Z11HKj2cM+C23SSWc4bB643p62TAEeHo4q8hrp24OZa8FyKAVeShWi8APbL64xashd31c8q5UKcWdjh+3471S+8gt5Pea0MyW9f5VC56vpmMYseZvcDgThFn8mlwIqZXYmpmzPGNerWcpU3UhLEINdwMiJJpcXbRG80zRN14Z3xVl/FHFVmHsGyYxLQpiZlJ+IGks2q2tJbXDfv3QIrXWLhTTawMle4MPl0cqnLXgVy/v2oFUMO
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2823fc2b-c93c-4aae-55e1-08dbc0053081
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 09:27:52.5729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K22oXkzdAxZmHSqDgkewWBhhEsO4imJ6oyxR6bCaHyNTR+u5XsBQO0+MTa7NBEs3PHU85dM4ovdMiYmleVO/aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5316

On Thu, Sep 28, 2023 at 09:01:53AM +0200, Jan Beulich wrote:
> While likely the guest would just re-register the same areas after
> a possible resume, let's not take this for granted and avoid the risk of
> otherwise corrupting guest memory.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

