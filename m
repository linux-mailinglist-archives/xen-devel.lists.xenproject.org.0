Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF258B46B
	for <lists+xen-devel@lfdr.de>; Sat, 27 Apr 2019 21:59:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hKTQu-0007d8-33; Sat, 27 Apr 2019 19:56:24 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.107])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <test-bounces@lists.fedoraproject.org>)
 id 1hKTQr-0007d1-IC
 for xen-devel@lists.xensource.com; Sat, 27 Apr 2019 19:56:21 +0000
Received: from [46.226.52.196] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 74/16-24446-4E3B4CC5;
 Sat, 27 Apr 2019 19:56:20 +0000
Authentication-Results: mx.messagelabs.com; spf=softfail 
 (server-16.tower-284.messagelabs.com: transitioning domain of 
 lists.fedoraproject.org does not designate 148.163.156.98 as permitted 
 sender) smtp.mailfrom=lists.fedoraproject.org; dkim=pass (good 
 signature) header.i=@onbmc.com header.s=mail; dmarc=fail (p=none sp=none 
 adkim=r aspf=r) header.from=redhat.com
X-Brightmail-Tracker: H4sIAAAAAAAAA1VTYUwbZRjm613bY3DNrXTyCjUkTXDMpR2HxMA
 /xYTNuE1iTJY55nYdt7ZLKU2vDYXECAndSEHCSLOwWioKGYMgxLEJNECQbGwDxgZmcTqFdNMO
 iDolKBgIendfQfnz5Hnf5/3e5/ku31GE9jN1GsV73bzLwdkNql1koC1kNj7tu1mc3bapyZsLP
 Fe/jg71N0TUReh9pc1hLvOeVlpHA6nOPw96f++OEFXo0wI/2kVpmR4EsWBEjYsWBPUNi4QfJV
 LA5ELT311KLCwg6Ji4GJ+qVsD47IACFzUI2p5/Hj/yKkTq+pQSJ5kciA5OkZgXQt1Vn7yKZB4
 Q8F3tohoL70J1Swzhw8XQ/ySmxlwDMwtrsgMwPgR9k2MqLISUMDh6BPNK2Aj8pcDcBY013ygx
 90DndFB21jLTChiZz5J4IvMOzDZNygYq5mW4damdwCEy4cHAlLyHZoogshmQeQrzBjzq/0MOp
 2OOQXThmRLPsDD662Ny68b1K1fit9dD1+OfVTh0VAHVtQ/lgpC+cUf7SHwKoPmTNXkrwzAQbh
 9UNKKcoFgSYsC6oU4iKJvshruXfyJx/zB8sTRNYL4PfP3rasz3w42+EMI8C1p/GEE7+5Q83xs
 5sHOl1E6Hjk3q/9OtKKkL5ZldNovVXcrZ7EY2O9vIsjlGNj/fyOZkm7hKo9nEe4zlvOA2siau
 XDAJFaVn7CUmB+++hsRHWOK87R1A9/2WMfQipTDsoc9/fLNYqzGXlVRYOcF6yuWx88IY0lOUA
 ejrX4rabhdv4b1nbXbxJW/JQCUbdPRb10SZFpxcqWCzYGkCHaM2FqItBPXbqoQrF56IePXRUx
 FDvpiI1+cljMj49bKIWtJR5uDTUulGyY2R1lk9jm2zrT9nFr2UlkKjhIQEbbKTd5Xa3Dv1JZR
 KIUMK/ZUUKtnmcG9nWhLjKsS4JZ1jUlw395+UVoU8zwq+jerL9d/rszSB00mv/Vgx1EsWNQ1n
 Jobu9Hx40jC+PHfvHBee7C46PrP3F9If0rHFa225zZc+KhyyDITDSen3gylHp9ZH1z/QFLYfv
 3hCp6NeIAoOLI5fcXkNvC9Dv1r7dvc8XTk44XuY+89w1b09w5mh5pnY3JvvZdRHnQZSsHLsK4
 RL4P4FjKoxoTQEAAA=
X-Env-Sender: test-bounces@lists.fedoraproject.org
X-Msg-Ref: server-16.tower-284.messagelabs.com!1556394976!542099!1
X-Originating-IP: [148.163.156.98]
X-SpamReason: No, hits=0.9 required=7.0 tests=newsletters: ,
 DATE_IN_PAST_24_48,HTML_50_60,HTML_MESSAGE,UNPARSEABLE_RELAY
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13360 invoked from network); 27 Apr 2019 19:56:18 -0000
Received: from mx0a-00030c01.pphosted.com (HELO mx0a-00030c01.pphosted.com)
 (148.163.156.98)
 by server-16.tower-284.messagelabs.com with AES256-GCM-SHA384 encrypted SMTP;
 27 Apr 2019 19:56:18 -0000
Received: from pps.filterd (m0103492.ppops.net [127.0.0.1])
 by mx0a-00030c01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3RJrhH4001412; Sat, 27 Apr 2019 14:56:11 -0500
Received: from chu1x9dlp02.cust.transunion.com ([66.175.240.251])
 by mx0a-00030c01.pphosted.com with ESMTP id 2s4m4t94a5-8;
 Sat, 27 Apr 2019 14:56:11 -0500
X-AuditID: 0adc1a4a-0b5ff70000000bc8-89-5cc4b3da5efd
Received: from cho1w9mx01.corp.transunion.com (chu1w9ap04.cust.transunion.com
 [10.220.26.121])
 by chu1x9dlp02.cust.transunion.com (Symantec Messaging Gateway) with SMTP id
 85.E1.03016.AD3B4CC5; Sat, 27 Apr 2019 14:56:10 -0500 (CDT)
Received: from cho3w9mx10.corp.transunion.com (10.216.40.175) by
 cho1w9mx01.corp.transunion.com (10.219.26.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.1591.10; Sat, 27 Apr 2019 14:56:10 -0500
Received: from Pickup by CHO3W9MX10.corp.transunion.com with Microsoft SMTP
 Server id 15.1.1591.10; Sat, 27 Apr 2019 19:48:42 +0000
X-Original-To: bzinfra@transunion-qa-mail.onbmc.com
Delivered-To: bzinfra@transunion-qa-mail.onbmc.com
DKIM-Filter: OpenDKIM Filter v2.11.0 chi3-smtp-1.onbmc.com EA762409C4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onbmc.com; s=mail;
 t=1556296641; bh=f1AvRP7YaiPE1brt4z6L+Mhkv5RpKXX4R9hKtdFKIFI=;
 h=References:In-Reply-To:From:Date:Subject:To:CC:Reply-To:List-Id:
 List-Archive:List-Help:List-Post:List-Subscribe:List-Unsubscribe:
 From;
 b=DLgkgLONiRJg3dUxmrHUQtGeX+7M2F/BLL9kJ9/3zy+i9oH9k+6Fvqe2fWGMp9Yce
 k39SQkD5LZSUKD3HO+m1yi7ZGWhpVIBhriGtP2OIRJws/U0xj9swmYEhgzRLpGmYZ+
 RuoDyZjJj0/H+R08H5thliFGfAZY6x7wFiTHQcOU=
DKIM-Filter: OpenDKIM Filter v2.11.0 bastion01.phx2.fedoraproject.org
 169586149B25
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 mailman01.phx2.fedoraproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=HTML_MESSAGE,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=disabled version=3.4.0
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TxmzOQ2EcLO56WNw9UIIACWZAKJVg/htEy76ze6Osj8=;
 b=VPR7ucb6wB4dMog70zayGBi69uwxuWVUQ4PY312zFSVcbd9ir4+werKAgiWNfP+3C6
 xUT3R086w9CXBhn0QqSA1sqN5XkKDNNnlbzRpb8+YOC4tY4+7PMPaHwOo1K2A8Gvb0MX
 3KvB0VqyXYHr2ZWwKe0zuAV0Ro8osQAA+UcKDOQmiMdbwmfYsEBCX5PKnV7QD8OohSe4
 ueMO8LGrHM593X5z7KYOeA5Dse2JC2doqc5tGf6G9VEW66bPkS+Hggr8VrLohSRRRTnc
 6/TJC4EpkoOalsqjlrF5l5mS+CfVV4oh9xvw9/JZjjsMHegl6npNTFjERyy4suKC9fw+
 MyLQ==
X-Gm-Message-State: APjAAAUyYmWUxBgNEok+r9HVZPSJ0EDR8MNHWJ9R/j8smITH+FZ9NXdZ
 iQ/JDmXciHv0p+KhNjB9YbX+ZVKEfVeOvhG+F/y/C5XY
X-Google-Smtp-Source: APXvYqzxfFa7tQzmrVl5V2pUVmxcPmiUOGrJaqqqby1rLodCH+eacnE1CbhdEEndaagYRnJBJi9M7hHxRkHuNalxtYU=
X-Received: by 2002:a9f:2f1a:: with SMTP id x26mr23034017uaj.20.1556296622416; 
 Fri, 26 Apr 2019 09:37:02 -0700 (PDT)
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <CACJDEmq4rp7C3EMD2j7+5yi5R_Na_6ejuZhH4aY2=d+g6dBNbQ@mail.gmail.com>
 <1499372357.22465.108.camel@fedoraproject.org>
 <60eb4374d39aa140f82d94dc4dbf40548be87be1.camel@fedoraproject.org>
In-Reply-To: <60eb4374d39aa140f82d94dc4dbf40548be87be1.camel@fedoraproject.org>
From: Geoffrey Marr <gmarr@redhat.com>
Date: Fri, 26 Apr 2019 10:36:50 -0600
Message-ID: <CAO9z1z9S1FE49VJUbOVAy0XWOsfYrXVKgq541fd9eA4eYUsauA@mail.gmail.com>
To: For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>
Message-ID-Hash: PZSKYIP32GLPJ2JHTF4DKJ2AFDO62HXO
X-Message-ID-Hash: PZSKYIP32GLPJ2JHTF4DKJ2AFDO62HXO
X-MailFrom: gmarr@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop;
 banned-address; member-moderation; header-match-config-1;
 header-match-config-2; header-match-config-3;
 header-match-test.lists.fedoraproject.org-0; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Archived-At: <https://lists.fedoraproject.org/archives/list/test@lists.fedoraproject.org/message/PZSKYIP32GLPJ2JHTF4DKJ2AFDO62HXO/>
List-Archive: <https://lists.fedoraproject.org/archives/list/test@lists.fedoraproject.org/>
Content-Type: multipart/mixed; boundary="===============3491000516847798279=="
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-26_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=30
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=161 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904260113
X-CrossPremisesHeadersFilteredBySendConnector: cho1w9mx01.corp.transunion.com
X-OrganizationHeadersPreserved: cho1w9mx01.corp.transunion.com
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSa0iTYRTHefa+216nw6dVdphBMDKscDrtg5V0MZAhkpZEYJoOfXGmTtt0
 KH3R0C4zxUxXaqaUmYqiaKLOSpHCRDMrb3kDLe+3LAnF1Nz7LMhvv/M//3PO/4GHoSRDfCkT
 oYljtRpVlEwgokXD0kSnwdq3gS51hQ7uJc8mkPtWco/APbW4R+g+mr0kPEMra8rvCpQrLxeR
 sj7DJFQuTwzSfnSAyCOMjYrQs1rnUyEi9Z/5DF7shjLhR4WJSkKFngZkxQA+Bllr5XwDEjES
 PINgvO0+TYoUHvRPrlo6qQiqKr7xzSMSrICmhQ1Ext3AlFbL6TR2hbHGTpqwF6SVpnLDNO6n
 4FNT7XaDYRAOgSmjlHguQnLBJDLLgIPgVZc9WSmGjuw2gXkU8C0E6XUDiBQlfDA8yBYQ1w2o
 M6xZQmghM+ULn7AejAOliKTu5kFS7zrXsMK+8DmrQ2hmAT4E74zFFEnhAN0NnTwzi7EfmDaz
 Od6Nz8JA/TJ3YA++DGPTU3ziUUDLwhD97/X3VkoowvuhfGjCEnuMB8l3ermCwtUI5vPnLVEB
 HuWvcowxhifFjbxMpMjbLqnt4819lXQed2QXtOd+p4nuA5WzXRThw5Bavy4kfBTqah8jwo5Q
 NPwG7dQZzl9lct650izbw4tN5n93EbIuRwdC1fGKhONhUbEurvLQeF2cPE6r0ujiNRExGnlo
 THQNIr/RuwH1JbOtCDNIZiM+MbgVIOGr9LrE6FZkz9CyfeKg1dkrEhyuimMjWTaW1QZr46NY
 XSviMVbSJGR3TfH+uZPnluxq78/RmIjcoI5f/tb+/Qnnvu6VigoPnv9g69I74t+nXN44KXGE
 m7d9FWpUVdZsDC5Tewe/ng5Mn/MRF7WU8b2qg/Wz6+3944UBNrbh7MzpyBy2y+O6m8nr9+CM
 8/QleUaOvKDK7eni0sdwu+nhzhHDwwv1c5XjMlqnVimOUFqd6i9LFbBxbgMAAA==
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-27_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904270142
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>
Cc: Konrad Rzeszutek Wilk <konrad@kernel.org>,
 "Xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3491000516847798279==
Content-Type: multipart/alternative; boundary="000000000000583a510587718bae"

--000000000000583a510587718bae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: Quoted-printable

Since F24, I haven't seen or heard of anyone who uses Xen over KVM anywhere=
=0D=0Aother than this thread... I'm +1 for making this test an "Optional" o=
ne.=0D=0A=0D=0AGeoff Marr=0D=0AIRC: coremodule=0D=0A=0D=0A=0D=0AOn Fri, Apr=
 26, 2019 at 10:33 AM Adam Williamson <adamwill@fedoraproject.org>=0D=0Awro=
te:=0D=0A=0D=0A> On Thu, 2017-07-06 at 13:19 -0700, Adam Williamson wrote:=
=0D=0A> > On Thu, 2017-07-06 at 15:59 -0400, Konrad Rzeszutek Wilk wrote:=
=0D=0A> > > > > I would prefer for it to remain as it is.=0D=0A> > > >=0D=
=0A> > > > This is only practical if it's going to be tested, and tested=0D=
=0A> regularly=0D=0A> > > > - not *only* on the final release candidate, ri=
ght before we sign off=0D=0A> > > > on the release. It needs to be tested r=
egularly throughout the=0D=0A> release=0D=0A> > > > cycle, on the composes =
that are "nominated for testing".=0D=0A> > >=0D=0A> > > Right, which is why=
 I am happy that you have pointed me to the right=0D=0A> > > place so I can=
 be up-to-date.=0D=0A> >=0D=0A> > Great, thanks. So let's leave it as it is=
 for now, but we'll keep an=0D=0A> > eye on this during F27 cycle. If we ge=
t to, say, Beta and there are no=0D=0A> > results for the test, that's gonn=
a be a problem. Thanks!=0D=0A>=0D=0A> So, for Fedora 30, this was not teste=
d throughout the whole cycle. I=0D=0A> think we can consider the proposal t=
o remove the criterion active=0D=0A> again.=0D=0A> --=0D=0A> Adam Williamso=
n=0D=0A> Fedora QA Community Monkey=0D=0A> IRC: adamw | Twitter: AdamW_Fedo=
ra | XMPP: adamw AT happyassassin . net=0D=0A> https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttp-3A__www.happyassassin.net&d=3DDwIBaQ&c=3D7gn0PlAmraV3=
zr-k385KhKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv93UP9vnr8eu60CE0D59mXL5=
aZaU&m=3DWso3Gcx6oZ0BRw6fM7ccgCIIQBJIL03_klkoHs0Kvzc&s=3Dd0It2stGWgMiVtQsuz=
JvX0B1PvcuixTsKBMel8Xv19E&e=3D=0D=0A> _____________________________________=
__________=0D=0A> test mailing list -- test@lists.fedoraproject.org=0D=0A> =
To unsubscribe send an email to test-leave@lists.fedoraproject.org=0D=0A> F=
edora Code of Conduct: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__getfedora.org_code-2Dof-2Dconduct.html&d=3DDwIBaQ&c=3D7gn0PlAmraV3zr-k38=
5KhKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=
=3DWso3Gcx6oZ0BRw6fM7ccgCIIQBJIL03_klkoHs0Kvzc&s=3DgUFNGYXOT8O32mSSAa7628lH=
KMabf5-s51VkuZv_oXQ&e=3D=0D=0A> List Guidelines: https://urldefense.proofpo=
int.com/v2/url?u=3Dhttps-3A__fedoraproject.org_wiki_Mailing-5Flist-5Fguidel=
ines&d=3DDwIBaQ&c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgILH=
-vnIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=3DWso3Gcx6oZ0BRw6fM7ccgCIIQBJIL03_kl=
koHs0Kvzc&s=3DdfoNjmw1QDdJgcL76zfFERFW_GilBAAJZhhJgi8haO8&e=3D=0D=0A> List =
Archives:=0D=0A> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lis=
ts.fedoraproject.org_archives_list_test-40lists.fedoraproject.org&d=3DDwIBa=
Q&c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv93UP9=
vnr8eu60CE0D59mXL5aZaU&m=3DWso3Gcx6oZ0BRw6fM7ccgCIIQBJIL03_klkoHs0Kvzc&s=3D=
subAg4A0t2Sr5zbZrDFfwO9t_EZfceHLn7SAgut15aY&e=3D=0D=0A>=0D=0A=

--000000000000583a510587718bae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: Quoted-printable

<div dir=3D"ltr"><div>Since F24, I haven&#39;t seen or heard of anyone who =
uses Xen over KVM anywhere other than this thread... I&#39;m +1 for making =
this test an &quot;Optional&quot; one.</div><div><br></div><div><div><div><=
div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature=
"><div dir=3D"ltr"><div>Geoff Marr</div><div></div>IRC: coremodule<br></div=
></div></div><br></div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Apr 26, 2019 at 10:33 AM Adam William=
son &lt;<a href=3D"mailto:adamwill@fedoraproject.org">adamwill@fedoraprojec=
t.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Thu, 2017-07-06 at 13:19 -0700, Adam Williamson wrote:<br>=0A&gt; O=
n Thu, 2017-07-06 at 15:59 -0400, Konrad Rzeszutek Wilk wrote:<br>=0A&gt; &=
gt; &gt; &gt; I would prefer for it to remain as it is.<br>=0A&gt; &gt; &gt=
; <br>=0A&gt; &gt; &gt; This is only practical if it&#39;s going to be test=
ed, and tested regularly<br>=0A&gt; &gt; &gt; - not *only* on the final rel=
ease candidate, right before we sign off<br>=0A&gt; &gt; &gt; on the releas=
e. It needs to be tested regularly throughout the release<br>=0A&gt; &gt; &=
gt; cycle, on the composes that are &quot;nominated for testing&quot;.<br>=
=0A&gt; &gt; <br>=0A&gt; &gt; Right, which is why I am happy that you have =
pointed me to the right<br>=0A&gt; &gt; place so I can be up-to-date.<br>=
=0A&gt; <br>=0A&gt; Great, thanks. So let&#39;s leave it as it is for now, =
but we&#39;ll keep an<br>=0A&gt; eye on this during F27 cycle. If we get to=
, say, Beta and there are no<br>=0A&gt; results for the test, that&#39;s go=
nna be a problem. Thanks!<br>=0A<br>=0ASo, for Fedora 30, this was not test=
ed throughout the whole cycle. I<br>=0Athink we can consider the proposal t=
o remove the criterion active<br>=0Aagain.<br>=0A-- <br>=0AAdam Williamson<=
br>=0AFedora QA Community Monkey<br>=0AIRC: adamw | Twitter: AdamW_Fedora |=
 XMPP: adamw AT happyassassin . net<br>=0A<a href=3D"https://urldefense.pro=
ofpoint.com/v2/url?u=3Dhttp-3A__www.happyassassin.net&d=3DDwMFaQ&c=3D7gn0Pl=
AmraV3zr-k385KhKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv93UP9vnr8eu60CE0D=
59mXL5aZaU&m=3DWso3Gcx6oZ0BRw6fM7ccgCIIQBJIL03_klkoHs0Kvzc&s=3Dd0It2stGWgMi=
VtQsuzJvX0B1PvcuixTsKBMel8Xv19E&e=3D" rel=3D"noreferrer" target=3D"_blank">=
http://www.happyassassin.net</a><br>=0A____________________________________=
___________<br>=0Atest mailing list -- <a href=3D"mailto:test@lists.fedorap=
roject.org" target=3D"_blank">test@lists.fedoraproject.org</a><br>=0ATo uns=
ubscribe send an email to <a href=3D"mailto:test-leave@lists.fedoraproject.=
org" target=3D"_blank">test-leave@lists.fedoraproject.org</a><br>=0AFedora =
Code of Conduct: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__getfedora.org_code-2Dof-2Dconduct.html&d=3DDwMFaQ&c=3D7gn0PlAmraV3z=
r-k385KhKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv93UP9vnr8eu60CE0D59mXL5a=
ZaU&m=3DWso3Gcx6oZ0BRw6fM7ccgCIIQBJIL03_klkoHs0Kvzc&s=3DgUFNGYXOT8O32mSSAa7=
628lHKMabf5-s51VkuZv_oXQ&e=3D" rel=3D"noreferrer" target=3D"_blank">https:/=
/getfedora.org/code-of-conduct.html</a><br>=0AList Guidelines: <a href=3D"h=
ttps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__fedoraproject.org_wik=
i_Mailing-5Flist-5Fguidelines&d=3DDwMFaQ&c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0d=
wockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=3DWso3Gcx6o=
Z0BRw6fM7ccgCIIQBJIL03_klkoHs0Kvzc&s=3DdfoNjmw1QDdJgcL76zfFERFW_GilBAAJZhhJ=
gi8haO8&e=3D" rel=3D"noreferrer" target=3D"_blank">https://fedoraproject.or=
g/wiki/Mailing_list_guidelines</a><br>=0AList Archives: <a href=3D"https://=
urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.fedoraproject.org_arch=
ives_list_test-40lists.fedoraproject.org&d=3DDwMFaQ&c=3D7gn0PlAmraV3zr-k385=
KhKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=
=3DWso3Gcx6oZ0BRw6fM7ccgCIIQBJIL03_klkoHs0Kvzc&s=3DsubAg4A0t2Sr5zbZrDFfwO9t=
_EZfceHLn7SAgut15aY&e=3D" rel=3D"noreferrer" target=3D"_blank">https://list=
s.fedoraproject.org/archives/list/test@lists.fedoraproject.org</a><br>=0A</=
blockquote></div>=0A=

--000000000000583a510587718bae--

--===============3491000516847798279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: Quoted-printable

_______________________________________________=0Atest mailing list -- test=
@lists.fedoraproject.org=0ATo unsubscribe send an email to test-leave@lists=
.fedoraproject.org=0AFedora Code of Conduct: https://urldefense.proofpoint.=
com/v2/url?u=3Dhttps-3A__getfedora.org_code-2Dof-2Dconduct.html&d=3DDwIGaQ&=
c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv93UP9vn=
r8eu60CE0D59mXL5aZaU&m=3DWso3Gcx6oZ0BRw6fM7ccgCIIQBJIL03_klkoHs0Kvzc&s=3DgU=
FNGYXOT8O32mSSAa7628lHKMabf5-s51VkuZv_oXQ&e=3D=0AList Guidelines: https://u=
rldefense.proofpoint.com/v2/url?u=3Dhttps-3A__fedoraproject.org_wiki_Mailin=
g-5Flist-5Fguidelines&d=3DDwIGaQ&c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0dwockj5vI=
sr5Sw&r=3DF8DgILH-vnIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=3DWso3Gcx6oZ0BRw6fM=
7ccgCIIQBJIL03_klkoHs0Kvzc&s=3DdfoNjmw1QDdJgcL76zfFERFW_GilBAAJZhhJgi8haO8&=
e=3D=0AList Archives: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=
__lists.fedoraproject.org_archives_list_test-40lists.fedoraproject.org&d=3D=
DwIGaQ&c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv=
93UP9vnr8eu60CE0D59mXL5aZaU&m=3DWso3Gcx6oZ0BRw6fM7ccgCIIQBJIL03_klkoHs0Kvzc=
&s=3DsubAg4A0t2Sr5zbZrDFfwO9t_EZfceHLn7SAgut15aY&e=3D=0A=

--===============3491000516847798279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3491000516847798279==--

