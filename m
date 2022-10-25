Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A76660D077
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 17:24:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429922.681277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLmk-0005DP-Cz; Tue, 25 Oct 2022 15:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429922.681277; Tue, 25 Oct 2022 15:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLmk-0005AS-9E; Tue, 25 Oct 2022 15:24:10 +0000
Received: by outflank-mailman (input) for mailman id 429922;
 Tue, 25 Oct 2022 15:24:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bJBo=22=citrix.com=prvs=2902c4af2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1onLmh-0005AM-Qu
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 15:24:07 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e79d111-5479-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 17:24:06 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2022 11:24:01 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6506.namprd03.prod.outlook.com (2603:10b6:303:125::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 15:23:59 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 15:23:59 +0000
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
X-Inumbo-ID: 0e79d111-5479-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666711446;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hg3W6/4qqFM0NA8tanJ+geRPfeUzmo6bWcsqZaPHbDg=;
  b=dXVK5T8xBdNTY8nQGAEkxw+5Mq/2F31fjSNHJ0pIqo6hKcYKjW+CN/VM
   GQtVkOvnIHNHLsYKCQGoIxa3mpuO4WE9+sLWoi8rj8Vh3EiACGAYXMO5t
   PTi5swGZ9lgtcZnoIb2G3+wDMcldG1EPrHrr4l7ZXCipaJBzydWW0WVGE
   Q=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 83491442
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A8jPezahvyrjapi3sGBy1fEQ1X17brhtd9Lp4u?=
 =?us-ascii?q?6ucsGZSdtCo9fiXrREDcFrAX2WIxW/j1+WfGzWLvwv/H6Du2j2ifQID4o8Ju?=
 =?us-ascii?q?2P6zlksR+abM4At7a5sNiYR7i4uhsItnFTuUsX/wzN8BJ2GtxSt1XszJr/cI?=
 =?us-ascii?q?ODWCayKYZdqMPmC3cCAlYY6OnreM4rqpxYTdGCirf80P3gj6rZny8VsK14x2?=
 =?us-ascii?q?j2iU4olvUjf+rGIhdYHRFH2EcfFnXWulGfLd3G9q155ZlsYxv1NlxwFcpSDX?=
 =?us-ascii?q?/FfONdiy4y1X3t75ZwtNpE4z7kXBjrVdVUPzlDJ31ljxK5pgbh/Su5Y/wmU3?=
 =?us-ascii?q?gK17YOdjE5HJ92gWVzIgDZkTlM75SM/QXSeC2Vlgha84vEz3MXf+574JOXxO?=
 =?us-ascii?q?eTFY7SyYCuLUd1VNbA+kAy5IiHFXAmsjat8VNQyRPkM7d3D9TzCdHIiPOyn+?=
 =?us-ascii?q?YF6RGFOI2UQKVaWZlXx80EhWO6jOS9ikQsH/vWGwDZwd5JN0hYMsbMLMX9Dq?=
 =?us-ascii?q?R8I2Cn0AqGmCtIz4CQZdTHee27Qq9+pFVS+hyu6YjR4A+vdHe8e/2kXA3jUh?=
 =?us-ascii?q?4yzQ4G+H0dVDyAD0yL9GL+HEt2UycyOLFiRSEO8/xlkKoWwoAsaosDK7ugT7?=
 =?us-ascii?q?kdoN9tskMi4Tg5TIsqNCiBLECOJ9rFZzgBoFG4oADQBRPiewx1Cqps5WZXzz?=
 =?us-ascii?q?WsodNthpSXlV/h5jgrf59fd8ro2h5s9ggoL2BUeEd/Tk8yWaM9wZneWD946R?=
 =?us-ascii?q?AMxhLoiHKAnenyK/jxHhUFHti5lbWEikbjqY7pKCEHlwb9q/yXERHx1oZyQp?=
 =?us-ascii?q?y35wBBXzkoZg7+jBHzeBMATqnYKPdj3fmiSAtrNQ0D64O6NkF+sM9S+qDYmx?=
 =?us-ascii?q?fnz/Nm5ElvkSoVD4hVokXKB60YUHcdiwHPxWahj50JEtpyHZQUkw4xl7BQQ1?=
 =?us-ascii?q?dannpZLb7oP2++Cfc0XQMSEdjg8C9/ljukwApkodQcuR79bW9wmLOW3/1sEG?=
 =?us-ascii?q?yOPA1daO6RRiDgq2jCuS5jrEDdV81skXUEVWyVO9yuiPUa8VWhxvf8WKxRxk?=
 =?us-ascii?q?X5U3iohFBHPNYb7UEBAx69iJbASrSuTF/6NQ3c5XFls3y4DD04EIU0yNTuRC?=
 =?us-ascii?q?mLailhBqhTO6+5BPH7hCK/ADOvrDNXZBdE2YAYSFiGJ9ieDa3p8mZLJL1gyj?=
 =?us-ascii?q?bUyANLiiwD/CEbcqrhCt6bBx+DS5cSszziJ/ukb7nONXde5WGfNL4VdBXndD?=
 =?us-ascii?q?gMidMoS+0gvVUns3KxAc4KSpn0HMyKX9CbrByhUOokuvhQmrIuiGMDqxUni4?=
 =?us-ascii?q?7XITieDN6ywb0wxqnke7JPL/56UxKwMP8ipJf2jZGnLITtXL233XfncBUqrE?=
 =?us-ascii?q?Xki4CryYHuaMrwfo97c6ozOM7s/DS8T2JBOguWmbkHE1Rr22sE9EDSqJA4ZT?=
 =?us-ascii?q?kpmdY/Copgr051qBJHirLPlK8ma/N+UfbxOVhJjwY99Y+M4IGfcpQ0veVNdD?=
 =?us-ascii?q?Ut+xlD5dJJFsdJwa5bdn80+oRK2fWU6EV4I0427prvbXaVVU6a/dKj+DI6MW?=
 =?us-ascii?q?IGs4igmnmqU1l4UYOsVpHiuoTmvGvXWfLh8e70rS8a+iG4YdZ3blvEmyDY2J?=
 =?us-ascii?q?glJKyE2qPFWu96BXCsXyHSLpXlQR243xTo6Y9nIC0gUjTfff9PBLxwLrWRcA?=
 =?us-ascii?q?Hwa1/3gLcK8LKR/uLe1oYsJRSBqsP6kt4+nH6D+lpFhJoIwJ40M+c8BJWPI7?=
 =?us-ascii?q?ZKu+2Kgk35riDr38JcOeqoLSWHmbiR3E8xbBheLlZNQW+ta3svQSD97pzveL?=
 =?us-ascii?q?Q/rauf9WGH3ye4AwisTF/zv7AlgPifKGs8GMntoSV1YlXuVUIqM/1FntefJQ?=
 =?us-ascii?q?G+fr1EkdhawQRbVe3tekrIstjjCPJmmfBYj3IinYzLzU60juqcSREjGIjRT3?=
 =?us-ascii?q?uZo+j6xFZuS/fzvBVeeMGdFIW5o3BJYnmv5VqeJIrtZHqNPiRkYndDDVUmoC?=
 =?us-ascii?q?U4dCVRywIxmbwsEIZUY7/GVfDMjSf4gzfsRD2WO5T9A0BVt2wJ2EsjE9tzZG?=
 =?us-ascii?q?1wiDcsntnldObZ+T0PE42UmmmfdQ2F1UhyiUyLTZCFbs5IbLqzeqB5z1XZhG?=
 =?us-ascii?q?HGcW9H6QIxvvd6ObmulL9zE+mEI4KhXHj+BJEMJ6h8LDV6UkNtmuKNHnuWy+?=
 =?us-ascii?q?IoJB6cNxXNsZy5PNL2qZbUNZMph72Kwd7I86c2yhRvqP1nRIj2RiTqL1IRpX?=
 =?us-ascii?q?pM+roKPT0MdjxWOjNavx2jSAmI3DbCxC8c26ez0aO054LG1PWI6MVAL/e78J?=
 =?us-ascii?q?D4FL6Es1PxmIn5UscQ7KKG/TQb55sYfOuUUUQgG3F9EQvzWcFyys4rz/Yaqt?=
 =?us-ascii?q?/TYM4UQT/tdWzPMKrxeSsZW7dBjC2haDbI5xleYtQD5S9cpjIrT9cdqgO487?=
 =?us-ascii?q?oKsxa3IbnhwavjG6sMRFDGQ/t4k1Y4tGLfdt/kWNjBmUuj3rL5uA52h7Scka?=
 =?us-ascii?q?k2V?=
X-IronPort-AV: E=Sophos;i="5.95,212,1661832000"; 
   d="scan'208";a="83491442"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0MsOL3oRIwUeCUuJOnZdrTe62kvEAM+9FysIk4VCJAU0ulZQZbh2EvB6IUUstA38BaDVsIX2xaA7NRogAlIT+0+3sYnRXAGaRRpbI8ansHaK794nLUCxFycNRAx7iy8HR/ws72Pk9/KHFhx5cwvg7/7kOASWYO1Vuj/wJrbxVVy+fHNeWWo8XlHC33csXLTAfxifrEzUwD5xLUfP9oTLZooAzQadfMdUK/A7d/H6Sq2KD8k7BJzNHfnsoCtRJoq9eRv4gQOQJ8pv08HBSeGvvb/Tfxzbq489QLGnvbIBm2VjL8fHaMnWpUUqy79eoJ+fx7/C6UUcqWJiWplWLS9rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/88wvwer32U7YwhPNUHSKw72rNArH639qgiKLW7EDBU=;
 b=kN0tnVFCrvQdtODytCiIG71Ojqwh6YalRHFn17Un7UgHZqOQCo8jlSjBH0uFEMUqKhAABp/HnEyL2VMTQug6V5ODDiZeccFzhMuc0NF1wwVx/X3w37SXVgd75QI+YVp1XDoZoc3+zGnN7LrErlW91G/z8KcKJl9V/DqYcMyzqZJI1bRxdEWZ5/qTExtU6TAGKf9CrfSb2DjAYdHxPKe0AgM8lkSHX6Qp8X81n5K7TEfGsD9VhAMwbFfrJYZYa0DHxowyf1YN5mtjSGYnOSurT2Y4VarsFQ9uy6j1bS599Z8IAHCagYNFV4mZ/ytA+cQUdCJJRic2iFd62aoZRnP+Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/88wvwer32U7YwhPNUHSKw72rNArH639qgiKLW7EDBU=;
 b=l/hL0KyrSQzGoa8W0zrt0xbTtAyl0zVZnF4gwg2H+7dfpeotX3XmIO6Kl8u0/goX1exPJrwldU9OMuD89D5mfrIp9VBNT33JZwUtaia94v6IAVO+O3QHtmu4aCUJH4uYhIezLJ6ssSvvy5oxCHakFXLBRYLqsNKE+QLQpABo5z8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 25 Oct 2022 17:23:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH][4.17?] x86: also zap secondary time area handles during
 soft reset
Message-ID: <Y1f/iQaugcmhiP+0@Air-de-Roger>
References: <c80390e6-b9c2-e15a-b513-ec97e8329ad8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c80390e6-b9c2-e15a-b513-ec97e8329ad8@suse.com>
X-ClientProxiedBy: LO6P123CA0025.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: 964d0480-cd56-40af-69f2-08dab69cefde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hNL70W0EokkFumRR+Wz0LkazVVJ0WXIjzrDqCZtaxcNMoHEGaV8wpCJMJu/0mPPAqP0N7FL7QvlUWsVlq1nxnHeFnKmbJVwyMxXFmhEdLd2EzwyNgy59zdgEeydQ3oIzyS+Tc3hVifuu7U0lXYGhxu7d8Z79tgPEau/NEaVzqCC8nJZ7ZylfSOTUKowFOefA0AF9hZdFhzHG91+ZZ/LTmWV0fhvGePX2ix/M9J49Z9Z3/G4Ws+a5mv0MA3s9tQEHC5YxVGydae7KuR5xOAcEyt1PJx90BnuxhwJ1zt6B+TCy6aPy3+S2g2UWxsun7+vO1erahNEstcjqZZu/B0MlccXd/pFOiA+pKQpvBn8LDWMOJ8mriN80PmTJ2BIuTKv6ME2b3aC4BxfLsQ1Cry3oHqky/ShBOcFzK33eXkZQF+fCP5mVgqoIPiFL1ZiAXZ5QGLcL/WQ+3JW6mwlyn9dgmHymz8eq7DjXsDGVgSwExsu69yMifrEyQ2vdcyJMA2kKY4WYlNxE71TLnNfNXW+I3zbbXgButN3wXP8QsvGLHU6N9gGciwhBZdRmbYCjRkeopXykaM0t6yS3Hnimx1k5v8sBB4+01jW6bDJiEgQQvfA7plbwFT/l/XnX5PzH4SbDVFqf/yzpIUiq9Dy21SJed1TecEgn8gEYJj8z2eED5qHNr5IAxW5NclAALLUH+7zqQrOWYt+0n6uyu6OI6vM9BA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199015)(86362001)(85182001)(82960400001)(38100700002)(186003)(2906002)(6666004)(6506007)(26005)(9686003)(6512007)(478600001)(6486002)(33716001)(54906003)(6916009)(316002)(66946007)(66556008)(66476007)(8676002)(4326008)(41300700001)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHN1SkEyTzRlMXRkRTRyMzNqUHJ0SC92aHdLbGJYZXlwVCtvaGMyMlJsZ1ZK?=
 =?utf-8?B?R010OXF0U1NYU3dMa1pzUHJtWU1WejV3ZjRPZXV5YUl6dm9vNEwyTER2c1l1?=
 =?utf-8?B?bzZGdnFMTkxVS1JIVk95L21BUkNnVXZVM3BKTTloUHlVT1ZiQ2w3QkhiQXo2?=
 =?utf-8?B?R0lXZ2tMWVBuM28wZW96a1QxTVkrdDB3L0FVanp0cEVMWGNWZnAvaDFlRkpu?=
 =?utf-8?B?eCtmbzVZV0Z5eHJxcTNQdmU3WHY0eEg5OVNiVXB3bFB4M0ZPYTFWZFNUTjZI?=
 =?utf-8?B?d2ZSWTlGTEJqZFN5T2VjTllrWGw1MUxzb3I3bGVXMWRWVGhXMmxyRUxKSnFj?=
 =?utf-8?B?T3VDZ2svNTlpaGZwZjFjKy9VNGZBaXpZbEpEeDBndFhCVkp0MWhhU1ZHNUs1?=
 =?utf-8?B?b3RFQ0JOY3pvK29UL3QwMlBiK05MNGJ5ZnF4N1doZzNsb20xQ0ljVXpGNW5L?=
 =?utf-8?B?aC9oaFl0YzdZNGlsVHpnbGJaeTNCbUEvL0d2MXhXOUZ3RkgxQ3V6N1dnMnRK?=
 =?utf-8?B?Nkk4OUFwU0J5dEF2a2cxU2IzVWY0VWx4SktwWWpLWHZKbndpQmxNeTc2YWVG?=
 =?utf-8?B?M1Jic0FscUg3Uy9oOGE4SFlSL3hxS0VOdzI2R1I0OUdNZjgyR25jOHhjL2tr?=
 =?utf-8?B?L3NwNHlvZnB2UUdRSW05UGpwNGNKamtLSWkwOXRrTnYvVVhQQXlsTTlWOVB5?=
 =?utf-8?B?enZjZnFDR3I0MzVuUTJ2bCtaODFGNVhnRnFkVkEwZFM1YWlRb3kzbGVHZ002?=
 =?utf-8?B?TkhwL2tRaU05NWE3bUIxSWdjc2tpam5zc21JVi9uT3JGRDIxUUlGbzRISDhN?=
 =?utf-8?B?VGxtN2ZrUHA5dzRteG84OFk1WnYxVDk5bnptOXk0MDRQRVdUcnp4WTdOaCtE?=
 =?utf-8?B?dnlhdyszMS83a0Zlem8rUFI1K015a055MlZjbmQwc3NISFhiRmo4VHZacUR5?=
 =?utf-8?B?YzZBbm5UQ0JleWVNT2hKUWlkN0dXUk5EdTQ4aVpuOGpQQmg1cVJoclBwQ0NI?=
 =?utf-8?B?Wnc5NjJVMFdjTUplQUpkRTJtdDhQSlQra3Q1czFUM24zN01nZ3o2ZTFDNjg0?=
 =?utf-8?B?RWlsbS9ZR0VKQTZ3amlQM1ZjeHpkOU03OHBBNkIvZjZ6TnFoTmF6bHVnRXp2?=
 =?utf-8?B?WjJ0bWlXSGlGa2R6Y1I5ZzYrWnNWYm5QN1dTOERqMzF4MFNpaGdqR3dVWWsr?=
 =?utf-8?B?UXBsWllHQVVxdzF6NXZqaEFRbUdVVTBoa3VTSFNCd1piQ2hwWXkvamNBbnM3?=
 =?utf-8?B?M3RmYmViNG5uWm1mNXUyYjE4aWowVUZKTzMySTdYTFZhVmRjV2UxWDRKOTQx?=
 =?utf-8?B?UjZ6ODEvQ0t5bHptUlVTSkpwbkR3YWwrZlNJSGV3a1RSV0JpaHBvRWxHaUNR?=
 =?utf-8?B?UzYwZFQvZ3VFd2IvRm5DUVlaNEZoMlFZMm9JUG43SE5oZHZTNzVPSXMxVGFJ?=
 =?utf-8?B?dVFrTnAzSUg4VFJpa2RzakRJTVEvYUNYaS9yNW9TaGtTdHR4dnhMbnB3RzlP?=
 =?utf-8?B?cHdLc05ZclRJeVJYTWVDdEJ1cEdhYTI3ZENMNWR1ZlN4a1p0MlhZOC8rYjNW?=
 =?utf-8?B?alRub1QwTUZnVTZ3SDBYcDVZSFFoSnlacEp4Nnp0M2xMTFFTL0VjdGF1aExo?=
 =?utf-8?B?UWVpdmMyTnZVeTkwK2NKSUF0OHJ2aCs0VUliZUh6d3dCeGt4cHFVSnZLamRM?=
 =?utf-8?B?NENDaUthOHdNOUtoYVhUZU1FcUxrZnZyU25YMU5iL3BTYUh1a29PVXBVN29W?=
 =?utf-8?B?cUR5djZBalFKd3Evc1huZGc2UVo5Vy9PN2RGODMvclJuREJveTRqOEI4VjQw?=
 =?utf-8?B?ZVpDdFhQSEVOaGQ3WFBaTzV2OWVxU1JoNVhsanhON2w5S3MxMGpaZlIwdnRv?=
 =?utf-8?B?djcvSGxJeTdHT2ovNzR2eStwZ2pvdW43TElvaThYZWtCL3JNN1M3QW0wRlhh?=
 =?utf-8?B?NW1ValJ5Q2VVVWZnN1FDTmpDRXNTWDRmdGxicFB3U2pKbEZRUmt1ZGloTDBS?=
 =?utf-8?B?dmxaU1VNVFZxOEhOVENmYkMvbHBiZ0hINUtSZkVFRERoeTJNTGlheDhPamdt?=
 =?utf-8?B?T0c0ckpJQUhQMlZXVk1Fazk3eUlYa25oR3d5dXNGY1lOYzI1L09tcjl4c0xX?=
 =?utf-8?B?OUN4VTAzRE9aYlhjWUtkcUNOUmk0R0JwaFdpdlVTeGNGdmRqMzNaWXRDcys1?=
 =?utf-8?B?S2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 964d0480-cd56-40af-69f2-08dab69cefde
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 15:23:58.9954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L55QP4jsYmQv4pH1PlWSYQ7lq9h0xs2/+XEU71oFhkd8p4QLF00Mgio5Lb67opXVSjwMrBVknh9IlNSrwCgQPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6506

On Thu, Oct 13, 2022 at 08:48:21AM +0200, Jan Beulich wrote:
> Just like domain_soft_reset() properly zaps runstate area handles, the
> secondary time area ones also need discarding to prevent guest memory
> corruption once the guest is re-started.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> To avoid another for_each_vcpu() here, domain_soft_reset() could also
> be made call a new arch_vcpu_soft_reset() out of its already present
> loop. Yet that would make the change less isolated.
> 
> In domain_soft_reset() I wonder whether, just like done here, the
> zapping of runstate area handles and vCPU info mappings wouldn't better
> be done after all operations which can fail. But perhaps for this to
> matter the domain is left in too inconsistent a state anyway if the
> function fails ...

We would need some kind of recovery anyway, so given the current code
and lack of recovery it doesn't seem to matter much.

> However, at the very least I wonder whether x86'es
> restriction to HVM shouldn't leave PV guests undisturbed if a soft-reset
> was attempted on them. Right now they not only have state partially
> clobbered, but (if the arch function is reached) they would be crashed
> unconditionally.

It's a toolstack initiated operation by a domctl, so I'm fine with
saying that it's up for the toolstack to prevent soft resets from
being attempted against PV domains.  Would be nice to reject the
operation earlier on the hypervisor, maybe by moving
arch_domain_soft_reset() earlier in domain_soft_reset() so that we
can return without crashing?

In any case it's unlikely for a domain that was attempting a soft
reset to survive the hypervisor rejecting the operation, so it doesn't
matter much whether the domain is crashed by Xen or left as-is I would
think.

Thanks, Roger.

